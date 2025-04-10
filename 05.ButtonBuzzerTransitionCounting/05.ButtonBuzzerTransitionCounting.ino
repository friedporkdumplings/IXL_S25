int led = 9;
int buzzer = 8;
int button = 2;
int buttonState;
int prevState;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(led, OUTPUT);
  pinMode(button, INPUT);
  pinMode(buzzer, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  buttonState = digitalRead(button);
  if (prevState == 0 && buttonState == 1) {
    Serial.println("pressed");
    digitalWrite(led, HIGH);
    tone(buzzer, 400, 200);
  }
  if (prevState == 1 && buttonState == 0) {
    Serial.println("not pressed");
    digitalWrite(led, LOW);
    noTone(buzzer);
  }
  prevState = buttonState;
}
