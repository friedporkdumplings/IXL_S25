void setup () {
  size (800, 800);
  background (255);
}

void draw () {
  if (mousePressed) {
    float r = random (255);
    float g = random (255);
    float b = random (255);
    stroke (r, g, b);
    fill (r, g, b, random (100,200));
    circle (mouseX+50, mouseY+50, random (50, 200));
    rect (mouseX+75, mouseY+75, random (50, 200), random (50, 200));
  }
}

//void mousePressed () {
//  float r = random (255);
//  float g = random (255);
//  float b = random (255);
//  stroke (r, g, b);
//  fill (r, g, b);
//  circle (mouseX, mouseY, random (50, 200));
//  }

void keyPressed () {
  if (key == 'r' || key == 'R') {
    background (255);
  }
}
