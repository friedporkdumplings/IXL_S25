float x;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  //stroke(245, 7, 7);
  strokeWeight(3);
  stroke (#BF0000);
  //textSize(28);
  //fill (0);
  //text("X: " + mouseX, 20, 20);
  //text("Y: " + mouseY, 20, 40);

  // body (overlapping aestehtic purpose)
  fill (#86CB73);
  rect (0, 430, 800, 400);
  fill (#DBFCFF);
  rect (0, 0, 800, 430);
  // bg clouds
  drawCloud(x);
  drawCloud(x - 400);
  drawCloud(x + 400);

  x += 0.75;

  if (x > width + 200) {
    x = 0;
  }

  stroke (#F5CF92);
  
  // body
  fill(#FCA0FF);
  rect (315, 280, 60, 90);
  fill(#7F8BD6);
  rect (363, 460, 45, 100);
  fill(#7F8BD6);
  rect (447, 460, 50, 100);
  fill(#ADD6FF);
  triangle (420, 410, 420, 530, 530, 460);
  fill(#67D0FF);
  ellipse (460, 370, 80, 90);
  fill(#F3FCB5);
  rect (380, 380, 100, 100);
  fill(#FCA0FF);
  rect (340, 280, 100, 120);
  fill(#A0FDFF);
  rect (340, 280, 100, 120);
  fill(#DFA0FF);
  ellipse (346, 410, 75, 120);
  fill(#67D0FF);
  ellipse (510, 330, 70, 90);
  fill(#BC71FF);
  triangle (345, 440, 420, 540, 420, 440);
  fill(#BC71FF);
  rect (480, 360, 60, 100);

  // tail
  fill (#FFB7F6);
  beginShape ();
  vertex (520, 400);
  vertex (560, 400);
  vertex (560, 490);
  vertex (500, 570);
  vertex (430, 580);
  vertex (380, 550);
  vertex (410, 530);
  vertex (480, 515);
  vertex (535, 520);
  vertex (520, 400);
  endShape();



  // ear 1
  fill (#7CFFF7);
  triangle (335, 200, 300, 65, 430, 160);

  fill (#F9FFB7);
  // head
  beginShape ();
  vertex (350, 140); // top line
  vertex (500, 140);
  vertex (530, 200);
  vertex (530, 280); // right straight line
  vertex (480, 330);
  vertex (380, 330); // bottom line
  vertex (320, 280);
  vertex (320, 200);
  vertex (350, 140);
  endShape();

  // ear 2
  fill(#FCA0FF);
  triangle(515, 200, 550, 60, 450, 160);

  // eyes
  fill (#62FF6D);
  beginShape();
  vertex (350, 230);
  vertex (380, 210);
  vertex (405, 230);
  vertex (380, 245);
  vertex (350, 230);
  endShape();

  beginShape();
  vertex (445, 230);
  vertex (475, 210);
  vertex (500, 230);
  vertex (475, 245);
  vertex (445, 230);
  endShape();

  // nose
  fill(#DFA0FF);
  triangle(400, 265, 450, 265, 425, 290);

  stroke (#3E3D3D);
  fill (#F5B234);
  rect (250, 600, 100, 60);
  fill(#F0D198);
  ellipse (300, 600, 100, 50);
}


void drawCloud(float x) {
  fill(255);
  stroke(255);
  circle(x, 50, 60);
  circle(x + 40, 70, 60);
  circle(x + 80, 70, 60);
  circle(x + 60, 90, 60);
  circle(x + 20, 90, 60);
  circle(x - 10, 80, 60);
}
