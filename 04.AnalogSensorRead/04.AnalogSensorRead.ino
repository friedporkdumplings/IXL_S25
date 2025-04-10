int sensor = A0;
int sensorVal;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
sensorVal = analogRead(sensor);
Serial.println(sensorVal);
}
