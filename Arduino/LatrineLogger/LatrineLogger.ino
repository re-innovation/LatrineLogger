/********************************************************
/****** Latrine Logger **********************************
/****** Based on:      **********************************
/****** DataDuino - Arduino DAQ UNIT ********************
/****** by Matt Little **********************************
/****** Date: 29/5/14 ***********************************
/****** info@re-innovation.co.uk ************************
/****** www.re-innovation.co.uk *************************
/********************************************************

  See www.re-innovation.co.uk for information and construction details
  This implements capacitative sensor for flushes.
  If the sensor is positive then it will record the various data values to an SD card.
  
  This is designed to interface with a sensor unit designed by James Fowkes.
  It is based upon the DataDuino, along with an astable 555 timer circuit.
  
  The 555 timer is counted on pin D5 (Timer1 pin)
  The RTC interrupt is on pin D0 (Interrupt 1)
  The battery voltage is read on A0
  The LED output is attached to pin D4
  A calibrate mode is entered by a switch on pin D7
  
  The LatrineSensor object has a Setup() function that needs to be run in the Arduino setup(). 
  This is where it configures Timer1.
  The library sets up Timer1 to count from the T1 external input. This is Arduino pin 5.
  The library now expects and assumes that its Update() method will be called exactly once per second. 
  If there's significant deviation from that, there will be inaccuracies in the calculations.

/*************Details of Code*****************************

  The DataDuino is an Arduino based SD card datalogger.
  A PCF8563 Realt Time Clock is used to timestamp the data.
  
  
  Data is written to a .csv file created on an SD card.
  A new file is created each day. If file alreay present then data is appended.
  The file name is created from the reference number and the date in the format:
  RXXDXXXX.csv, where RXX is the reference number and DXXXX is the date in the format DDMM. 

  When in calibrate mode:
  You can adjust the parameters of the device using serial commands. These parameters are stored in EEPROM.
  These are:
  R??E
  This will change the reference number to ??
  T??????E
  This will change the time to HHMMSS
  D??????E
  
  Updates: 
  30/10/12 Code written - Matt Little
  31/10/12 writing code description and sorting out new sample timings - Matt Little
  19/9/13  Getting code to work on Arduino 1.0.5 - Matt Little
  19/9/13  Updated the Rtc_Pcf8563 to work with Arduino 1.0.5 - Matt Little
  19/9/13  Changed getData and sortData to 'listen' for serial data - Matt Little
  19/9/13  Removed all references to temperature - not needed - Matt Little
  23/9/13  Changed format of data - Matt Little
  25/1/14  Changed for counting Poo recording unit - Matt Little
  25/1/14  Added Time and Date updating via serial - Matt Little
  25/1/14  MCP1703 3v3 regulator has 2uA I when not in use - no problem - Matt Little
  27/1/14  Added sleep mode and wake up via UART - Matt Little
  16/2/14  Testing with JamesF data unit - Matt Little
  19/2/14  Testing sleep modes current consumption - Matt Little
  19/2/14  Changed data format to include temperatures and duration. Matt Little
  29/5/14  Changed to Capacitance sensor. Matt Little
  18/6/14  Added JamesF code for sleep modes - Matt Little
  18/6/14  Attach output from 555 timer to timer1 input - D5
  18/6/14  Swap LED from Pin D5 to pin D4 (D5 needed by 555 timer)
  18/6/14  Use internal reference for voltage monitorin - Matt Little
  18/6/14  Attach Interrupt for RTC 1 Hz clock - D2?
  18/6/14  RTC 1Hz pulse controls Update() for sensor (MUST be 1Hz)
  18/6/14  Ensure sleep mode does not switch off system clock (what mode?)
 
  To DO:
  Swap resistors for battery voltage measuring
 
 //*********SD CARD DETAILS***************************	
 The SD card circuit:
 SD card attached to SPI bus as follows:
 ** MOSI - pin 11
 ** MISO - pin 12
 ** CLK - pin 13
 ** CS - pin 10
 ** Card detect - pin 6
 
 SD card code details:
 created  24 Nov 2010
 updated 2 Dec 2010
 by Tom Igoe
 
 //************ Real Time Clock code*******************
 A PCF8563 RTC is attached to pins:
 ** A4 - SDA (serial data)
 ** A5 - SDC (serial clock)
 ** D2 - Clock out - This gives a 1 second pulse to record the data
 
 RTC PCF8563 code details:
 By Joe Robertson, jmr
 orbitalair@bellsouth.net
 
**********************************************************************************************************/


/************ External Libraries*****************************/
#include <stdlib.h>
#include <Wire.h>          // Required for RTC
#include <Rtc_Pcf8563.h>   // RTC library
#include <SdFat.h>            // SD card library
#include <avr/pgmspace.h>  // Library for putting data into program memory
#include <EEPROM.h>        // For writing values to the EEPROM
#include <avr/eeprom.h>
#include <avr/sleep.h>
#include <avr/power.h>
#include <LatrineSensor.h>

/************User variables and hardware allocation**********************************************/

LatrineSensor sensor = LatrineSensor(onFlushStart, onFlushEnd);

/******* SD CARD*************/
#define chipSelect 10 // The SD card Chip Select pin 10
#define cardDetect 6  // The SD card detect is on pin 6
// The other SD card pins (D11,D12,D13) are all set within SD.h
int cardDetectOld = LOW;  // This is the flag for the old reading of the card detect

// SD file system object
SdFat sd;
//Log file
SdFile datafile;  

//File datafile;   // The logging file
String dataString;    // This is the holder for the data as a string. Start as blank
int counter = 0;   // Clue is in the name - its a counter.
long dataCounter = 0;  // This holds the number of seconds since the last data store

/*************Real Time Clock*******/
Rtc_Pcf8563 rtc;
#define I2C_RTC 0x51 // 7 bit address (without last bit - look at the datasheet)
#define RTCinterrupt 0  // RTC interrupt - This is pin 2 of ardunio - which is INT0

/********* I/O Pins *************/
#define LEDred 4      // The output led is on pin 4
#define calibrate 7   // This controls if we are in serial calibrate mode or not
#define batteryPin A1  // For monitoring the battery voltage
#define timerPin 5      // The pin for the 555 timer input

///********* Battery Voltage ****************/
float batteryVoltage;        // Temporary store for float
char BatteryVoltStr[5];      // Hold the battery voltage as a string

// ****** Serial Data Read***********
// Variables for the serial data read
char inByte;         // incoming serial char
String str_buffer = "";  // This is the holder for the string which we will display

/********** Thermistor Data Storage ************/
#define thermistor A0  // This is the analog pin for the thermistor
float TempC = 0;  // This holds the converted value of temperature
char TempCStr[6];  // A string buffer to hold the converted string

// enumarating 3 major temperature scales
enum {
  T_KELVIN=0,
  T_CELSIUS,
  T_FAHRENHEIT
};
// Manufacturer data for episco k164 10k thermistor
// simply delete this if you don't need it
// or use this idea to define your own thermistors
//#define EPISCO_K164_10k 4300.0f,298.15f,10000.0f  // B,T0,R0
//#define GT_Thermistor_10k 4126.0f,298.15f,10000.0f  // B,T0,R0
#define Vishay_Thermistor_47k 4090.0f,298.15f,47000.0f  // B,T0,R0

//********Variables for the Filename*******************

char filename[] = "DXXXXXX.csv";  // This is a holder for the full file name
char deviceID[3]; // A buffer to hold the device ID

long sampleTime = 2;  // This is the time between samples for the DAQ
                      // Sample time is stored in EEPROM in locations 2 & 3

volatile boolean writedataflag = HIGH;  // A flag to tell the code when to write data

int flushSeconds=0;    // Holds the number of seconds for the flush

// Varibales for writing to EEPROM
int hiByte;      // These are used to store longer variables into EERPRPROM
int loByte;

// These next ints are for the filename conversion
int day_int =0;      // To find the day from the Date for the filename
int day_int1 =0;
int day_int2 =0;
int month_int = 0;
int month_int1 = 0;
int month_int2 = 0;
int year_int = 0;  // Year
int hour_int = 0;
int min_int = 0;
int sec_int = 0;

boolean calibrateFlag = HIGH;  // This flag is lowered if we are in calibrate mode (switch ON)
boolean debugFlag = LOW;    // Set this if you want to be in debugging mode.

boolean rtcInterrupt = false;

//**********STRINGS TO USE****************************
String comma = ",";
String date;        // The stored date from filename creation
String newdate;     // The new date, read every time 

// These are Char Strings - they are stored in program memory to save space in data memory
// These are a mixutre of error messages and serial printed information
const char headers[] PROGMEM = "Reference, Date, Time, Flush Seconds, Vbatt, Temp";  // Headers for the top of the file
const char headersOK[] PROGMEM = "Headers OK";
const char erroropen[] PROGMEM = "Error opening file";
const char error[] PROGMEM = "ERROR ERROR ERROR";
const char initialisesd[] PROGMEM = "Initialising SD card...";
const char dateerror[] PROGMEM = "Dates are not the same - create new file";
const char reference[] PROGMEM = "The ref number is:";
const char noSD[] PROGMEM = "No SD card present";

#define MAX_STRING 80      // Sets the maximum length of string probably could be lower
char stringBuffer[MAX_STRING];  // A buffer to hold the string when pulled from program memory


/***************************************************
 *  Name:        RTC
 *
 *  Returns:     Nothing.
 *
 *  Parameters:  None.
 *
 *  Description: I use the CLK_OUT from the RTC to give me exact 1Hz signal
 *               To do this I changed the initialise the RTC with the CLKOUT at 1Hz
 *
 ***************************************************/
void RTC()
{ 
  
  // This wakes us up as it detatches the interrupt
  detachInterrupt(RTCinterrupt);
  dataCounter++;
  
  if(writedataflag==LOW&&dataCounter>=sampleTime)  // This stops us loosing data if a second is missed
  {   
    // Reset the DataCounter
    dataCounter = 0;  
  }
  
  rtcInterrupt = true;    // Set the flag true to show it came from this interrupt
}

/***************************************************
 *  Name:        enterSleep
 *
 *  Returns:     Nothing.
 *
 *  Parameters:  None.
 *
 *  Description: Enters the arduino into sleep mode.
 *
 ***************************************************/
void enterSleep(void)
{

  attachInterrupt(RTCinterrupt, RTC, RISING);
  
  sleep_enable();
   
  set_sleep_mode(SLEEP_MODE_IDLE);  
 
   /* Disable all of the unused peripherals. This will reduce power
   * consumption further and, more importantly, some of these
   * peripherals may generate interrupts that will wake our Arduino from
   * sleep!
   */
  power_adc_disable();
  power_spi_disable();
  power_timer0_disable();
  power_timer2_disable();
  power_twi_disable(); 
  
  sleep_cpu();
  /* The program will continue from here. */
  /************* ASLEEP *******************/
  
  // ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ //
  
  /************** WOKEN UP ***************/
  /* First thing to do is disable sleep. */
  sleep_disable();
 
   /* Re-enable the peripherals. */
  power_all_enable(); 
}


/***************************************************
 *  Name:        setup
 *
 *  Returns:     Nothing.
 *
 *  Parameters:  None.
 *
 *  Description: Setup for the Arduino.           
 *
 ***************************************************/
void setup()
{
  sensor.Setup(); // MUST be called to start counting!
  Serial.begin(115200);
  Wire.begin();
  
  //******Real Time Clock Set - up********
  // A4 and A5 are used as I2C interface.
  // D2 is connected to CLK OUT from RTC. This triggers an interrupt to take data
  // We need to enable pull up resistors
  pinMode(A4, INPUT);           // set pin to input
  digitalWrite(A4, HIGH);       // turn on pullup resistors
  pinMode(A5, INPUT);           // set pin to input
  digitalWrite(A5, HIGH);       // turn on pullup resistors
  pinMode(2,INPUT);    // Set D2 to be an input for the RTC CLK-OUT   
  //initialise the real time clock
  Rtc_Pcf8563 rtc; 
 
  //initialisetemp();  // Initialise the temperature sensors
  pinMode(LEDred,OUTPUT);    // Set D5 to be an output LED
  digitalWrite(LEDred,LOW);
  pinMode(cardDetect,INPUT);  // D6 is the SD card detect on pin 6.
 
  //Set up digital data lines
  pinMode(calibrate,INPUT_PULLUP);
 
  // Battery voltage sensing
  pinMode(batteryPin,INPUT);
  
  // 555 sensor input
  pinMode(timerPin, INPUT);           // set pin to input
  digitalWrite(timerPin, HIGH);       // turn on pullup resistors
  
  // Put unused pins to INPUT to try and save power...   
  pinMode(9,INPUT);    
  pinMode(A2,INPUT);
  pinMode(A3,INPUT); 
  
  setupRTC();  // Initialise the real time clock  
  
  initialiseSD();    // Inisitalise the SD card   
  createfilename();  // Create the corrct filename (from date)

  // Read the reference number from the EEROM
  deviceID[0] = char(EEPROM.read(0));
  deviceID[1] = char(EEPROM.read(1));
  
  // Read in the sample time from EEPROM
  hiByte = EEPROM.read(2);
  loByte = EEPROM.read(3);
  sampleTime = (hiByte << 8)+loByte;  // Get the sensor calibrate value 
  
  analogReference(EXTERNAL);  // Use 1.1V input for potential divider.
  
  attachInterrupt(RTCinterrupt, RTC, RISING); 
}

/***************************************************
 *  Name:        main loop
 *
 *  Returns:     Nothing.
 *
 *  Parameters:  None.
 *
 *  Description: Main application loop.
 *
 ***************************************************/
void loop()
{
  
  if(writedataflag==HIGH)
  {      
    pinMode(LEDred,OUTPUT);    // Set LED to be an output LED 
    digitalWrite(LEDred, HIGH);   // set the LED ON  

    // *********** BATTERY VOLTAGE ***************************************
    // From Vcc-47k--47k-GND potential divider
    // This is to test in case battery voltage has dropped too low - alert?
    batteryVoltage = float(analogRead(batteryPin))*(3.3/1024.0)*2.0;        // Temporary store for float
    dtostrf(batteryVoltage,2,2,BatteryVoltStr);     // Hold the battery voltage as a string
 
    // *********** TEMPERATURE *****************************************
    // Two versions of this - either with thermistor or I2C sensor (if connected)
    // Thermistor version
    // Get the temperature readings and store to variables
    TempC = Temperature(thermistor,T_CELSIUS,Vishay_Thermistor_47k,47000.0f);
    dtostrf(TempC,2,2,TempCStr);  // Convert the temperature value (double) into a string

    
    // ******** put this data into a file ********************************
    // ****** Check filename *********************************************
    // Each day we want to write a new file.
    // Compare date with previous stored date, every second
    newdate = String(rtc.formatDate(RTCC_DATE_WORLD));  
    if(newdate != date)
    {
       // If date has changed then create a new file
       createfilename();  // Create the corrct filename (from date)
    }    

    // Here we create a data string to write
    // Subtracting '0' converts from ASCII to real number
    // The headers are: "Reference, Time, Date, V, Voltage, I, Current, P, Power"
    dataString =  String(deviceID[0]); 
    dataString += deviceID[1];
    dataString += comma;
    dataString += newdate;
    dataString += comma;
    dataString += String(rtc.formatTime());
    dataString += comma;
    dataString += flushSeconds;
    dataString += comma;
    dataString += BatteryVoltStr;
    dataString += comma;
    dataString += TempCStr;  // Temperature (Thermistor)  
    
    // ************** Write it to the SD card *************
    // This depends upon the card detect.
    // If card is there then write to the file
    // If card has recently been inserted then initialise the card/filenames
    // If card is not there then flash LEDs

    if(digitalRead(cardDetect)==LOW&&cardDetectOld==HIGH)
    {
      delay(100);  // Wait for switch to settle down.
      // There was no card previously so re-initialise and re-check the filename
      initialiseSD();
      createfilename();
    }
    if(digitalRead(cardDetect)==LOW&&cardDetectOld==LOW)
    {
      //Ensure that there is a card present)
      // We then write the data to the SD card here:
      writetoSD();
    }
    else
    {
       Serial.println(getString(noSD));
    }   
    cardDetectOld = digitalRead(cardDetect);  // Store the old value of the card detect
    
    // Finish up write routine here:    
    digitalWrite(LEDred, LOW);   // set the LED OFF  
    writedataflag=LOW;
    Serial.flush();    // Force out the end of the serial data
  }
  
  // Want to check the SD card every second
  if(digitalRead(cardDetect)==HIGH)
  {
    // This meands there is no card present so flash the LED every second
    for(int x=0;x<=5;x++)
    {
      digitalWrite(LEDred, HIGH);   // set the LED ON
      delay(5);
      digitalWrite(LEDred, LOW);   // set the LED ON
      delay(50);     
    }
  } 
  
  // A Switch on D7 will set if the unit is in serial adjust mode or not  
  //calibrateFlag = digitalRead(calibrate);  
  
  if(digitalRead(calibrate)==LOW)
  { 
    
    detachInterrupt(RTCinterrupt);
    rtcInterrupt = false;    
    
    // We ARE in calibrate mode
    Serial.println("Serial Mode");    
    getData();
    delay(1000);  // Some time to read data
    //Serial.flush();    // Force out the end of the serial data
    
//    // Need to check about flushes, even in calibrate mode
//    uint16_t freq = sensor.Update(); // Call once every second
//    Serial.println(freq);     
    
    // Reset all the data collection values
    dataCounter = 0;  
    writedataflag=LOW;
    sensor.Setup(); // MUST be called to start counting!
    
  }
  else
  { 
    // Here we check to see if a flush has been sensed:
    if (rtcInterrupt == true)
    {
      rtcInterrupt = false;
      uint16_t freq = sensor.Update(); // Call once every second
      Serial.println(freq);    
    }
    
    // Then we go to sleep
    attachInterrupt(RTCinterrupt, RTC, RISING); 
    enterSleep();     
  }
  
}

// Set Up RTC routine
void setupRTC()
{
    // This section configures the RTC to have a 1Hz output.
  // Its a bit strange as first we read the data from the RTC
  // Then we load it back again but including the correct second flag  
  rtc.formatDate(RTCC_DATE_WORLD);
  rtc.formatTime();
  
  year_int = rtc.getYear();
  day_int = rtc.getDay();
  month_int = rtc.getMonth();  
  hour_int = rtc.getHour();
  min_int = rtc.getMinute();
  sec_int = rtc.getSecond(); 
  
  Wire.begin(); // Initiate the Wire library and join the I2C bus as a master
  Wire.beginTransmission(I2C_RTC); // Select RTC
  Wire.write(0);        // Start address
  Wire.write(0);     // Control and status 1
  Wire.write(0);     // Control and status 2
  Wire.write(DecToBcd(sec_int));     // Second
  Wire.write(DecToBcd(min_int));    // Minute
  Wire.write(DecToBcd(hour_int));    // Hour
  Wire.write(DecToBcd(day_int));    // Day
  Wire.write(DecToBcd(2));    // Weekday
  Wire.write(DecToBcd(month_int));     // Month (with century bit = 0)
  Wire.write(DecToBcd(year_int));    // Year
  Wire.write(0b10000000);    // Minute alarm (and alarm disabled)
  Wire.write(0b10000000);    // Hour alarm (and alarm disabled)
  Wire.write(0b10000000);    // Day alarm (and alarm disabled)
  Wire.write(0b10000000);    // Weekday alarm (and alarm disabled)
  Wire.write(0b10000011);     // Output clock frequency enabled (1 Hz) ***THIS IS THE IMPORTANT LINE**
  Wire.write(0);     // Timer (countdown) disabled
  Wire.write(0);     // Timer value
  Wire.endTransmission();
}

// Converts a decimal to BCD (binary coded decimal)
byte DecToBcd(byte value){
  return (value / 10 * 16 + value % 10);
}

//*********** FUNCTION TO INITIALISE THE SD CARD***************
void initialiseSD()
{
  // Initialize the SD card at SPI_HALF_SPEED to avoid bus errors 
  // We use SPI_HALF_SPEED here as I am using resistor level shifters.
  //if (!sd.begin(chipSelect, SPI_HALF_SPEED)) sd.initErrorHalt();
  
  // make sure that the default chip select pin is set to
  // output, even if you don't use it:
  pinMode(chipSelect, OUTPUT);
  
  // see if the card is present and can be initialized:
  if (!sd.begin(chipSelect, SPI_HALF_SPEED)) {
    if(debugFlag==HIGH)
    {
      Serial.println("FAIL");
    }
    // don't do anything more:
    // Want to turn on an ERROR LED here
    return;
  }
  else
  {
    if(debugFlag==HIGH)
    {
      Serial.println(getString(initialisesd));
    }
  }
}


// *********FUNCTION TO SORT OUT THE FILENAME**************
void createfilename()
{
  // Check there is a file created with the date in the title
  // If it does then create a new one with the new name
  // The name is created from:
  // DMMDDYY.CSV, where YY is the year MM is the month, DD is the day
  // You must add on the '0' to convert to ASCII
  
  date = String(rtc.formatDate());
  day_int = rtc.getDay();  // Get the actual day from the RTC
  month_int = rtc.getMonth();  // Get the month
  day_int1 = day_int/10;    // Find the first part of the integer
  day_int2 = day_int%10;    // Find the second part of the integer
  filename[1]=day_int1 + '0';  // Convert from int to ascii
  filename[2]=day_int2 + '0';  // Convert from int to ascii 
  month_int1 = month_int/10;    // Find the first part of the integer
  month_int2 = month_int%10;    // Find the second part of the integer
  filename[3]=month_int1 + '0';  // Convert from int to ascii
  filename[4]=month_int2 + '0';  // Convert from int to ascii   
  filename[5]=(year_int/10) + '0';  // Convert from int to ascii
  filename[6]=(year_int%10) + '0';  // Convert from int to ascii 
  
  if(debugFlag==HIGH)
  {
    Serial.println(filename);
  }
  
  if(!sd.exists(filename))
  {
    // open the file for write at end like the Native SD library
    if (!datafile.open(filename, O_RDWR | O_CREAT | O_AT_END)) {
      if(debugFlag==HIGH)
      {
        Serial.println(getString(erroropen));
      }
    }
    // if the file opened okay, write to it:
    datafile.println(getString(headers));
    // close the file:
    datafile.sync();
    if(debugFlag==HIGH)
    {
      Serial.println(getString(headersOK));
    }
  } 
  else
  {
    if(debugFlag==HIGH)
    {
      Serial.println("Filename exists");
    }
  }
  
}

// This routine writes the dataString to the SD card
void writetoSD()
{
  datafile.open(filename, O_RDWR | O_CREAT | O_AT_END);    // Open the correct file
  // if the file is available, write to it:
  if (sd.exists(filename)) {
    datafile.println(dataString);
    datafile.close();
    // print to the serial port too:
    Serial.println(dataString);
  }  
  // if the file isn't open, pop up an error:
  else {
    if(debugFlag==HIGH)
    {
      Serial.println(getString(erroropen));
    }
  }
}

// Get a string from program memory
// This routine pulls the string stored in program memory so we can use it
// It is temporaily stored in the stringBuffer
char* getString(const char* str) {
	strcpy_P(stringBuffer, (char*)str);
	return stringBuffer;
}


// **********************GET DATA SUBROUTINE*****************************************
// This sub-routine picks up and serial string sent to the device and sorts out a power string if there is one
// All values are global, hence nothing is sent/returned

void getData()
{
    // **********GET DATA*******************************************
  // We want to find the bit of interesting data in the serial data stream
  // If we write H then house number then the code will update the house number in EEPROM
  // **** aslo need to write code to update RTC
  
  for(int i = 0; i<10;i++)  // This helps us just take a 'chunk' of data so does not fill up serial buffer
  {
    // get incoming bytes:
    if (Serial.available() > 0) 
    {
     inByte = Serial.read(); 
     str_buffer+=inByte;
    
     if(inByte=='E')    // We read everything up to the byte 'E' which stands for END
     {
       int buffer_length = str_buffer.length();  // We also find the length of the string so we know how many char to display 
       // Depending upon what came before we update different values
       // To change the reference number we enter R00E, where 00 can be any number up to 99 

        for(int i = buffer_length; i>=0; i--)  // Check the buffer from the end of the data, working backwards
        {
          // Used prefixes: R, T, D, S
          if(str_buffer[i]=='R')
          {
              // In this case we have changed the house number, so UPDATE and store in EEPROM
              deviceID[0]=str_buffer[i+1];
              deviceID[1]=str_buffer[i+2];
              Serial.print(getString(reference));
              Serial.print(deviceID[0]);
              Serial.println(deviceID[1]);
              EEPROM.write(0,deviceID[0]);
              EEPROM.write(1,deviceID[1]);
              initialiseSD();
              createfilename();
          }          
          if(str_buffer[i]=='T')
          {
              // In this case we have changed the TIME, so UPDATE and store to RTC
              // The time is in the format  HHMMSS
              
              String hourstr = str_buffer.substring(i+1,i+3);
              int hour = atoi(&hourstr[0]);
              String minutestr = str_buffer.substring(i+3,i+5);
              int minute = atoi(&minutestr[0]);
              String secondstr = str_buffer.substring(i+5,i+7);
              int second = atoi(&secondstr[0]);
              //hr, min, sec into Real Time Clock
              rtc.setTime(hour, minute, second);

              initialiseSD();
              createfilename();
              
              Serial.println(String(rtc.formatTime())); // Time
          }
          if(str_buffer[i]=='D')
          {
              // In this case we have changed the DATE, so UPDATE and store to RTC
              // The time is in the format  DDMMYY
              
              String daystr = str_buffer.substring(i+1,i+3);
              int day = atoi(&daystr[0]);
              String monthstr = str_buffer.substring(i+3,i+5);
              int month = atoi(&monthstr[0]);          
              String yearstr = str_buffer.substring(i+5,i+7);
              int year = atoi(&yearstr[0]);          
           
              //day, weekday, month, century(1=1900, 0=2000), year(0-99)
              rtc.setDate(day, 3, month, 0, year);
              
              initialiseSD();
              createfilename();
              
              Serial.println(String(rtc.formatDate(RTCC_DATE_WORLD)));
          }           
          if(str_buffer[i]=='S')
          {          
              // In this case we have changed the sample time, so UPDATE and store to EEPROM
              // Data will be in the form of 5 x chars, signifying XXXXX, a value from 00001 to 99999 seconds
              
              sampleTime = atol(&str_buffer[i+1]);  // Convert the string to a long int
              
              EEPROM.write(2, sampleTime >> 8);    // Do this seperately
              EEPROM.write(3, sampleTime & 0xff);
              Serial.print("Sample Time:");
              Serial.println(sampleTime);
              
              dataCounter=0;  // Reset the data counter to start counting again.
          }
          if (str_buffer[i]=='F')
          {
            // Change the threshold for flush detection
            long newSensitivity = atol(&str_buffer[i+1]);
            sensor.SetSensitivity((uint16_t)newSensitivity);
            Serial.print("New sensitivity: ");
            Serial.println(newSensitivity);
          }
        }
        str_buffer="";  // Reset the buffer to be filled again 
      }
    }
  }
}

/*
 * Two callback functions for the sensor
 * These are passed to the sensor class when instantiating.
 * onFlushStart is called once when flush start is detected.
 * onFlushEnd is called once when flush end is detected. Flush duration is pass as parameter
 */
void onFlushStart(void)
{
        digitalWrite(LEDred, HIGH);
  	Serial.println("Flush started...");
        delay(10);
        digitalWrite(LEDred,LOW);
}

void onFlushEnd(uint16_t durationinSeconds)
{

        digitalWrite(LEDred, HIGH);
        Serial.print("Flush ended (");
	Serial.print(durationinSeconds);
	Serial.println(" seconds)");
        flushSeconds = durationinSeconds;  // Move the time to the main loop
        writedataflag = HIGH; // Write data to the SD card
        delay(10);
        digitalWrite(LEDred,LOW);
}

// Temperature function outputs float , the actual
// temperature
// Temperature function inputs
// 1.AnalogInputNumber - analog input to read from
// 2.OuputUnit - output in celsius, kelvin or fahrenheit
// 3.Thermistor B parameter - found in datasheet
// 4.Manufacturer T0 parameter - found in datasheet (kelvin)
// 5. Manufacturer R0 parameter - found in datasheet (ohms)
// 6. Your balance resistor resistance in ohms  

float Temperature(int AnalogInputNumber,int OutputUnit,float B,float T0,float R0,float R_Balance)
{
  float R,T,data;

  //R=1024.0f*R_Balance/float(analogRead(AnalogInputNumber))-R_Balance;
  
  // Changes as using thermistor to ground:
  data = float(analogRead(AnalogInputNumber));
  R=(data*R_Balance)/(1024.0f-data);
  
  T=1.0f/(1.0f/T0+(1.0f/B)*log(R/R0));

  switch(OutputUnit) {
    case T_CELSIUS :
      T-=273.15f;
    break;
    case T_FAHRENHEIT :
      T=9.0f*(T-273.15f)/5.0f+32.0f;
    break;
    default:
    break;
  };

  return T;
}

