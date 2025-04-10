int sensor = 2;
int sensorVal;

void setup() {
  // put your setup code here, to run once:
pinMode(sensor, INPUT);
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
sensorVal = digitalRead(sensor);
Serial.println(sensorVal);
}
