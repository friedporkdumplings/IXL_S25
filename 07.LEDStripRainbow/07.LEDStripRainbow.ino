// #include <FastLED.h>

// #define NUM_LEDS 60 // How many leds on your strip?
// #define DATA_PIN 3
// CRGB leds[NUM_LEDS];

// int hue;

// void setup() {
//   Serial.begin(9600);
//   FastLED.addLeds<NEOPIXEL, DATA_PIN>(leds, NUM_LEDS);
//   FastLED.setBrightness(50);
// }

// void loop() {
//  if (Serial.available() > 0) {
//     char in = Serial.read();
//     if (in == 'r') {
//      for (int i=0; i < 60; i=i+1) {
//        leds[i] = CHSV(hue, 0, 0);
//      }
//      FastLED.show();
//     }
//     if (in == 'g') {
//      for (int i=0; i < 60; i=i+1) {
//        leds[i] = CRGB(hue, 255, 0);
//      }
//      FastLED.show();
//     }
//   }
// }

#include <FastLED.h>
#define NUM_LEDS 60  // How many leds on your strip?
#define DATA_PIN 3
CRGB leds[NUM_LEDS];
int hue; // declare variable for hue

void setup() {
 FastLED.addLeds<NEOPIXEL, DATA_PIN>(leds, NUM_LEDS);
 FastLED.setBrightness(50);
}

void loop() {
 for (int i = 0; i < NUM_LEDS; i = i + 1) {
   leds[i] = CHSV(hue + (i*10), 255, 255); // Moving rainbow
 }
 EVERY_N_MILLISECONDS(15) { // non blocking delay() function
   hue++;
 }
 FastLED.show();
}
