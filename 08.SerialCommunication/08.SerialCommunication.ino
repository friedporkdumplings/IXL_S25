#include <Servo.h>
#define NUM_OF_VALUES_FROM_PROCESSING 3 /* CHANGE THIS ACCORDING TO YOUR PROJECT */

Servo servo1;
Servo servo2;


/* This array stores values from Processing */
int processing_values[NUM_OF_VALUES_FROM_PROCESSING];


void setup() {
  Serial.begin(9600);
  pinMode(13, OUTPUT);

  servo1.attach(9);
  servo2.attach(10);
}

void loop() {
  getSerialData();

  if (processing_values[0] == 1) {

    int angleX = map(processing_values[1], 0, 1200, 0, 180);
    int angleY = map(processing_values[2], 0, 800, 0, 180);

    servo1.write(angleX);
    servo2.write(angleY);

    delay(15);
  }
}


/* Receive Serial data from Processing */
/* You won't need to change this code  */

void getSerialData() {
  static int tempValue = 0;  // the "static" makes the local variable retain its value between calls of this function
  static int tempSign = 1;
  static int valueIndex = 0;

  while (Serial.available()) {
    char c = Serial.read();
    if (c >= '0' && c <= '9') {
      // received a digit:
      // multiply the current value by 10, and add the character (converted to a number) as the last digit
      tempValue = tempValue * 10 + (c - '0');
    } else if (c == '-') {
      // received a minus sign:
      // make a note to multiply the final value by -1
      tempSign = -1;
    } else if (c == ',' || c == '\n') {
      // received a comma, or the newline character at the end of the line:
      // update the processing_values array with the temporary value
      if (valueIndex < NUM_OF_VALUES_FROM_PROCESSING) {  // should always be the case, but double-check
        processing_values[valueIndex] = tempValue * tempSign;
      }
      // get ready for the new data by resetting the temporary value and sign
      tempValue = 0;
      tempSign = 1;
      if (c == ',') {
        // move to dealing with the next entry in the processing_values array
        valueIndex = valueIndex + 1;
      } else {
        // except when we reach the end of the line
        // go back to the first entry in this case
        valueIndex = 0;
      }
    }
  }
}