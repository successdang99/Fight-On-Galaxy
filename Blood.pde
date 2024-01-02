//The class of Blood's the Item
class Blood extends Bullet{
  Blood(){
    super();
  }
  
  boolean isHit(){
    if (x<=p1.x+20 && x+sizeX>=p1.x-20 && y<=p1.y+20 && y+sizeY>=p1.y-20) return true;
    return false;
  }
  
  void move() {
    y+=3+float(score)/200;
    if (y>height) {
      bonusBlood++;
      y = 0;
    }
  }
 
  void output(){
    output("blood.png");
  }
}

void plusBlood(){
  if (Bl.isHit()) {
    bonusBlood++; 
    Bl.y=-sizeY;
    if (survive<5) survive++;
  }
  Bl.move();
  Bl.output();
}
