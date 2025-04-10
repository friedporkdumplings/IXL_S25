#include <Servo.h>

int triggerPin = 6;
int echoPin = 7;
long distance;
Servo myServo;
int val;

void setup() {
  Serial.begin(9600);
  pinMode(triggerPin, OUTPUT);
  pinMode(echoPin, INPUT);
  myServo.attach(9);
}

void loop() {
  // additional 2 microsecond delay to ensure pulse clarity
  digitalWrite(triggerPin, LOW);
  delayMicroseconds(2);
  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(triggerPin, LOW);

  // pulseIn waits for signal to go from HIGH to LOW,
  // timeout according to max range of sensor
  long duration = pulseIn(echoPin, HIGH, 17400);
  // sound travels roughly 29cm per microsecond so we divide by 29,
  // then by 2 since we recorded sound both going forth and back
  distance = duration / 29 / 2;
  Serial.println(distance);

  // servo moves depending on distance 50 cm
  if (distance > 5 && distance < 50) {
    myServo.write(180);
    delay(500);
  } else {
    myServo.write(0);
    delay(500);
  }
}