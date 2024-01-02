int numOfPlane = 10, numBomb = 8, score = 0, bestScore=0, survive = 5, Boss = 50, maxWin = 1000;
int sizeX = 30, sizeY=48; //Size of Items's Blood and Blullet
int sizeRx = 28, sizeRy = 50; //Size of Rocket 
int i, num=0, numBullet = 100, rocket = 30, bonusBullet=1, bonusBlood = 1, state = 0;
float x, y, speed;
int[] vtx = new int[10001];
int[] vty = new int[10001];
MyPlane p1;
PlaneEnemy[] p;
Bomb[] b;
Blood Bl;
Bullet Bu;
Star[] stars = new Star[800];
ROCKET Ro;
PImage vn, Image;

void setup() {
  size(800, 800);
  frameRate(32);
  //
  vn = loadImage("VN.png");
  p=new PlaneEnemy[numOfPlane];
  b=new Bomb[numBomb];
  Bu =new Bullet();
  Bl =new Blood();
  Ro = new ROCKET(); 
  Ro.appeared = false;
  for (i=0; i<numOfPlane; i++) {
    p[i] = new PlaneEnemy();
    p[i].y = random(50, 200);
  }
  for (i=0; i<numBomb; i++) {
    //START時、Myplaneの位置はBOMBが当たってないため
    while (true) {
      x = random(20, 780);
      y = random(60, 760);
      if ((x<mouseX-100 || x>mouseX+100) && (y<mouseY-100 || y>mouseY+100)) break;
    }
    b[i] = new Bomb(x, y);
  }
  for (int i = 0; i< stars.length; i++) {
    stars[i] = new Star();
  }
  p1 =new MyPlane(mouseX, mouseY);
}

void draw() {
  switch(state) {
    case 0: //Start Game
      Start();
      break;
    case 1: //In game
      int tm;
      background(0, 100, 200);
      //右のマウスをクリックしたら、弾が出る 
      if (num<10000 && numBullet>0 && mousePressed && mouseButton == LEFT) {
        num++;
        numBullet--;
        vtx[num] = mouseX;
        vty[num] = mouseY;
      }
      
      //左のマウスをクリックしたら、Rocketが出る 
      if (rocket>0 && !Ro.appeared && mousePressed && mouseButton == RIGHT) {
        Ro = new ROCKET();  
        rocket--;
      }
      if (Ro.appeared){
        Ro.move();
        Ro.output();
        Rocket();
      } 
      
      if (score >= bonusBullet*45) plusBullet(); //The Item of Bullet
      if (score >= bonusBlood*100) plusBlood(); //The Item of Blood
      
      //弾を描く
      i=0;
      while (i<num) {
        i++;
        fill(255, 0, 0);
        vty[i] -= 10;
        if (vty[i]<0) {
          tm=vtx[i]; vtx[i]=vtx[num]; vtx[num]=tm;
          tm=vty[i]; vty[i]=vty[num]; vty[num]=tm;
          num--;
          continue;
        }
        stroke(255, 0, 0); 
        strokeWeight(8);
        line(vtx[i], vty[i], vtx[i], vty[i]+15);
        strokeWeight(1); 
        stroke(0);
      }
    
      //check GameOver
      checkOver();
    
      for (i=0; i<numOfPlane; i++) {
        p[i].output();
        p[i].move();
      }
      p1 =new MyPlane(mouseX, mouseY); 
      p1.printMousePosition();
      Screen();
      if (score>=maxWin && checkwin()){
        state = 3;
      } 
      break;
      
    case 2: // Game Over   
      Over();
      break;
      
    default: 
      win();
  }
  
  speed = map(mouseX, 0, width, 5, 25);
  translate(width/2, height/2); //星が中心へ行く
  for (int i = 0; i< stars.length; i++) {
    stars[i].update();
    stars[i].output();
  }
}
