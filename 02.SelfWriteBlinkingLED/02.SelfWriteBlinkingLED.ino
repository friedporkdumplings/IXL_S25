void setup() {
pinMode(6,OUTPUT); //green led
}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(6,HIGH);
delay(1000);
digitalWrite(6,LOW);
delay(1000);
}
