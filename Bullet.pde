//The class of Bullet's the Item
class Bullet {
  float x, y;
  
  Bullet() {
    x = random(0,width-sizeX);
    y = -sizeY;
  }

  void move() {
    y+=3+float(score)/200;
    if (y>height) {
      bonusBullet++;
    }
  }
  
  boolean isHit(){
    if (x<=p1.x+20 && x+sizeX>=p1.x-20 && y<=p1.y+20 && y+sizeY>=p1.y-20) return true;
    return false;
  }

  void output(String str) {
    Image = loadImage(str);
    image(Image, x, y);
  }
}

void plusBullet(){
  if (Bu.isHit()) {
    bonusBullet++;
    rocket+=20;
    Bu.y=-sizeY;
    numBullet+=40;
    if (numBullet>10000) numBullet = 10000;
  }
  Bu.move();
  Bu.output("bullet.png");
}
