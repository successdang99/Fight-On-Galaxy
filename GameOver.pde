void checkOver(){
  float area;
  for(i=0; i<numOfPlane; i++) {
    if (p[i].isBoss) area = 30*30;
    else area = 25*25;
    if ((p1.x-p[i].x)*(p1.x-p[i].x) + (p1.y-p[i].y)*(p1.y-p[i].y) <= area) {
      survive--;
      numBullet += 2;
      if (survive <= 0) {
        survive = 0;
        state = 2;
        break;
      } else {
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
  }
  for(i=0; i<numBomb; i++){
    b[i].printBomb();
    if (b[i].isHit()) {
      survive--;
      if (survive<=0) {
        survive = 0;
        state = 2;
        break;
      } else {
      //START時、Myplaneの位置はBOMBが当たってないため
        while (true){
          x = random(20,780);
          y = random(60, 760);
          if ((x<mouseX-100 || x>mouseX+100) && (y<mouseY-100 || y>mouseY+100)) break;
        }
        b[i] = new Bomb(x, y);
      }
    }
  }
}

void Over() {
  PImage galaxyImage;
  galaxyImage = loadImage("galaxy.png");
  image(galaxyImage,0,0);
  fill(255);
  textSize(50);
  text("GAME OVER",250,300);
  textSize(30);
  text("YOUR SCORE:",270,350);
  text(score,475,350);
  if (score>bestScore) bestScore = score;
  text("YOUR BEST SCORE:",193,400);
  text(bestScore,475,400);
  strokeWeight(1);
  stroke(0);
  fill(255,255,0);
  rect(325,560,150,60);
  fill(255,0,0);
  stroke(0);
  textSize(25);
  text("PLAY AGAIN",327,600);
  if (mousePressed && mouseX>=325 && mouseX<=475 && mouseY>=560 && mouseY<=620) {
    state = 1;
    num=0;
    score=0;
    numBullet = 100;
    bonusBullet = 1;
    bonusBlood = 1;
    Boss = 50;
    rocket = 30;
    Ro = new ROCKET(); 
    Ro.appeared = false;
    for (int i=0; i<numOfPlane; i++) {
      p[i] = new PlaneEnemy();
      p[i].y = random(50, 200);
    }
    for(i=0; i<numBomb; i++) {
      //START時、Myplaneの位置はBOMBが当たってないため
      while (true){
        x = random(20,780);
        y = random(60, 760);
        if ((x<mouseX-100 || x>mouseX+100) && (y<mouseY-100 || y>mouseY+100)) break;
      }
      b[i] = new Bomb(x, y);
    }
    survive = 5;
  }
}
