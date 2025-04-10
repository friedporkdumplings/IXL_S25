#include <Servo.h>

Servo myservo;
int val;

void setup() {
  myservo.attach(9);
}

void loop() {
val = analogRead (A0);
if (val < 512) {
  myservo.write(0);
} else {
  myservo.write(180);
}
}
