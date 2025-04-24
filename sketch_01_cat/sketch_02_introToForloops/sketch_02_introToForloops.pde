void setup () {
  size (800, 800);
  background (0);
}

void draw () {
  // line of five big circles start to end
  //for (int x = 100; x <= 800; x = x + 150) {
  //  circle(x, 100, 100);
  //}

//  // line of small circles from start to end in the middle of canvas
//  noStroke();
//  for (int x = 0; x <= width; x = x + 15) {
//    circle(x, height/2, 15);
//  }

  // line of small circles from start to end in the middle of canvas
  // draw the line based on mouseX position
  //background (0);
  //for (int x = 0; x < mouseX; x = x + 15) {
  //  circle(x, height/2, 15);
  //}
  
  // for loops using index instead of given range
  for (int i=0; i<10; i++) {
   circle(100 + i * 50, height/ 2, 40);  
} 

  
}
