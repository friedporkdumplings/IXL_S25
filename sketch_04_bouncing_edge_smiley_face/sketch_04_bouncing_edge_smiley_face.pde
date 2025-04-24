int amount = 1;

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
    size [i] = random (80, 120);
    c [i] = color(random (255), random (255), random (255), random (100, 200));
    xspeed [i] = random (3, 5);
    yspeed [i] = random (3, 5);
  }
}

void draw () {
  background (255);
  for (int i = 0; i < amount; i++) {
    fill(c[i]);
    noStroke();
    
    drawFace(x[i], y[i], size[i], c[i]);
    
    x[i] += xspeed[i];
    y[i] += yspeed[i];

    // right edge
    if (x[i] + size[i]/2 > width) {
      xspeed[i] *= -1;
      x[i] = width - size[i]/2;
      c[i] = color(random(255), random(255), random(255), random(100, 200));
    }
    
    // left edge
    if (x[i] - size[i]/2 < 0) {
      xspeed[i] *= -1;
      x[i] = size[i]/2;
      c[i] = color(random(255), random(255), random(255), random(100, 200));
    }
    
    // bottom edge
    if (y[i] + size[i]/2 > height) {
      yspeed[i] *= -1;
      y[i] = height - size[i]/2;
      c[i] = color(random(255), random(255), random(255), random(100, 200));
    }
    
    // top edge
    if (y[i] - size[i]/2 < 0) {
      yspeed[i] *= -1;
      y[i] = size[i]/2;
      c[i] = color(random(255), random(255), random(255), random(100, 200));
    }
  }
}

void drawFace(float fx, float fy, float size, color c) {
  noStroke();
  fill(c);
  
  ellipse(fx, fy, size, size);
  fill(255);
  ellipse(fx-size*0.3, fy-size*0.1, size*0.05, size*0.05);
  ellipse(fx+size*0.3, fy-size*0.1, size*0.05, size*0.05);
  arc(fx, fy, size*0.6, size*0.6, 0, PI);
}
