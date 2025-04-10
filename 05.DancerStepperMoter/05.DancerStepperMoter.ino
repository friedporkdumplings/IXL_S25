// based on: Blocking example
#include <AccelStepper.h>

int DIR_PIN = 2;
int STEP_PIN = 3;
int EN_PIN = 4;

AccelStepper stepper(AccelStepper::DRIVER, STEP_PIN, DIR_PIN);

void setup() {
  // Enable the stepper driver
  pinMode(EN_PIN, OUTPUT);
  digitalWrite(EN_PIN, LOW);
  // Set initial speed & acceleration
  stepper.setMaxSpeed(1000);
  stepper.setAcceleration(500);
}

void loop() {
  stepper.setMaxSpeed(1000);
  stepper.setAcceleration(700);
  stepper.runToNewPosition(900);
  delay(500);
  stepper.setMaxSpeed(1000);
  stepper.setAcceleration(900);
  stepper.runToNewPosition(0);
  delay(500);
}

