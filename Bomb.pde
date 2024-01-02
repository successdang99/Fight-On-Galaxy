class Bomb extends Plane{
  Bomb(float ix, float iy){
    super(ix, iy);
  }
    
  void printBomb() {
    float eyeSize = 20;
    stroke(0);
    strokeWeight(3);
    fill(125);
    ellipse(x, y, 40, 40);
    fill(255);
    ellipse(x-eyeSize/2, y, eyeSize, eyeSize);
    ellipse(x+eyeSize/2, y, eyeSize, eyeSize);
    fill(0);
    ellipse(x-eyeSize/2, y, eyeSize/2, eyeSize/2);
    ellipse(x+eyeSize/2, y, eyeSize/2, eyeSize/2);
  } 
    
  boolean isHit(){
    if ((x-p1.x)*(x-p1.x) + (y-p1.y)*(y-p1.y) <= 25*25) return true; 
    return false;
  }
}
