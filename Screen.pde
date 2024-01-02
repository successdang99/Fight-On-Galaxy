void Screen(){
  stroke(255);
  fill(0);
  rect(width-100, 0, 100, 50);
  rect(0,0,100,50);
  rect(100,0,100,50);
  fill(255);
  textSize(20);
  text("SCORE:",700,25);
  text(score, 700, 45);
  text(numBullet,35,45);
  text(rocket,135,45);
  textSize(10);
  text("SHOTS REMAINING:",3,25);
  text("ROCKETS:",103,25);
  stroke(0);
  stroke(255);
  fill(0, 100, 200);
  if (survive <= 0) survive = 0;
  rect(300,10,200,30);
  if (survive>0) {
    fill(255,0,0);
    noStroke();
    rect(301,11,(40*survive)-1,29);
  }
}
