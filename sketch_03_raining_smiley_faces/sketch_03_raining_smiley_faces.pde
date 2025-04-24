int amount = 40;


float [] x = new float [amount];
float [] y = new float [amount];
float [] size = new float [amount];
color [] c = new color [amount];
float [] xspeed = new float [amount];
float [] yspeed = new float [amount];
float gravity = 2;

void setup () {
  size (600, 600);
  for (int i = 0; i<amount; i++) {
    x [i] = random (width);
    y [i] = random (height);
    size [i] = random (50, 100);
    c [i] = color(31, 255, 238, random (100,255));
    xspeed [i] = 0;
    yspeed [i] = gravity;
  }
}

void draw() {
  background(255);
  //drawFace(100, 200, 100, color(145,207,250));
  //drawFace(400, 400, 200, color(250,106,166));


  for (int i = 0; i < amount; i++) {
    fill(c[i]);
    noStroke();
    drawFace(x[i], y[i], size[i], c[i]);
    x [i] = x[i] + xspeed[i];
    y [i] += yspeed[i];

    if (y[i] + size[i]/2 < height) {
      yspeed[i] = gravity;
    } else {
      yspeed[i] = 0; 
      y[i] = height - size[i]/2; // stop them at the ground
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


void mousePressed () {
  int i = floor(random (amount));
  x[i] = mouseX;
  y[i] = mouseY;
  println("X coordinates:");
  printArray(x);
  println("Y coordinates:");
  printArray(y);
}
