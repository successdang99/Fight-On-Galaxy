class PlaneEnemy {
  boolean isBoss; //visibleという状態と同じである。
  boolean isWin; //勝つと、敵の飛行機が出ないため、isWinとは勝ったかどうか確認する変数である
  float x, y;

  PlaneEnemy() {
    x = random(50, 750);
    y = 0;
    if (score<Boss) {
      isBoss = false;
    } else {
        isBoss = true;
        Boss+=50;
      }
    if (score>=maxWin) isWin = true;
    else isWin = false;
  }

  void isHit() {
    for (int i=1; i<=num; i++) {
      if (x-25<=vtx[i] && x+25>=vtx[i] && y+25>=vty[i] && y-25<=vty[i]) {
        if (isBoss) score+=2;
        else score++;
        if (score>maxWin) {
          score = maxWin;
          isWin = true;
        }
        x = random(50, 750);
        y = 0;
        if (score<Boss) {
          isBoss = false;
        } else {
          isBoss = true;
          Boss+=50;
        }
        int tm=vtx[i]; vtx[i]=vtx[num]; vtx[num]=tm;
        tm=vty[i]; vty[i]=vty[num]; vty[num]=tm;
        num--;
        numBullet += 2;
        break;
      }
    }
  }

  void move() {
    y+=1+float(score)/200;
    if (state!=2 && y>800) {
      survive--;
      if (survive<1) state = 2;
      else y = 0;
      isBoss = false;
    }
    isHit();
  }

  void output() {
    strokeWeight(1);
    if (!isWin) {
      if (isBoss) {
        fill(random(255), random(255), random(255));
        ellipse(x, y, 60, 12);
        ellipse(x, y-25, 24, 12);
        ellipse(x, y, 10, 50);
        ellipse(x, y+12, 8, 15);
        ellipse(x, y-25, 6, 15);
        noStroke();
        fill(255, 215, 0);
        arc(x-6, y-39, 9, 27, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 155, 0);
        arc(x-6, y-37, 8, 20, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 95, 0);
        arc(x-6, y-35, 5, 10, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 215, 0);
        arc(x+6, y-39, 9, 27, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 155, 0);
        arc(x+6, y-37, 8, 20, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 95, 0);
        arc(x+6, y-35, 5, 10, PI-PI/6, 2*PI+PI/6, OPEN);
        stroke(0);
      } else {
        fill(238, 130, 238);
        ellipse(x, y, 50, 10);
        ellipse(x, y-20, 20, 10);
        ellipse(x, y, 10, 50);
        ellipse(x, y+10, 6, 10);
        ellipse(x, y-20, 4, 15);
        noStroke();
        fill(255, 215, 0);
        arc(x-6, y-32, 9, 27, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 155, 0);
        arc(x-6, y-30, 8, 20, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 95, 0);
        arc(x-6, y-28, 5, 10, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 215, 0);
        arc(x+6, y-32, 9, 27, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 155, 0);
        arc(x+6, y-30, 8, 20, PI-PI/6, 2*PI+PI/6, OPEN);
        fill(255, 95, 0);
        arc(x+6, y-28, 5, 10, PI-PI/6, 2*PI+PI/6, OPEN);
        stroke(0);
      }
    }
  }
}
