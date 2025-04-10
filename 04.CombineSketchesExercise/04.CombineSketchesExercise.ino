const int buttonPin = 2;
const int ledPin = 13;
int buttonState = 0;// variable for reading the pushbutton status
int sensorValue;

void setup() {
 pinMode(ledPin, OUTPUT); // initialize the LED pin as an output:
 pinMode(buttonPin, INPUT); // initialize the pushbutton pin as an input:
 Serial.begin(9600);
}

void loop() {
// read the input on analog pin 0:
 sensorValue = analogRead(A0);
 // print out the value you read:
 Serial.println(sensorValue);
 delay(100); 
 
 // read the state of the pushbutton value:
 buttonState = digitalRead(buttonPin);
 // check if the pushbutton is pressed.
 if (buttonState == HIGH) {   // turn LED on:
   Serial.print("Light on");
   digitalWrite(ledPin, HIGH);
 } else {   // turn LED off:
   Serial.print("Light off");
   digitalWrite(ledPin, LOW);
 }
}



