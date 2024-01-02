boolean checkwin(){
  for(int i=0;i<numOfPlane;i++){
    if (!p[i].isWin) return false;  
  }
  return true;
}

void win(){
  Image = loadImage("win.png");
  image(Image,0,0);
  fill(random(255), random(255), random(255));
  textSize(40);
  text("YOU WIN!!! CONGRATULATION!",100,680);
  textSize(30);
  text("YOUR SCORE:",270,730);
  text(bestScore,475,730);
  bestScore = 1000;
  text("YOUR BEST SCORE:",193,780);
  text(bestScore,475,780);
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
