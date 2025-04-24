import processing.serial.*;

Serial serialPort;

void setup() {
size(400, 400);
  //On Windows
  printArray(Serial.list());
  serialPort = new Serial(this, "COM5", 9600);

}

void draw() {

  if (mousePressed) {
    if (mouseX > width/2) {
      background(255, 0, 0);
      serialPort.write("r");
    } else {
      background(0, 255, 0);
      serialPort.write("g");
    }
  }

}
