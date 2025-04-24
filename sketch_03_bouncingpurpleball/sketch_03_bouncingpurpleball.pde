float x;
float y;
float size;
color c;
float xspeed;
float yspeed;

void setup () {
  size (600, 600);
  x = width/2;
  y = height/2;
  size = 50;
  c = color(200, 0, 200);
  xspeed = 3;
  yspeed = 4;
}

void draw () {
  background (255);
  fill(c);
  noStroke();
  circle(x, y, size);
  x = x + xspeed;
  y += yspeed;
  
  if (x > width + size) {
    x = -size;
}
  
  if (y > height + size) {
    y = -size;
  }
}
