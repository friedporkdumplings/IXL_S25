int val;
int prevVal;
int count = 0;
int red = 11;
int green = 10;
int blue = 9;

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
}

void loop() {
  val = digitalRead(2);
  if (prevVal == LOW && val == HIGH) {
    count = count + 1;
  }
    if (count % 3 == 0) {
      analogWrite(red, 0);
      analogWrite(green, 250);
      analogWrite(blue, 100);
    } else if (count % 3 == 1) {
      analogWrite(red, 180);
      analogWrite(green, 0);
      analogWrite(blue, 255);
    } else if (count % 3 == 2) {
      analogWrite(red, 0);
      analogWrite(green, 100);
      analogWrite(blue, 50);
    }
    Serial.println(count % 3);
    prevVal = val;
    delay(10);
  
}