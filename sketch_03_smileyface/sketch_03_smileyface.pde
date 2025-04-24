void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  drawFace(100, 200, 100, color(145,207,250));
  drawFace(400, 400, 200, color(250,106,166));
}

void drawFace( float fx, float fy, float size, color c) {
  noStroke();
  fill(c);
  ellipse(fx, fy, size, size);
  fill(255);
  ellipse(fx-size*0.3, fy-size*0.1, size*0.05, size*0.05);
  ellipse(fx+size*0.3, fy-size*0.1, size*0.05, size*0.05);
  arc(fx, fy, size*0.6, size*0.6, 0, PI);
}
