import processing.serial.*;
import processing.sound.*;

Serial serialPort;
SoundFile sound;

int NUM_LEDS = 60;                   // How many LEDs in your strip?
color[] leds = new color[NUM_LEDS];  // array of one color for each pixel

Amplitude analysis;

void setup() {
  size(900, 600);
  frameRate(30);
  colorMode(HSB, 255); // Color setting for FastLED - Hue-Saturation-Brightness
  printArray(Serial.list());
  
  // Initialize serial port
  serialPort = new Serial(this, "COM5", 115200);
  
  // Initialize all LEDs to off
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = color(0, 0, 0);
  }

  println("Loading mp3...");
  sound = new SoundFile(this, "seasons.mp3");
  if (sound != null) {
    sound.loop();
  } else {
    println("Error loading sound file!");
    exit();
  }

  // Initialize amplitude analysis
  analysis = new Amplitude(this);
  if (analysis != null && sound != null) {
    analysis.input(sound);
  }
}

void draw() {
  background(0);
  
  // Check if sound is properly loaded
  if (sound == null || analysis == null) {
    return;
  }

  // Get current amplitude and map to color/brightness
  float amplitude = analysis.analyze();
  float hue = map(amplitude, 0, 1, 0, 255);
  float brightness = map(amplitude, 0, 0.5, 50, 255);
  color currentColor = color(hue, 255, brightness);
  
  // Light up all LEDs with the same color based on amplitude
  for (int i = 0; i < NUM_LEDS; i++) {
    leds[i] = currentColor;
  }

  // Visual feedback on screen
  fill(currentColor);
  noStroke();
  circle(width/2, height/2, amplitude * width/2);

  sendColors(); // Send the colors to Arduino
}

void sendColors() {
  if (serialPort == null) return;
  
  byte[] out = new byte[NUM_LEDS*3];
  for (int i = 0; i < NUM_LEDS; i++) {
    out[i*3]   = (byte)(floor(hue(leds[i])) >> 1);
    if (i == 0) {
      out[0] |= 1 << 7;
    }
    out[i*3+1] = (byte)(floor(saturation(leds[i])) >> 1);
    out[i*3+2] = (byte)(floor(brightness(leds[i])) >> 1);
  }
  serialPort.write(out);
}
