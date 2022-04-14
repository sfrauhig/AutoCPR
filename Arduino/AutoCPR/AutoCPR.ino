#include "DualG2HighPowerMotorShield.h"

// Constants are pin numbers for connections with Arduino to UI
const int pbONpin = 23;     // orange
const int pbOFFpin = 52;    // purple
const int redLEDpin = 25;   // yellow
const int greenLEDpin = 27; // green
const int blueLEDpin = 29;  // blue
                            // 5V is brown
                            // GND is red
                            // Grey is disconnected.
const int tempPin = A15;    // Connections to LM35dz - A15 red; black is GND and white is 5V
const int movePin = 3;       // Connections to hall effect(s) - 3 is Yellow; black is GND; red is 5V


// Object is motor from motor driver library
DualG2HighPowerMotorShield24v18 md;

// Constants are used to light the RGB LED to the corresponding colors
const String green = "green";
const String blue = "blue";
const String red = "red";
const String white = "white";



// Variables to be used by program
int tempFlag = 0;
int moveFlag = 0;
float sensorValue;
float voltageOut;
float temperatureC;
volatile unsigned long time1, time2 = 0;
volatile float freq[5] = {0};
volatile float freqAvg;
volatile int i = 0;
int j = 0;

void setup() {
  Serial.begin(115200);
  
  TCCR2B = TCCR2B & B11111000 | B00000001;
  TCCR1A = 0b10100000;
  TCCR1B = 0b00010001;
  ICR1 = 400;
  attachInterrupt(digitalPinToInterrupt(movePin), getTimeISR, FALLING);
  
  tempFlag = 0;
  moveFlag = 0;
  pinMode(movePin, INPUT_PULLUP);
  pinMode(redLEDpin, OUTPUT);
  pinMode(greenLEDpin, OUTPUT);
  pinMode(blueLEDpin, OUTPUT);
  pinMode(pbONpin, INPUT);
  pinMode(pbOFFpin, INPUT);
  pinMode(tempPin, INPUT);
  
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
      setLED(green, LOW);
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

  md.enableM2Driver();
  md.setM2Speed(400);
  setLED(blue, HIGH);
  
  while((digitalRead(pbOFFpin) == LOW)) {
    tempCheck();
    //Serial.print("\nCurrent: ");
    //Serial.print(md.getM2CurrentReading());
   
  }
  setLED(blue, LOW);
  md.disableM2Driver();
}

// This function checks the temperature of the device
// ====================================================================================
// Step 1: Read the output of the temperature sensor
// Step 2: Calculate the temperature based on the sensor output
// Step 3: Set tempFlag to 1 if temperature is too high, 0 if okay
// Step 4: Make LED red if temperature is too high, Make LED off if temperature is okay
// ====================================================================================
// LM35dz (150C cap)
// V- = GND
// Vout = A15
// V+ = 5V
void tempCheck() {
  sensorValue = analogRead(tempPin);

  voltageOut = (sensorValue * 5000) / 1024;
  
  temperatureC = voltageOut / 10;
  if (temperatureC > 65 && tempFlag == 0) { // Temp threshold based on operational temperature of Li-ion batter
    setLED(red, HIGH);
    tempFlag = 1;
  }
  else if (tempFlag == 1 && temperatureC <= 65) {
    setLED(blue, HIGH);
    tempFlag = 0;
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
void getTimeISR() {
  
  unsigned long int timex = micros();
  if(time1 == 0){
    time1 = timex;
  }
  else if(i < 5){
    time2 = timex;
    freq[i++] = 1000000.0/(float) (time2-time1);
 
    CalcAvgFreq();
    time1 = time2;
  }
  else {
    time2 = timex;
    i = 0;
    freq[i++] = 1000000.0/(float) (time2-time1);
    CalcAvgFreq();
    time1 = time2;
  }
}
// This function checks the piston for correct movement by calculating the average frequency
// of the last 5 hall effect sensor readings.
// ====================================================================================
// Step 1: In ISR, get hall effect sensor readings
// Step 2: Set movementFlag to 1 if the movement is in error, Set to 0 if it's okay
// Step 3: Make LED white if piston movement is outside the margin of error
//         Keep LED blue if piston movement is okay
// ====================================================================================
void CalcAvgFreq(){
  j = 0;
  freqAvg = 0;
  while(j < 5 && freq[j] > 0) {
    freqAvg += freq[j++];
  }
  freqAvg /= (j-1);

  //=============================================================
  // Test Number 5.4: Testing for proper compression rate.
  // Uncomment for test: Serial.print(freqAvg);
  // Uncomment for test: Serial.println(" Hz");
  // freqAvg shall be between 1.66Hz and 2.33Hz (100BPM - 140BPM)
  //=============================================================

  if(moveFlag = 0 && (freqAvg <= 1.66 || freqAvg >= 2.33)) {
    setLED(white, HIGH);
    moveFlag = 1;
  } else if(moveFlag = 1 && (freqAvg > 1.66 && freqAvg < 2.33)) {
    setLED(white, LOW);
    setLED(blue, HIGH);
    moveFlag = 0;
  }
  
}
