void setup () {
  size (800, 800);
  background (255);
}

void draw () {
  strokeWeight (5);
  rect(50, 50, 700, 700);
  line (50, height/2, 750, height/2);
  line (width/2, 50, width/2, 750);

  for (int x = 50; x < width/2; x=x+10) {
    line (x, 50, x, 400);
  }

  for (int y = 50; y < 400; y=y+10) {
    line (400, y, 750, y);
  }

  for (int x = 400; x < 740; x=x+15) {
    line(x, 400, x+90, 750);
  }

  //for (int y = 450; y < height/2; y=y+15) {
  //  line(400, y, 750, y+15);
  //}
  
  //for (int x = 0; x < width/2; x = x + 50) {
  // circle(x, height/2, 40);
  //}
}
// diagonal line
//  line (height/2, width/2, 2, 2);
