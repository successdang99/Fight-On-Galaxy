void Start() {
  PImage galaxyImage;
  galaxyImage = loadImage("galaxy.png");
  image(galaxyImage,0,0);
  fill(255);
  textSize(40);
  text("WISH YOU HAVE A GOOD DAY!",120,300);
  fill(255,255,0);
  strokeWeight(1);
  stroke(0);
  rect(325,560,150,60);
  fill(255,0,0);
  textSize(25);
  text("PLAY GAME",330,600);
  if (mousePressed && mouseX>=325 && mouseX<=475 && mouseY>=560 && mouseY<=620) {
    state = 1;
    survive = 5;
  }
}
