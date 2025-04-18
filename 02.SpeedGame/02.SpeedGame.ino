/*************************************************
   Public Constants, defining the pin numbers used in Arduino
 *************************************************/
int buzzerPin = 8;
int buttonPin1 = 2;
int buttonPin2 = 3;
int ledPin1 = 9;
int ledPin2 = 10;

/*************************************************
   Public Constants, defining the notes in Hertz
 *************************************************/
#define NOTE_B0 31
#define NOTE_C1 33
#define NOTE_CS1 35
#define NOTE_D1 37
#define NOTE_DS1 39
#define NOTE_E1 41
#define NOTE_F1 44
#define NOTE_FS1 46
#define NOTE_G1 49
#define NOTE_GS1 52
#define NOTE_A1 55
#define NOTE_AS1 58
#define NOTE_B1 62
#define NOTE_C2 65
#define NOTE_CS2 69
#define NOTE_D2 73
#define NOTE_DS2 78
#define NOTE_E2 82
#define NOTE_F2 87
#define NOTE_FS2 93
#define NOTE_G2 98
#define NOTE_GS2 104
#define NOTE_A2 110
#define NOTE_AS2 117
#define NOTE_B2 123
#define NOTE_C3 131
#define NOTE_CS3 139
#define NOTE_D3 147
#define NOTE_DS3 156
#define NOTE_E3 165
#define NOTE_F3 175
#define NOTE_FS3 185
#define NOTE_G3 196
#define NOTE_GS3 208
#define NOTE_A3 220
#define NOTE_AS3 233
#define NOTE_B3 247
#define NOTE_C4 262
#define NOTE_CS4 277
#define NOTE_D4 294
#define NOTE_DS4 311
#define NOTE_E4 330
#define NOTE_F4 349
#define NOTE_FS4 370
#define NOTE_G4 392
#define NOTE_GS4 415
#define NOTE_A4 440
#define NOTE_AS4 466
#define NOTE_B4 494
#define NOTE_C5 523
#define NOTE_CS5 554
#define NOTE_D5 587
#define NOTE_DS5 622
#define NOTE_E5 659
#define NOTE_F5 698
#define NOTE_FS5 740
#define NOTE_G5 784
#define NOTE_GS5 831
#define NOTE_A5 880
#define NOTE_AS5 932
#define NOTE_B5 988
#define NOTE_C6 1047
#define NOTE_CS6 1109
#define NOTE_D6 1175
#define NOTE_DS6 1245
#define NOTE_E6 1319
#define NOTE_F6 1397
#define NOTE_FS6 1480
#define NOTE_G6 1568
#define NOTE_GS6 1661
#define NOTE_A6 1760
#define NOTE_AS6 1865
#define NOTE_B6 1976
#define NOTE_C7 2093
#define NOTE_CS7 2217
#define NOTE_D7 2349
#define NOTE_DS7 2489
#define NOTE_E7 2637
#define NOTE_F7 2794
#define NOTE_FS7 2960
#define NOTE_G7 3136
#define NOTE_GS7 3322
#define NOTE_A7 3520
#define NOTE_AS7 3729
#define NOTE_B7 3951
#define NOTE_C8 4186
#define NOTE_CS8 4435
#define NOTE_D8 4699
#define NOTE_DS8 4978

/*************************************************
   Public Variables
 *************************************************/

int goal = 10;
int buttonState1 = LOW;
int previousState1 = LOW;
int buttonState2 = LOW;
int previousState2 = LOW;

int counter1 = 0;
int counter2 = 0;
boolean winner1 = false;
boolean winner2 = false;

// the follow variables are long's because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.
long time = 0;        // the last time the output pin was toggled
long debounce = 200;  // the debounce time, increase if the output flickers




// notes in the melody:
int melody[] = {
  NOTE_C4, NOTE_D4, NOTE_F4, NOTE_D4, NOTE_A4, 0, 
  NOTE_A4, NOTE_G4, 0, 
  NOTE_C4, NOTE_D4, NOTE_F4, NOTE_D4, NOTE_G4, 0,
  NOTE_G4, NOTE_F4, 0
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  16, 16, 16, 16, 8, 16,
  4, 4, 3,
  16, 16, 16, 16, 8, 4,
  4, 4, 1
};


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(buzzerPin, OUTPUT);
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  Serial.println("******************* RACE THE LED *******************");
  delay(1000);
  Serial.println("READY");
  delay(1000);
  Serial.println("SET");
  delay(1500);
  Serial.println("GO!!!!!!!!!!!!!!!!");
}

void loop() {
  // put your main code here, to run repeatedly:
  buttonState1 = digitalRead(buttonPin1);
  buttonState2 = digitalRead(buttonPin2);
  //Serial.println(buttonState1);

  //this checks the times player 01 has pressed the button
  if (counter1 < goal && winner2 == false) {
    if (buttonState1 != previousState1 && millis() - time > debounce) {
      if (buttonState1 == HIGH) {
        counter1++;
        Serial.print("player 01:  ");
        Serial.println(counter1);
        time = millis();
      }
    }
    previousState1 = buttonState1;
    if (counter1 == goal && winner2 == false) {
      winner1 = true;
      digitalWrite(ledPin1, HIGH);
      Serial.println("PLAYER 01 WINS");
      playMelody();
    }
  }

  //this checks the times player 02 has pressed the button

  if (counter2 < goal && winner1 == false) {
    if (buttonState2 != previousState2 && millis() - time > debounce) {
      if (buttonState2 == HIGH) {
        counter2++;
        Serial.print("player 02:  ");
        Serial.println(counter2);
        time = millis();
      }
    }
    previousState2 = buttonState2;
    if (counter2 == goal && winner2 == false) {
      winner2 = true;
      digitalWrite(ledPin2, HIGH);
      Serial.println("PLAYER 02 WINS");
      playMelody();
    }
  }
}

void playMelody() {

  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 18; thisNote++) {

    // to calculate the note duration, take one second divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(8, melody[thisNote], noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(8);
  }
  
  
}
