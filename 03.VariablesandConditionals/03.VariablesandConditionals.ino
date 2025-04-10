int pot1 = A0;
int pot2 = A1;
int potVal1;
int potVal2;
int LED1 = 9;
int LED2 = 4;

void setup() {
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  potVal1 = analogRead(pot1);
  potVal2 = analogRead(pot2);
  if (potVal1 > 510 && potVal2 > 510) {
    digitalWrite(LED1, HIGH);
    digitalWrite(LED2, LOW); 
  } else if (potVal1 < 500) {
    digitalWrite(LED2, HIGH);
    digitalWrite(LED1, LOW);  
  } else {
    digitalWrite(LED1, LOW);
    digitalWrite(LED2, LOW);  
  }
  Serial.println(potVal1);
  // Serial.println(potVal2);
}
