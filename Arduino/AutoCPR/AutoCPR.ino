#include "DualG2HighPowerMotorShield.h"

// Constants are pin numbers for connections with Arduino
const int pbONpin = 23;
const int pbOFFpin = 52;
const int redLEDpin = 25;
const int greenLEDpin = 27;
const int blueLEDpin = 29;
//const int motorPin = 5;

// Object is motor from motor driver library
DualG2HighPowerMotorShield24v18 md;

// Constants are used to light the RGB LED to the corresponding colors
const String green = "green";
const String blue = "blue";
const String red = "red";
const String white = "white";

const int sensorPin = A15;
float sensorValue;
float voltageOut;

float temperatureC;
float temperatureF;
float temperatureK;

// Variables to be used by program
int tempFlag = 0;
int movementFlag = 0;

void setup() {
  Serial.begin(115200);
  
  pinMode(redLEDpin, OUTPUT);
  pinMode(greenLEDpin, OUTPUT);
  pinMode(blueLEDpin, OUTPUT);
  pinMode(pbONpin, INPUT);
  pinMode(pbOFFpin, INPUT);
  pinMode(sensorPin, INPUT);
   
   md.init();
   md.calibrateCurrentOffsets();
}
void loop() {
  
  pbOnWait();
  runMotor();
}

// This function waits until the start button on the user interface is pressed
// ===========================================================================
// Step 1: Set push button state to LOW
// Step 2: Set LED to GREEN to tell user that the device is ready
// Step 3: Wait until user input (push button is HIGH)
// ===========================================================================
void pbOnWait() {
  byte pbState = LOW;
  setLED(green, HIGH);
  
  while(1) {
    pbState = digitalRead(pbONpin);
    if (pbState == HIGH) {
      return;
    }
  }
}

// This function controls the operation of the motor
// ================================================================================
// Step 1: Set speed of motor
// Step 2: Enable the motor
// Step 3: Until the OFF button is pressed by the user, continue running the motor
// Step 3a: Check the temperature of the device
// Step 3b: Check the movement of the piston for errors
// Step 4: After OFF button is pressed by the user, turn off the motor
// ================================================================================
void runMotor() {
  
  md.setM1Speed(4800);
  md.enableM1Driver();
  setLED(blue, HIGH);
  while((digitalRead(pbOFFpin) == LOW)) {
    tempCheck();
    //movementCheck();
    // INSERT CODE FOR MOTOR OPERATION
   
  }
  md.disableM1Driver();
}

// This function checks the temperature of the device
// ====================================================================================
// Step 1: Read the output of the temperature sensor
// Step 2: Calculate the temperature based on the sensor output
// Step 3: Set tempFlag to 1 if temperature is too high, 0 if okay
// Step 4: Make LED red if temperature is too high, Make LED off if temperature is okay
// ====================================================================================
// R1 = 2K Pullup
// LM335z (100C cap)
// V- = GND
// Vout = A15
void tempCheck() {
  sensorValue = analogRead(sensorPin);
  voltageOut = (sensorValue * 5000) / 1024;
  
  temperatureK = voltageOut / 10;
  temperatureC = temperatureK - 273;
  temperatureF = (temperatureC * 1.8) + 32;
  /*Serial.print("Temperature(ºC): ");
  Serial.print(temperatureC);
  Serial.print("  Temperature(ºF): ");
  Serial.print(temperatureF);
  Serial.print("  Voltage(mV): ");
  Serial.println(voltageOut);
  delay(1000);*/
  if (temperatureF > 90 && tempFlag == 0) { // WIll set temperature threshold accordingly once device is operational
    setLED(red, HIGH);
    tempFlag = 1;
  }
  else if (tempFlag == 1 && temperatureF <= 90) {
    setLED(red, LOW);
    tempFlag = 0;
  }

}

// This function checks the piston for correct movement
// ====================================================================================
// Step 1: Read the output of the movement sensor
// Step 2: Set movementFlag to 1 if the movement is in error, Set to 0 if it's okay
// Step 3: Make LED white if piston movement is off, Make LED off if piston movement is okay
// ====================================================================================
void movementCheck() {
  //INSERT CODE FOR MOVEMENT SENSOR READING
 
  if (movementFlag == 1) {
    setLED(white, HIGH);
  }
  else if(digitalRead(blueLEDpin) == HIGH) {
    setLED(white, LOW);
  }
}

// This function sets the User interface RGB LED to the proper 
// color for device indications as denoted in the User Guide.
void setLED(String color, byte state) {
  if(color == "green" && state == HIGH) {
    digitalWrite(redLEDpin, HIGH);
    digitalWrite(greenLEDpin, LOW);
    digitalWrite(blueLEDpin, HIGH);
  } else if (color == "red" && state == HIGH) {
    digitalWrite(redLEDpin, LOW);
    digitalWrite(greenLEDpin, HIGH);
    digitalWrite(blueLEDpin, HIGH);
  }else if (color == "blue" && state == HIGH) {
    digitalWrite(redLEDpin, HIGH);
    digitalWrite(greenLEDpin, HIGH);
    digitalWrite(blueLEDpin, LOW);
  } else if (color == "white" && state == HIGH) {
    digitalWrite(redLEDpin, LOW);
    digitalWrite(greenLEDpin, LOW);
    digitalWrite(blueLEDpin, LOW);
  } else if (state == LOW) {
    digitalWrite(redLEDpin, HIGH);
    digitalWrite(greenLEDpin, HIGH);
    digitalWrite(blueLEDpin, HIGH);
  }
}
