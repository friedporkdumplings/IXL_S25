
// constants won't change. They're used here to set pin numbers:
const int buttonPin = 2;  // the number of the pushbutton pin
const int ledPin = 13;    // the number of the LED pin

// variables will change:
int buttonState = 0;  // variable for reading the pushbutton status

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
}

void loop() {
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState == HIGH) {
    // turn LED on:
    digitalWrite(ledPin, HIGH);
    tone(8, 659, 50); // E4
    delay(250);
    tone(8, 587, 50); // D4
    delay(250);
    tone(8, 523, 50); // C5
    delay(150);
    tone(8, 587, 50); // D4
    delay(250);
    tone(8, 659, 50); // E4
    delay(250);
    tone(8, 659, 50); // E4
    delay(250);
    tone(8, 659, 50); // E4
    delay(350);
    tone(8, 587, 50); // D4
    delay(250);
    tone(8, 587, 50); // D4
    delay(250);
    tone(8, 587, 50); // D4
    delay(350);
    tone(8, 659, 50); // E4
    delay(250);
    tone(8, 391, 50); // G4
    delay(250);
    tone(8, 391, 50); // G4
    delay(250);
  } else {
    // turn LED off:
    digitalWrite(ledPin, LOW);
    noTone(8);
  }
}
