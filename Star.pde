class Star{
  float x, y, z, pz;
  
  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(height);
    pz = z;
  }
  
  void update() {
    z = z-speed;
    if (z<1) {
      z = height;
      x = random(-width, width);
      y = random(-height, height);
      pz = z;
    }
  }
  
  void output() {
    fill(255);
    noStroke();
    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, height);
    float r = map(z,0,width,6,0);
    ellipse(sx, sy, r, r);
    
    float px = map(x/pz, 0, 1, 0, width);
    float py = map(y/pz, 0, 1, 0, height);
    pz=z;
    stroke(255);
    line(px, py, sx, sy);
  }
}
