class Plane {
  float x, y;

  Plane(float ix, float iy) {
    x= ix; 
    y= iy;
  }
  
  void move() {
    y = y + 2;
    if (y>height) y=0;
  }

  void output() {
    fill(0,255,0);
    strokeWeight(1);
    ellipse(x, y, 50, 10);
    ellipse(x, y+20, 20, 10);
    ellipse(x, y, 10, 50);
    ellipse(x, y-10, 6, 10);
    ellipse(x, y+20, 4, 15);
    stroke(0);
    fill(255); rect(x+5, y-5, 15, 10);
    image(vn,x-20,y-5);
    noStroke();
    fill(255,0,0); ellipse(x+12.5,y,6,6);
    fill(255, 215, 0);
    arc(x-6, y+33, 9, 27, -PI/6, PI+PI/6, OPEN);
    fill(255, 155, 0);
    arc(x-6, y+31, 8, 20, -PI/6, PI+PI/6, OPEN);
    fill(255, 95, 0);
    arc(x-6, y+29, 5, 10, -PI/6, PI+PI/6, OPEN);
    fill(255, 215, 0);
    arc(x+6, y+33, 9, 27, -PI/6, PI+PI/6, OPEN);
    fill(255, 155, 0);
    arc(x+6, y+31, 8, 20, -PI/6, PI+PI/6, OPEN);
    fill(255, 95, 0);
    arc(x+6, y+29, 5, 10, -PI/6, PI+PI/6, OPEN);
    stroke(0);
  }
}
