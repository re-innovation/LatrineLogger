EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:1wire
LIBS:arduino_shieldsNCL
LIBS:atmel-1
LIBS:atmel-2005
LIBS:philips
LIBS:nxp
LIBS:matts_components
LIBS:linear2
LIBS:LatrineLoggerPCB-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title ""
Date "25 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 950  2900 0    60   ~ 0
Bolt Holes
NoConn ~ 1050 3500
NoConn ~ 1050 3350
NoConn ~ 1050 3200
NoConn ~ 1050 3050
$Comp
L CONN_1 P4
U 1 1 500FB994
P 1200 3500
F 0 "P4" H 1280 3500 40  0000 L CNN
F 1 "CONN_1" H 1200 3555 30  0001 C CNN
F 2 "" H 1200 3500 60  0001 C CNN
F 3 "" H 1200 3500 60  0001 C CNN
	1    1200 3500
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P3
U 1 1 500FB991
P 1200 3350
F 0 "P3" H 1280 3350 40  0000 L CNN
F 1 "CONN_1" H 1200 3405 30  0001 C CNN
F 2 "" H 1200 3350 60  0001 C CNN
F 3 "" H 1200 3350 60  0001 C CNN
	1    1200 3350
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P2
U 1 1 500FB98E
P 1200 3200
F 0 "P2" H 1280 3200 40  0000 L CNN
F 1 "CONN_1" H 1200 3255 30  0001 C CNN
F 2 "" H 1200 3200 60  0001 C CNN
F 3 "" H 1200 3200 60  0001 C CNN
	1    1200 3200
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P1
U 1 1 500FB98A
P 1200 3050
F 0 "P1" H 1280 3050 40  0000 L CNN
F 1 "CONN_1" H 1200 3105 30  0001 C CNN
F 2 "" H 1200 3050 60  0001 C CNN
F 3 "" H 1200 3050 60  0001 C CNN
	1    1200 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 500E6CD7
P 6900 6250
F 0 "#PWR01" H 6900 6250 30  0001 C CNN
F 1 "GND" H 6900 6180 30  0001 C CNN
F 2 "" H 6900 6250 60  0001 C CNN
F 3 "" H 6900 6250 60  0001 C CNN
	1    6900 6250
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 500E6CBF
P 6900 5950
F 0 "D2" H 6900 6050 50  0000 C CNN
F 1 "DATA" H 6900 5850 50  0000 C CNN
F 2 "" H 6900 5950 60  0001 C CNN
F 3 "" H 6900 5950 60  0001 C CNN
	1    6900 5950
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 500E6CB3
P 6900 5400
F 0 "R6" V 6980 5400 50  0000 C CNN
F 1 "1k" V 6900 5400 50  0000 C CNN
F 2 "" H 6900 5400 60  0001 C CNN
F 3 "" H 6900 5400 60  0001 C CNN
	1    6900 5400
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 53A2F46F
P 1100 4500
F 0 "R1" V 1180 4500 50  0000 C CNN
F 1 "470k" V 1100 4500 50  0000 C CNN
F 2 "" H 1100 4500 60  0000 C CNN
F 3 "" H 1100 4500 60  0000 C CNN
	1    1100 4500
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 53A2F47E
P 1100 5100
F 0 "R2" V 1180 5100 50  0000 C CNN
F 1 "100k" V 1100 5100 50  0000 C CNN
F 2 "" H 1100 5100 60  0000 C CNN
F 3 "" H 1100 5100 60  0000 C CNN
	1    1100 5100
	1    0    0    -1  
$EndComp
$Comp
L SPST SW1
U 1 1 53A2FA41
P 7250 5600
F 0 "SW1" H 7250 5700 70  0000 C CNN
F 1 "CALIBRATE" H 7250 5450 70  0000 C CNN
F 2 "" H 7250 5600 60  0000 C CNN
F 3 "" H 7250 5600 60  0000 C CNN
	1    7250 5600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR02
U 1 1 53A2FA50
P 7250 6250
F 0 "#PWR02" H 7250 6250 30  0001 C CNN
F 1 "GND" H 7250 6180 30  0001 C CNN
F 2 "" H 7250 6250 60  0000 C CNN
F 3 "" H 7250 6250 60  0000 C CNN
	1    7250 6250
	1    0    0    -1  
$EndComp
$Sheet
S 6650 3250 650  950 
U 546244BF
F0 "SD Card" 50
F1 "SD_card.sch" 50
F2 "D10" I L 6650 3950 60 
F3 "D11" I L 6650 3850 60 
F4 "D12" I L 6650 3750 60 
F5 "D13" I L 6650 3650 60 
F6 "3V3" I L 6650 3450 60 
F7 "CD" O L 6650 4050 60 
$EndSheet
$Sheet
S 4900 3400 1450 2200
U 546244C1
F0 "Arduino Uno" 50
F1 "ArduinoUno.sch" 50
F2 "A0" I L 4900 4750 60 
F3 "A1" I L 4900 4850 60 
F4 "A2" I L 4900 4950 60 
F5 "A3" I L 4900 5050 60 
F6 "A4" I L 4900 5150 60 
F7 "A5" I L 4900 5250 60 
F8 "D10" I R 6350 3950 60 
F9 "D11" I R 6350 3850 60 
F10 "D12" I R 6350 3750 60 
F11 "D13" I R 6350 3650 60 
F12 "D7" I R 6350 4650 60 
F13 "D6" I R 6350 4750 60 
F14 "D5" I R 6350 4850 60 
F15 "D4" I R 6350 4950 60 
F16 "D3" I R 6350 5050 60 
F17 "D2" I R 6350 5150 60 
F18 "Tx/D1" I R 6350 5250 60 
F19 "Rx/D0" I R 6350 5350 60 
F20 "3v3" I L 4900 3950 60 
F21 "RESET" I L 4900 4050 60 
F22 "Vpower" I L 4900 3850 60 
F23 "GND" I L 4900 4150 60 
F24 "VREF" I L 4900 3750 60 
F25 "D8" I R 6350 4450 60 
F26 "D9" I R 6350 4350 60 
$EndSheet
$Sheet
S 3200 6050 800  850 
U 546244C3
F0 "Real_Time_Clock" 50
F1 "RealTimeClock.sch" 50
F2 "A5/SCL" O R 4000 6300 60 
F3 "A4/SDA" I R 4000 6400 60 
F4 "D2/INT" I R 4000 6600 60 
F5 "+" I L 3200 6350 60 
F6 "GND" I L 3200 6500 60 
$EndSheet
$Sheet
S 3100 1100 850  850 
U 546244C7
F0 "Power Supply" 50
F1 "SolarCharger.sch" 50
F2 "3V3" O R 3950 1400 60 
F3 "SOLAR+" I L 3100 1500 60 
F4 "GND" I L 3100 1750 60 
F5 "BATT+" I L 3100 1250 60 
$EndSheet
$Comp
L CONN_2 P6
U 1 1 5463DEBC
P 1700 1800
F 0 "P6" V 1650 1800 40  0000 C CNN
F 1 "SOLAR" V 1750 1800 40  0000 C CNN
F 2 "" H 1700 1800 60  0000 C CNN
F 3 "" H 1700 1800 60  0000 C CNN
	1    1700 1800
	-1   0    0    1   
$EndComp
$Comp
L CONN_2 P5
U 1 1 5463DECB
P 1700 1350
F 0 "P5" V 1650 1350 40  0000 C CNN
F 1 "BATTERY" V 1750 1350 40  0000 C CNN
F 2 "" H 1700 1350 60  0000 C CNN
F 3 "" H 1700 1350 60  0000 C CNN
	1    1700 1350
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 5463F2D4
P 2200 2050
F 0 "#PWR03" H 2200 2050 30  0001 C CNN
F 1 "GND" H 2200 1980 30  0001 C CNN
F 2 "" H 2200 2050 60  0000 C CNN
F 3 "" H 2200 2050 60  0000 C CNN
	1    2200 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5463F2E3
P 4750 4250
F 0 "#PWR04" H 4750 4250 30  0001 C CNN
F 1 "GND" H 4750 4180 30  0001 C CNN
F 2 "" H 4750 4250 60  0000 C CNN
F 3 "" H 4750 4250 60  0000 C CNN
	1    4750 4250
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR05
U 1 1 54643D35
P 2650 1200
F 0 "#PWR05" H 2650 1150 20  0001 C CNN
F 1 "+BATT" H 2650 1300 30  0000 C CNN
F 2 "" H 2650 1200 60  0000 C CNN
F 3 "" H 2650 1200 60  0000 C CNN
	1    2650 1200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 54643EA9
P 4100 1350
F 0 "#PWR06" H 4100 1310 30  0001 C CNN
F 1 "+3.3V" H 4100 1460 30  0000 C CNN
F 2 "" H 4100 1350 60  0000 C CNN
F 3 "" H 4100 1350 60  0000 C CNN
	1    4100 1350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 54643EB8
P 4300 3900
F 0 "#PWR07" H 4300 3860 30  0001 C CNN
F 1 "+3.3V" H 4300 4010 30  0000 C CNN
F 2 "" H 4300 3900 60  0000 C CNN
F 3 "" H 4300 3900 60  0000 C CNN
	1    4300 3900
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR08
U 1 1 54643EC7
P 4400 3650
F 0 "#PWR08" H 4400 3600 20  0001 C CNN
F 1 "+BATT" H 4400 3750 30  0000 C CNN
F 2 "" H 4400 3650 60  0000 C CNN
F 3 "" H 4400 3650 60  0000 C CNN
	1    4400 3650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 54643ED6
P 6500 3350
F 0 "#PWR09" H 6500 3310 30  0001 C CNN
F 1 "+3.3V" H 6500 3460 30  0000 C CNN
F 2 "" H 6500 3350 60  0000 C CNN
F 3 "" H 6500 3350 60  0000 C CNN
	1    6500 3350
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR010
U 1 1 54647D29
P 3050 6350
F 0 "#PWR010" H 3050 6300 20  0001 C CNN
F 1 "+BATT" H 3050 6450 30  0000 C CNN
F 2 "" H 3050 6350 60  0000 C CNN
F 3 "" H 3050 6350 60  0000 C CNN
	1    3050 6350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 54647DB0
P 3050 6550
F 0 "#PWR011" H 3050 6550 30  0001 C CNN
F 1 "GND" H 3050 6480 30  0001 C CNN
F 2 "" H 3050 6550 60  0000 C CNN
F 3 "" H 3050 6550 60  0000 C CNN
	1    3050 6550
	1    0    0    -1  
$EndComp
$Sheet
S 7850 2500 700  1000
U 5464F461
F0 "GSM Module" 50
F1 "GSMmodule.sch" 50
F2 "+" I L 7850 2700 60 
F3 "GND" I L 7850 2800 60 
F4 "TxGSM" I L 7850 3000 60 
F5 "RxGSM" I L 7850 3100 60 
F6 "P_GSM" I L 7850 3250 60 
$EndSheet
$Comp
L +BATT #PWR012
U 1 1 5464FFAE
P 7700 2700
F 0 "#PWR012" H 7700 2650 20  0001 C CNN
F 1 "+BATT" H 7700 2800 30  0000 C CNN
F 2 "" H 7700 2700 60  0000 C CNN
F 3 "" H 7700 2700 60  0000 C CNN
	1    7700 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 5464FFBD
P 7700 2850
F 0 "#PWR013" H 7700 2850 30  0001 C CNN
F 1 "GND" H 7700 2780 30  0001 C CNN
F 2 "" H 7700 2850 60  0000 C CNN
F 3 "" H 7700 2850 60  0000 C CNN
	1    7700 2850
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR014
U 1 1 5464A80D
P 3000 3900
F 0 "#PWR014" H 3000 3850 20  0001 C CNN
F 1 "+BATT" H 3000 4000 30  0000 C CNN
F 2 "" H 3000 3900 60  0000 C CNN
F 3 "" H 3000 3900 60  0000 C CNN
	1    3000 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 5464A81C
P 2950 5950
F 0 "#PWR015" H 2950 5950 30  0001 C CNN
F 1 "GND" H 2950 5880 30  0001 C CNN
F 2 "" H 2950 5950 60  0000 C CNN
F 3 "" H 2950 5950 60  0000 C CNN
	1    2950 5950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR016
U 1 1 5464B676
P 3250 3900
F 0 "#PWR016" H 3250 3860 30  0001 C CNN
F 1 "+3.3V" H 3250 4010 30  0000 C CNN
F 2 "" H 3250 3900 60  0000 C CNN
F 3 "" H 3250 3900 60  0000 C CNN
	1    3250 3900
	1    0    0    -1  
$EndComp
$Comp
L CONN_4 P7
U 1 1 5464B8C5
P 2450 4200
F 0 "P7" V 2400 4200 50  0000 C CNN
F 1 "A_IN_0" V 2500 4200 50  0000 C CNN
F 2 "" H 2450 4200 60  0000 C CNN
F 3 "" H 2450 4200 60  0000 C CNN
	1    2450 4200
	-1   0    0    1   
$EndComp
$Comp
L CONN_4 P8
U 1 1 5464B8D4
P 2450 4650
F 0 "P8" V 2400 4650 50  0000 C CNN
F 1 "A_IN_1" V 2500 4650 50  0000 C CNN
F 2 "" H 2450 4650 60  0000 C CNN
F 3 "" H 2450 4650 60  0000 C CNN
	1    2450 4650
	-1   0    0    1   
$EndComp
$Comp
L CONN_4 P9
U 1 1 5464B8E3
P 2450 5100
F 0 "P9" V 2400 5100 50  0000 C CNN
F 1 "A_IN_2" V 2500 5100 50  0000 C CNN
F 2 "" H 2450 5100 60  0000 C CNN
F 3 "" H 2450 5100 60  0000 C CNN
	1    2450 5100
	-1   0    0    1   
$EndComp
$Comp
L CONN_4 P10
U 1 1 5464B8F2
P 2450 5550
F 0 "P10" V 2400 5550 50  0000 C CNN
F 1 "A_IN_3" V 2500 5550 50  0000 C CNN
F 2 "" H 2450 5550 60  0000 C CNN
F 3 "" H 2450 5550 60  0000 C CNN
	1    2450 5550
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 5464E14B
P 1850 3500
F 0 "R3" V 1930 3500 50  0000 C CNN
F 1 "THERM" V 1850 3500 50  0000 C CNN
F 2 "" H 1850 3500 60  0000 C CNN
F 3 "" H 1850 3500 60  0000 C CNN
	1    1850 3500
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5464E151
P 1850 4100
F 0 "R4" V 1930 4100 50  0000 C CNN
F 1 "100k" V 1850 4100 50  0000 C CNN
F 2 "" H 1850 4100 60  0000 C CNN
F 3 "" H 1850 4100 60  0000 C CNN
	1    1850 4100
	1    0    0    -1  
$EndComp
Text Notes 2150 3450 0    60   ~ 0
ONBOARD \nTEMP\nSENSOR
Text Notes 600  4400 0    60   ~ 0
BATTERY\nVOLTAGE\nSENSOR
$Comp
L CONN_3 K3
U 1 1 546502D7
P 8950 4900
F 0 "K3" V 8900 4900 50  0000 C CNN
F 1 "CONN_3" V 9000 4900 40  0000 C CNN
F 2 "" H 8950 4900 60  0000 C CNN
F 3 "" H 8950 4900 60  0000 C CNN
	1    8950 4900
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K4
U 1 1 546502E6
P 8950 5350
F 0 "K4" V 8900 5350 50  0000 C CNN
F 1 "CONN_3" V 9000 5350 40  0000 C CNN
F 2 "" H 8950 5350 60  0000 C CNN
F 3 "" H 8950 5350 60  0000 C CNN
	1    8950 5350
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K5
U 1 1 546502F5
P 8950 5800
F 0 "K5" V 8900 5800 50  0000 C CNN
F 1 "CONN_3" V 9000 5800 40  0000 C CNN
F 2 "" H 8950 5800 60  0000 C CNN
F 3 "" H 8950 5800 60  0000 C CNN
	1    8950 5800
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K6
U 1 1 54650304
P 8950 6250
F 0 "K6" V 8900 6250 50  0000 C CNN
F 1 "CONN_3" V 9000 6250 40  0000 C CNN
F 2 "" H 8950 6250 60  0000 C CNN
F 3 "" H 8950 6250 60  0000 C CNN
	1    8950 6250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 54650AAB
P 8450 6600
F 0 "#PWR017" H 8450 6600 30  0001 C CNN
F 1 "GND" H 8450 6530 30  0001 C CNN
F 2 "" H 8450 6600 60  0000 C CNN
F 3 "" H 8450 6600 60  0000 C CNN
	1    8450 6600
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR018
U 1 1 54650ABA
P 8300 3850
F 0 "#PWR018" H 8300 3800 20  0001 C CNN
F 1 "+BATT" H 8300 3950 30  0000 C CNN
F 2 "" H 8300 3850 60  0000 C CNN
F 3 "" H 8300 3850 60  0000 C CNN
	1    8300 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5750 6900 5650
Wire Wire Line
	6900 4950 6900 5150
Wire Wire Line
	6900 6150 6900 6250
Wire Wire Line
	7250 6250 7250 6100
Wire Wire Line
	6350 4950 8050 4950
Wire Wire Line
	4000 6400 4700 6400
Wire Wire Line
	4700 6400 4700 5150
Wire Wire Line
	4700 5150 4900 5150
Wire Wire Line
	4900 5250 4800 5250
Wire Wire Line
	4800 5250 4800 6300
Wire Wire Line
	4800 6300 4000 6300
Wire Wire Line
	4000 6600 6600 6600
Wire Wire Line
	6600 6600 6600 5150
Wire Wire Line
	6600 5150 6350 5150
Wire Wire Line
	6350 3650 6650 3650
Wire Wire Line
	6350 3750 6650 3750
Wire Wire Line
	6350 3850 6650 3850
Wire Wire Line
	6350 3950 6650 3950
Wire Wire Line
	2050 1250 3100 1250
Wire Wire Line
	2050 1900 2350 1900
Wire Wire Line
	2350 1900 2350 1450
Wire Wire Line
	2350 1450 2050 1450
Wire Wire Line
	2200 1700 2050 1700
Wire Wire Line
	2200 1500 3100 1500
Wire Wire Line
	2200 1500 2200 1700
Wire Wire Line
	3100 1750 2350 1750
Connection ~ 2350 1750
Wire Wire Line
	4300 3950 4900 3950
Wire Wire Line
	4900 3850 4400 3850
Wire Wire Line
	4900 4150 4750 4150
Wire Wire Line
	4750 4150 4750 4250
Wire Wire Line
	2200 2050 2200 1900
Connection ~ 2200 1900
Wire Wire Line
	6650 3450 6500 3450
Wire Wire Line
	6500 3450 6500 3350
Wire Wire Line
	4400 3850 4400 3650
Wire Wire Line
	2650 1200 2650 1250
Connection ~ 2650 1250
Wire Wire Line
	3950 1400 4100 1400
Wire Wire Line
	4100 1400 4100 1350
Wire Wire Line
	3200 6500 3050 6500
Wire Wire Line
	3050 6500 3050 6550
Wire Wire Line
	3200 6350 3050 6350
Wire Wire Line
	4300 3950 4300 3900
Wire Wire Line
	7850 2800 7700 2800
Wire Wire Line
	7700 2800 7700 2850
Wire Wire Line
	7850 2700 7700 2700
Wire Wire Line
	6550 4050 6650 4050
Wire Wire Line
	6350 4350 6550 4350
Wire Wire Line
	6550 4350 6550 4050
Wire Wire Line
	6350 4750 8200 4750
Wire Wire Line
	7250 4750 7250 5100
Wire Wire Line
	6350 5050 7900 5050
Wire Wire Line
	6350 4450 8050 4450
Wire Wire Line
	7450 4450 7450 3000
Wire Wire Line
	7450 3000 7850 3000
Wire Wire Line
	6350 4650 8150 4650
Wire Wire Line
	7500 4650 7500 3100
Wire Wire Line
	7500 3100 7850 3100
Wire Wire Line
	7850 3250 7550 3250
Wire Wire Line
	7550 3250 7550 5050
Wire Wire Line
	2800 4350 2950 4350
Wire Wire Line
	2950 4350 2950 5950
Wire Wire Line
	2800 5700 2950 5700
Connection ~ 2950 5700
Wire Wire Line
	2800 5250 2950 5250
Connection ~ 2950 5250
Wire Wire Line
	2800 4800 2950 4800
Connection ~ 2950 4800
Wire Wire Line
	2800 4050 3000 4050
Wire Wire Line
	3000 3900 3000 5400
Wire Wire Line
	2800 4150 3250 4150
Wire Wire Line
	3250 3900 3250 5500
Wire Wire Line
	3000 4500 2800 4500
Connection ~ 3000 4050
Wire Wire Line
	3000 5400 2800 5400
Connection ~ 3000 4500
Wire Wire Line
	2800 4950 3000 4950
Connection ~ 3000 4950
Wire Wire Line
	3250 5500 2800 5500
Connection ~ 3250 4150
Wire Wire Line
	2800 4600 3250 4600
Connection ~ 3250 4600
Wire Wire Line
	2800 5050 3250 5050
Connection ~ 3250 5050
Wire Wire Line
	3700 4250 3700 4750
Wire Wire Line
	3700 4750 4900 4750
Wire Wire Line
	3600 4700 3600 4850
Wire Wire Line
	3600 4850 4900 4850
Wire Wire Line
	3350 5150 3350 4950
Wire Wire Line
	3350 4950 4900 4950
Wire Wire Line
	3600 5600 3600 5050
Wire Wire Line
	3600 5050 4900 5050
Wire Wire Line
	2800 4250 3700 4250
Wire Wire Line
	2800 5600 3600 5600
Wire Wire Line
	2800 5150 3350 5150
Wire Wire Line
	2800 4700 3600 4700
Wire Wire Line
	2900 4350 1850 4350
Connection ~ 2900 4350
Wire Wire Line
	1850 3850 1850 3750
Wire Wire Line
	1850 3800 2000 3800
Wire Wire Line
	2000 3800 2000 4250
Wire Wire Line
	2000 4250 2900 4250
Connection ~ 2900 4250
Connection ~ 1850 3800
Wire Wire Line
	2900 4150 2100 4150
Wire Wire Line
	2100 4150 2100 3200
Wire Wire Line
	2100 3200 1850 3200
Wire Wire Line
	1850 3200 1850 3250
Connection ~ 2900 4150
Wire Wire Line
	1100 4250 1100 4150
Wire Wire Line
	1100 4150 1550 4150
Wire Wire Line
	1550 4150 1550 4500
Wire Wire Line
	1550 4500 2850 4500
Connection ~ 2850 4500
Wire Wire Line
	1100 4850 1100 4750
Wire Wire Line
	1100 5350 1550 5350
Wire Wire Line
	1550 5350 1550 4800
Wire Wire Line
	1550 4800 2850 4800
Connection ~ 2850 4800
Wire Wire Line
	1100 4800 1350 4800
Wire Wire Line
	1350 4800 1350 4700
Wire Wire Line
	1350 4700 2850 4700
Connection ~ 2850 4700
Connection ~ 1100 4800
Wire Wire Line
	8600 6150 8450 6150
Wire Wire Line
	8450 3900 8450 6600
Wire Wire Line
	8600 4800 8450 4800
Connection ~ 8450 6150
Wire Wire Line
	8600 5250 8450 5250
Connection ~ 8450 5250
Wire Wire Line
	8600 5700 8450 5700
Connection ~ 8450 5700
Wire Wire Line
	8300 6350 8600 6350
Wire Wire Line
	8600 5000 8300 5000
Connection ~ 8300 5000
Wire Wire Line
	8600 5450 8300 5450
Connection ~ 8300 5450
Wire Wire Line
	8600 5900 8300 5900
Connection ~ 8300 5900
Wire Wire Line
	7900 5050 7900 6250
Wire Wire Line
	7900 6250 8600 6250
Connection ~ 7550 5050
Wire Wire Line
	8050 4950 8050 5800
Wire Wire Line
	8050 5800 8600 5800
Connection ~ 6900 4950
Wire Wire Line
	6350 4850 8150 4850
Wire Wire Line
	8150 5350 8600 5350
Connection ~ 7250 4750
$Comp
L CONN_3 K2
U 1 1 54653B6F
P 8950 4450
F 0 "K2" V 8900 4450 50  0000 C CNN
F 1 "CONN_3" V 9000 4450 40  0000 C CNN
F 2 "" H 8950 4450 60  0000 C CNN
F 3 "" H 8950 4450 60  0000 C CNN
	1    8950 4450
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K1
U 1 1 54653B7E
P 8950 4000
F 0 "K1" V 8900 4000 50  0000 C CNN
F 1 "CONN_3" V 9000 4000 40  0000 C CNN
F 2 "" H 8950 4000 60  0000 C CNN
F 3 "" H 8950 4000 60  0000 C CNN
	1    8950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3850 8300 6350
Wire Wire Line
	8600 4100 8300 4100
Connection ~ 8300 4100
Wire Wire Line
	8600 4550 8300 4550
Connection ~ 8300 4550
Wire Wire Line
	8450 3900 8600 3900
Connection ~ 8450 4800
Wire Wire Line
	8150 4850 8150 5350
Wire Wire Line
	8600 4900 8200 4900
Wire Wire Line
	8200 4900 8200 4750
Wire Wire Line
	8150 4650 8150 4450
Wire Wire Line
	8150 4450 8600 4450
Connection ~ 7500 4650
Wire Wire Line
	8050 4450 8050 4000
Wire Wire Line
	8050 4000 8600 4000
Connection ~ 7450 4450
$Comp
L GND #PWR019
U 1 1 54658A38
P 6050 2750
F 0 "#PWR019" H 6050 2750 30  0001 C CNN
F 1 "GND" H 6050 2680 30  0001 C CNN
F 2 "" H 6050 2750 60  0001 C CNN
F 3 "" H 6050 2750 60  0001 C CNN
	1    6050 2750
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 54658A3E
P 6050 2450
F 0 "D1" H 6050 2550 50  0000 C CNN
F 1 "D13" H 6050 2350 50  0000 C CNN
F 2 "" H 6050 2450 60  0001 C CNN
F 3 "" H 6050 2450 60  0001 C CNN
	1    6050 2450
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 54658A44
P 6050 1900
F 0 "R5" V 6130 1900 50  0000 C CNN
F 1 "1k" V 6050 1900 50  0000 C CNN
F 2 "" H 6050 1900 60  0001 C CNN
F 3 "" H 6050 1900 60  0001 C CNN
	1    6050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2250 6050 2150
Wire Wire Line
	6050 2650 6050 2750
Wire Wire Line
	6050 1650 6050 1550
Wire Wire Line
	6050 1550 6350 1550
Wire Wire Line
	6350 1550 6350 3350
Wire Wire Line
	6350 3350 6450 3350
Wire Wire Line
	6450 3350 6450 3650
Connection ~ 6450 3650
Wire Wire Line
	8600 4350 8450 4350
Connection ~ 8450 4350
$Comp
L CONN_5 P16
U 1 1 549C9315
P 10250 5250
F 0 "P16" V 10200 5250 50  0000 C CNN
F 1 "555 SENSOR" V 10300 5250 50  0000 C CNN
F 2 "" H 10250 5250 60  0000 C CNN
F 3 "" H 10250 5250 60  0000 C CNN
	1    10250 5250
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 549C95E5
P 9400 4750
F 0 "RV1" H 9400 4650 50  0000 C CNN
F 1 "POT" H 9400 4750 50  0000 C CNN
F 2 "" H 9400 4750 60  0000 C CNN
F 3 "" H 9400 4750 60  0000 C CNN
	1    9400 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 5150 9400 5150
Wire Wire Line
	9400 5150 9400 5000
Wire Wire Line
	9550 4750 9700 4750
Wire Wire Line
	9700 4750 9700 5050
Wire Wire Line
	9700 5050 9850 5050
NoConn ~ 9400 4500
Wire Wire Line
	8550 5250 9850 5250
Connection ~ 8550 5250
Wire Wire Line
	9850 5350 8550 5350
Connection ~ 8550 5350
Wire Wire Line
	8550 5450 9850 5450
Connection ~ 8550 5450
$Comp
L CONN_1 P17
U 1 1 549D2D3C
P 10150 4650
F 0 "P17" H 10230 4650 40  0000 L CNN
F 1 "GND" H 10150 4705 30  0001 C CNN
F 2 "" H 10150 4650 60  0000 C CNN
F 3 "" H 10150 4650 60  0000 C CNN
	1    10150 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 549D2E59
P 9850 4750
F 0 "#PWR020" H 9850 4750 30  0001 C CNN
F 1 "GND" H 9850 4680 30  0001 C CNN
F 2 "" H 9850 4750 60  0000 C CNN
F 3 "" H 9850 4750 60  0000 C CNN
	1    9850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 4650 9850 4650
Wire Wire Line
	9850 4650 9850 4750
$Comp
L CONN_1 P18
U 1 1 549D3CCE
P 10050 3550
F 0 "P18" H 10130 3550 40  0000 L CNN
F 1 "CONN_1" H 10050 3605 30  0001 C CNN
F 2 "" H 10050 3550 60  0000 C CNN
F 3 "" H 10050 3550 60  0000 C CNN
	1    10050 3550
	1    0    0    -1  
$EndComp
NoConn ~ 9900 3550
$Comp
L CONN_1 P19
U 1 1 549D429A
P 10050 3650
F 0 "P19" H 10130 3650 40  0000 L CNN
F 1 "CONN_1" H 10050 3705 30  0001 C CNN
F 2 "" H 10050 3650 60  0000 C CNN
F 3 "" H 10050 3650 60  0000 C CNN
	1    10050 3650
	1    0    0    -1  
$EndComp
NoConn ~ 9900 3650
$EndSCHEMATC