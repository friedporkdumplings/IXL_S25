int amount = 30;

float [] x = new float [amount];
float [] y = new float [amount];
float [] size = new float [amount];
float [] originalSize = new float [amount];
color [] c = new color [amount];
color [] eyeColor = new color [amount]; // color for eyes when bouncing off walls
float [] xspeed = new float [amount];
float [] yspeed = new float [amount];

color normalColor = #FF81B8;
color scaredColor = #ADD8E6;
float scaredDistance = 80;
float sizeMultiplier = 0.8;

void setup () {
  size (720, 480);
  for (int i = 0; i < amount; i++) {
    x[i] = random(width);
    y[i] = random(height);
    originalSize[i] = random(50, 80);
    size[i] = originalSize[i];
    c[i] = normalColor;
    // inital eye color
    eyeColor[i] = #FFB2D3; 
    xspeed[i] = random(-5, 5);
    yspeed[i] = random(-5, 5);
  }
}

void draw () {
  background(255);
  for (int i = 0; i < amount; i++) {
    noStroke();
    
    // scared axolotol when mouse come too close
    float distanceToMouse = dist(mouseX, mouseY, x[i], y[i]);
    if (distanceToMouse < scaredDistance) {
      c[i] = scaredColor;
      size[i] = originalSize[i] * sizeMultiplier;
    } else {
      c[i] = normalColor;
      size[i] = originalSize[i];
    }
    
    drawAxolotl(x[i], y[i], size[i], c[i], eyeColor[i]);
    
    x[i] += xspeed[i];
    y[i] += yspeed[i];

    // changed original all if statements to the additional of boolean
    // if bool true then eyes will change color randomly
    boolean hitWall = false;
    
    if (x[i] + originalSize[i]/2 > width) {
      xspeed[i] *= -1;
      x[i] = width - originalSize[i]/2;
      hitWall = true;
    }
    
    if (x[i] - originalSize[i]/2 < 0) {
      xspeed[i] *= -1;
      x[i] = originalSize[i]/2;
      hitWall = true;
    }
    
    if (y[i] + originalSize[i]/2 > height) {
      yspeed[i] *= -1;
      y[i] = height - originalSize[i]/2;
      hitWall = true;
    }
    
    if (y[i] - originalSize[i]/2 < 0) {
      yspeed[i] *= -1;
      y[i] = originalSize[i]/2;
      hitWall = true;
    }
    
    // change eye color when hitting wall
    if (hitWall) {
      eyeColor[i] = color(random(255), random(255), random(255));
    }
  }
}

void drawAxolotl(float fx, float fy, float s, color bodyColor, color eyesColor) {
  float headWidth = s * 1.2;
  float headHeight = s;
  float bodyWidth = s;
  float bodyHeight = s * 1.2;
  
  noStroke();
  fill(bodyColor);
  // head and body
  ellipse(fx, fy, headWidth, headHeight); 
  ellipse(fx, fy + s*0.8, bodyWidth, bodyHeight);

  // left side ears
  ellipse(fx - s*0.58, fy - s*0.2, s*0.5, s*0.2);
  ellipse(fx - s*0.7, fy + s*0.05, s*0.5, s*0.2);
  ellipse(fx - s*0.7, fy + s*0.3, s*0.5, s*0.2);

  // right side ears
  ellipse(fx + s*0.58, fy - s*0.2, s*0.5, s*0.2);
  ellipse(fx + s*0.7, fy + s*0.05, s*0.5, s*0.2);
  ellipse(fx + s*0.7, fy + s*0.3, s*0.5, s*0.2);

  fill(#FCD9E8);
  rect(fx - s*0.25, fy + s*0.55, s*0.5, s*0.6, s*0.2);

  // eyes
  fill(255);
  circle(fx + s*0.3, fy - s*0.05, s*0.3);
  circle(fx - s*0.3, fy - s*0.05, s*0.3);
  fill(eyesColor);
  circle(fx + s*0.35, fy - s*0.05, s*0.2);
  circle(fx - s*0.25, fy - s*0.05, s*0.2);

  // tail
  fill(bodyColor);
  triangle(fx - s*0.25, fy + s*1.3, 
           fx + s*0.2, fy + s*1.3, 
           fx + s*0.5, fy + s*2.5);
  fill(#FCD9E8);
  triangle(fx - s*0.1, fy + s*1.4, 
           fx + s*0.1, fy + s*1.4, 
           fx + s*0.4, fy + s*2.3);

  // mouth 
  fill(255);
  ellipse(fx, fy + s*0.25, s*0.4, s*0.03);

  // limbs
  fill(bodyColor);
  rect(fx - s*0.8, fy + s*0.55, s*0.4, s*0.2, s*0.9);
  rect(fx + s*0.4, fy + s*0.55, s*0.4, s*0.2, s*0.9);
  rect(fx - s*0.8, fy + s*0.9, s*0.4, s*0.2, s*0.9);
  rect(fx + s*0.4, fy + s*0.9, s*0.4, s*0.2, s*0.9);

}
