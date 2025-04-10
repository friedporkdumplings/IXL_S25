int val;
int prevVal;
int startTime;

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
}

void loop() {
  val = digitalRead(2);

  if (prevVal == LOW && val == HIGH) {
    Serial.println("Pressed ");
    startTime = millis();
  }
  if (prevVal == HIGH && val == LOW) {
    Serial.print("Released ");
    Serial.println(millis() - startTime);
  }
  prevVal = val;
  delay(10);
}
