void setup() {
  size (600, 600);
  background (0);
}

void draw() {
  // moving circle following mouse w/changing background color
  //background (map (mouseX, 0, width, 0, 255));
  //noStroke();
  //fill (127);
  //circle (mouseX, mouseY, 100);
  
  // black background draw with a continous white line follows mouse
  //stroke (255);
  //line (pmouseX, pmouseY, mouseX, mouseY);
  
  // only draw line if mouse pressed, line follows mouse
  stroke (255);
  if (mousePressed) {
  line (pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mousePressed () {
  stroke (random (255), random (255), random (255));
}
