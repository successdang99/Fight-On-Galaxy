class ROCKET{
  float x, y;
  boolean appeared;
  ROCKET(){
    x = mouseX;
    y = mouseY;
    appeared = true;
  }
  
  void move() {
    y-=3;
    if (y<0) {
      appeared = false; 
    }
  }
 
  void output(){
    Image = loadImage("rocket.png");
    fill(0,100,200);
    stroke(255);
    ellipse(x, y-28, 150, 150);
    image(Image, x-14, y-50);
    stroke(0);
  }
}

void explosive(float x, float y){
  for(int i=0; i<numOfPlane; i++) {
    if ((x-p[i].x)*(x-p[i].x) + (y-p[i].y)*(y-p[i].y) <= 75*75) {
      numBullet += 2;
      if (p[i].isBoss) score+=2;
      else score++;
      p[i].isBoss = false;
      p[i] = new PlaneEnemy();
      if (score>maxWin){
        score = maxWin;
        p[i].isWin = true;
      }
    }  
  }
  fill(255,0,0);
  ellipse(x,y,150,150);
  Ro.appeared = false;
}

void Rocket(){
  if (keyPressed && key == ENTER){
    explosive(Ro.x, Ro.y-28);
  }
  for(i=0; i<numOfPlane; i++) {
    if ((Ro.x-p[i].x)*(Ro.x-p[i].x)+(Ro.y-28-p[i].y)*(Ro.y-28-p[i].y) <= 50*50) {
      explosive(Ro.x, Ro.y-28);
      break;
    }    
  }
}
