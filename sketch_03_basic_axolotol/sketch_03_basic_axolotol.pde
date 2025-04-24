void setup () {
  size (600, 600);
  background (255);
}


void draw () {

  noStroke();
  fill(#FF81B8);
  ellipse(300, 300, 120, 100); // head
  ellipse(300, 380, 100, 120); // body

  // left side ears
  ellipse(230 + 12, 280 - 20, 50, 20);
  ellipse(230, 280 + 5, 50, 20);
  ellipse(230, 280 + 30, 50, 20);

  // right side ears

  // middle ear
  ellipse(370 - 12, 280 - 20, 50, 20);
  ellipse(370, 280 + 5, 50, 20);
  ellipse(370, 280 + 30, 50, 20);

  fill (#FCD9E8);
  rect (275, 355, 50, 60, 20);

  // eyes
  fill (255);
  circle (330, 295, 30);
  circle (270, 295, 30);
  fill (#FFB2D3);
  circle (335, 295, 20);
  circle (275, 295, 20);

  fill (#FF81B8);
  triangle (275, 430, 320, 430, 350, 550);
  fill (#FCD9E8);
  triangle (290, 440, 310, 440, 340, 530);

  fill (255);
  ellipse (300, 325, 40, 3);

  fill (#FF81B8);
  rect (220, 355, 40, 20, 90);
  rect (340, 355, 40, 20, 90);

  rect (220, 390, 40, 20, 90);
  rect (340, 390, 40, 20, 90);
}
