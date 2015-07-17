#include <LatrineSensor.h>

LatrineSensor sensor = LatrineSensor(onFlushStart, onFlushEnd);

void setup(void)
{
  sensor.Setup(); // MUST be called to start counting!
  Serial.begin(115200);
  Serial.println("LatrineSensor Simple Example");
  pinMode(4, OUTPUT);
}

void loop(void)
{
  static bool led = false;
  digitalWrite(4, led = !led);

  delay(1000);
  uint32_t freq = sensor.Update(); // Call once every second
  Serial.println(freq);
}

/*
 * Two callback functions for the sensor
 * These are passed to the sensor class when instantiating.
 * onFlushStart is called once when flush start is detected.
 * onFlushEnd is called once when flush end is detected. Flush duration is pass as parameter
 */
void onFlushStart(void)
{
  Serial.println("Flush started...");
}

void onFlushEnd(uint16_t durationinSeconds)
{
  Serial.print("Flush ended (");
  Serial.print(durationinSeconds);
  Serial.println(" seconds)");
}

