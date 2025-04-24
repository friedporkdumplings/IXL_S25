int amount = 5;


float [] x = new float [amount];
float [] y = new float [amount];
float [] size = new float [amount];
color [] c = new color [amount];
float [] xspeed = new float [amount];
float [] yspeed = new float [amount];

void setup () {
  size (720, 480);
  for (int i = 0; i<amount; i++) {
    x [i] = random (width);
    y [i] = random (height);
    size [i] = random (40, 80);
    c [i] = color(random (255), random (255), random (255), random (100, 200));
    xspeed [i] = random (2, 5);
    yspeed [i] = random (2, 5);
  }
}

void draw () {
  for (int i = 0; i < amount; i++) {
    fill(c[i]);
    noStroke();
    drawFace(x[i], y[i], size[i], c[i]);
    
    x [i] = x[i] + xspeed[i];
    y [i] += yspeed[i];

    if (x[i] > width + size[i]) {
      x[i] = -size[i];
    }

    if (y[i] > height + size[i]) {
      y [i] = -size[i];
    }
  }
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
