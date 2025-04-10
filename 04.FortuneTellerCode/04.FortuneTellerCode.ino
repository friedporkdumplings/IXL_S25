#include <Servo.h>

Servo myservo;
int val;

void setup() {
  myservo.attach(9);
  Serial.begin(9600);
  randomSeed(analogRead(A5));

  val = random(0, 181);
  myservo.write(val);
  Serial.println(val);
}

void loop() {
}
