//sound
import ddf.minim.*;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
Minim bMusic;
Minim bullet;
Minim crash;
Boolean musicOn = true;
//volume toggle
PImage vOn;
PImage vOff;
PImage space1;
PImage space2;
PImage space3;
PImage space4;
PImage space5;
PImage space6;
PImage space7;
PImage space8;
PImage space9;
PImage space10;
String bgPick="";
float lx1,ly1, lx2, ly2, lx3, ly3, lx4, ly4, lx5, ly5, lspeed;
float ufoc1x,ufoc1y,ufoc2x,ufoc2y,ufoc3x,ufoc3y,ufoc4x,ufoc4y,ufoc5x,ufoc5y;
int locationX,locationY;
int ufo1,ufo2,ufo3,ufo4,ufo5;
int l1,l2,l3,l4,l5;
boolean gameOver = false;
boolean winner = false;
int[] starry = new int[20];
PImage star;
PImage spaceship;
PImage bg;
PImage tankPic;
Tank tank;
BulletForm bulletform1;
boolean needshot = false;
int scnt = 0;
int snum = 1000;
BulletForm[] shots = new BulletForm[snum];
boolean[] needshoot = new boolean[snum];
int phase = 0;
Ufos u1;
float x;
float y;
int lives;
int score;
int reset;
PFont font;

float y_star = 50.0;
float radius_star = 20.0;
float velocity_star = 4.5;

void setup(){
  size(1000,600);
  tank = new Tank(500,575);
  u1=new Ufos();
  font = loadFont("OCRAStd-48.vlw");
  space1=loadImage("space.jpg");
  space2 = loadImage("space2.jpg");
  space3 = loadImage("space3.jpg");
  space4 = loadImage("space4.jpg");
  space5 = loadImage("space5.jpg");
  space6 = loadImage("space6.jpg");
  space7 = loadImage("space7.jpg");
  space8 = loadImage("space8.jpg");
  space9 = loadImage("space9.jpg");
  space10 = loadImage("space10.jpg");
  tankPic = loadImage("tank.png");
  space1.resize(1300,0);
  space2.resize(1300,0);
  space3.resize(1300,0);
  space4.resize(1300,0);
  space5.resize(1300,0);
  space6.resize(1300,0);
  space7.resize(1300,0);
  space8.resize(1300,0);
  space9.resize(1300,0);
  space10.resize(1300,0);
  star = loadImage("star.png");
  spaceship = loadImage("Spaceship.png");
  font = loadFont("OCRAStd-48.vlw");
  
  //sound
  vOn = loadImage("vOn.png");
  vOff = loadImage("vOff.png");
  vOn.resize(30,0);
  vOff.resize(30,0);
  
  bMusic = new Minim(this);
  player = bMusic.loadFile("bMusic.wav");
  bullet = new Minim(this);
  player2 = bullet.loadFile("bullet.wav");
  crash = new Minim(this);
  player3 = crash.loadFile("crash.wav");
}

void titleScreen() {
  reset=1;
  background(0);
  fill(#5248F5);
  textAlign(CENTER);
  textFont(font);
  textSize(48);
  text("Space Invaders", width*0.50, height*0.40);
  textSize(32);
  if(winner){
    starDisplay();
    text("Congrats! You won! Score: ", width*0.50, height*0.40+50);
    textSize(65);
    text(score,width*.50,height*2/3);
    textSize(20);
    text("Press SPACE to play again or '1' to go to the Main screen", width*0.50, height*0.40+250);
  } else if(gameOver){
    textSize(20);
    text("You lost! Press SPACE to try again or '1' to go to the Main screen", width*0.50, height*0.40+50);  
  }
  else {
    starDisplay();
    text("To Infinity and Beyond", width*0.50, height*0.40+50);
    textSize(20);
    text("Press the SPACE bar to start game", width*0.50, height*0.80);
    image(spaceship,440,320,130,130);
    ellipse(650, 540, 100,100);
    ellipse(350,540,100,100);
    fill(#FEFF05);
    textSize(11);
    text("HELP", 651, 545);
    text("BACKGROUND", 351, 545);
  }
  noFill();
}

//displays falling stars
void starDisplay(){
for (int i = 40; i < 1000; i = i+40) {
      image(star,i, y_star, radius_star, radius_star);
      image(star,i, y_star+50, radius_star, radius_star);
      image(star,i, y_star+100, radius_star, radius_star);
      image(star,i, y_star+150, radius_star, radius_star);
      image(star,i, y_star+200, radius_star, radius_star);
      image(star,i, y_star+250, radius_star, radius_star);
      image(star,i, y_star+300, radius_star, radius_star);
      image(star,i, y_star+350, radius_star, radius_star);
      image(star,i, y_star+400, radius_star, radius_star);
      image(star,i, y_star+450, radius_star, radius_star);
      image(star,i, y_star+500, radius_star, radius_star);
    }
    y_star += velocity_star;
    if (y_star > height) {
      y_star = 0.0;
    }
}

//displays instruction page
void Instructions(){
  fill(#5248F5);
  background(0);
  text("Instructions",500,50);
  text("How to defend our galaxy:",200,100);
  text("Use the left and right arrow keys to move the tank across the screen",500,150);
  text("Use up arrow key to shoot lasers to attack the enemy",410,200);
  text("Use the 'A' and 'D' keys to rotate the tank ",367,250);
  text("Avoid the UFO's black and green discs ",335,300);
  textSize(25);
  text("GOOD LUCK ON YOUR QUEST TO DEFEND OUR GALAXY!!",500,400);
  ellipse(850,520,100,100);;
  textSize(15);
  fill(#FEFF05);
  text("BACK",851,520);
}

//displays Background picker page
void Background(){
  fill(#5248F5);
  background(0);
  ellipse(850,520,100,100);
  textSize(15);
  fill(#FEFF05);
  text("BACK",851,520);
  textSize(20);
  text("Please Choose a Background",500,50);
  image(space1,25,100,150,150);
  image(space2,225,100,150,150);
  image(space3,425,100,150,150);
  image(space4,625,100,150,150);
  image(space5,825,100,150,150);
  image(space6,25,300,150,150);
  image(space7,225,300,150,150);
  image(space8,425,300,150,150);
  image(space9,625,300,150,150);
  image(space10,825,300,150,150);
}

void checkCollisionUfo(){
      for(int i = 0; i < scnt; i++){
        if(dist(shots[i].firex,shots[i].firey,ufoc1x,ufoc1y) <= 30) {
          ufo1=0;}
        if(dist(shots[i].firex,shots[i].firey,ufoc2x,ufoc2y) <= 30) {
          ufo2=0;}
        if(dist(shots[i].firex,shots[i].firey,ufoc3x,ufoc3y) <= 30) {
          ufo3=0;}
        if(dist(shots[i].firex,shots[i].firey,ufoc4x,ufoc4y) <= 30) {
          ufo4=0;}
        if(dist(shots[i].firex,shots[i].firey,ufoc5x,ufoc5y) <= 30) {
          ufo5=0;}
      }
    }
void checkCollisionTank(){
  x=locationX;
  y=locationY;
  player3.play();
  if (dist(x,y,lx1,ly1)<60&&l1==1){
    player3.rewind();
    l1=0;
    lives=lives-1;}
  if (dist(x,y,lx2,ly2)<60&&l2==1){
    player3.rewind();
    l2=0;
    lives=lives-1;}
  if (dist(x,y,lx3,ly3)<60&&l3==1){
    player3.rewind();
    l3=0;
    lives=lives-1;}
  if (dist(x,y,lx4,ly4)<60&&l4==1){
    player3.rewind();
    l4=0;
    lives=lives-1;}
  if (dist(x,y,lx5,ly5)<60&&l5==1){
    player3.rewind();
    l5=0;
    lives=lives-1;}}

void playGame(){
  if (reset==1){
    reset=0;
    ufo1=1;
    ufo2=1;
    ufo3=1;
    ufo4=1;
    ufo5=1;
   lives=3;
   score=2000;
   winner=false;
   gameOver=false;}
   image(bg,0,0);
   if(scnt > snum){
      for(int i = 0; i < 100; i++){
        rect(0,60,200-(scnt-snum)*2,10);
      }
    }
    //for blast
    if(scnt < snum){
      if(needshot){
        shots[scnt] = new BulletForm(locationX,locationY-30,tank.cx,tank.cy);
        needshoot[scnt] = true;
        needshot = false;
        scnt += 1;
        player2.rewind();
        player2.play();
      }
    }
    else{
      scnt += 1;
      if(scnt > snum + 100){
        scnt = 0;
      }
    }
    
    for(int i = 0; i < snum; i++){
      if(needshoot[i]){
        shots[i].shoot();
        shots[i].drawline();
        if(dist(shots[i].firex,shots[i].firey,shots[i].newx,shots[i].newy) <= 15) {
          needshoot[i] = false;
        }
      }
    }
    
    //draw tank
    tank.drawTank();
    //draw and move Ufos
    u1.drawufo();
    u1.moveufo();
    u1.shootlaser();
    checkCollisionUfo();
    checkCollisionTank();
    if (lives==0){
      gameOver=true;
      phase=0;}
    if (ufo1==0&&ufo2==0&&ufo3==0&&ufo4==0&&ufo5==0){
      winner=true;
      phase=0;}
    score=score-1;
    textSize(48);
    text("Score:",100,50);
    text(score,258, 50);
    text("Lives:",865,50);
    text(lives,975,50);
    if (score==0){
      gameOver=true;
      phase=0;}

}
void mousePressed(){
  //music
  if (mouseX > 930 && mouseX < 990 && mouseY > 510 && mouseY < 560) {
    if (musicOn) {
      musicOn = false;
    }
    else {
      musicOn = true;
    }
  }
}


void keyPressed(){
  if (keyCode == LEFT){
    tank.moveLEFT();
  }
  else if (keyCode == RIGHT){
    tank.moveRIGHT();
  }
  if(keyCode == 65){
    tank.rotLEFT();
    
  }
  else if (keyCode == 68){
    tank.rotRIGHT();
  }
  if(keyCode == UP){
    needshot = true;
    //player2.play();
  }
}

//GUI buttons
boolean instructionPressed(){
  return (mousePressed == true && mouseX >= 600 && mouseX <= 700 && mouseY <= 590 && mouseY >= 490); 
}
boolean backgroundPressed(){
  return (mousePressed == true && mouseX >= 300 && mouseX <= 400 && mouseY <= 590 && mouseY >= 490); 
}
boolean backPressed(){
  return (mousePressed == true && mouseX >= 800 && mouseX <= 900 && mouseY <= 570 && mouseY >= 470); 
}
boolean background1(){
  return (mousePressed == true && mouseX >= 25 && mouseX <= 175 && mouseY <= 250 && mouseY >= 100); 
}
boolean background2(){
  return (mousePressed == true && mouseX >= 225 && mouseX <= 375 && mouseY <= 250 && mouseY >= 100); 
}
boolean background3(){
  return (mousePressed == true && mouseX >= 425 && mouseX <= 575 && mouseY <= 250 && mouseY >= 100); 
}
boolean background4(){
  return (mousePressed == true && mouseX >= 625 && mouseX <= 775 && mouseY <= 250 && mouseY >= 100); 
}
boolean background5(){
  return (mousePressed == true && mouseX >= 825 && mouseX <= 975 && mouseY <= 250 && mouseY >= 100); 
}
boolean background6(){
  return (mousePressed == true && mouseX >= 25 && mouseX <= 175 && mouseY <= 450 && mouseY >= 300); 
}
boolean background7(){
  return (mousePressed == true && mouseX >= 225 && mouseX <= 375 && mouseY <= 450 && mouseY >= 300); 
}
boolean background8(){
  return (mousePressed == true && mouseX >= 425 && mouseX <= 575 && mouseY <= 450 && mouseY >= 300); 
}
boolean background9(){
  return (mousePressed == true && mouseX >= 625 && mouseX <= 775 && mouseY <= 450 && mouseY >= 300); 
}
boolean background10(){
  return (mousePressed == true && mouseX >= 825 && mouseX <= 975 && mouseY <= 450 && mouseY >= 300); 
}
void draw(){
  if(phase == 0) {
    titleScreen();
    if(key == ' ' && bgPick=="") {
      bgPick = "space.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
      phase = 1;
    }
    else if (key ==' ' && bgPick!="")
    {
    phase = 1;
    }
    if (instructionPressed()){
      phase = 2;
    }
    if (backgroundPressed()){
      phase = 3;
    }
    if(key == '1'){
      winner = false;
      gameOver = false;
    }
  }
  if(phase == 1){
    playGame();
  }
  if (phase == 2){
    Instructions();
    if(backPressed()){
      phase = 0;
    }
  }
  if (phase == 3){
    Background();
    if(background1()){
      bgPick = "space.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background2()){
      bgPick = "space2.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background3()){
      bgPick = "space3.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background4()){
      bgPick = "space4.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background5()){
      bgPick = "space5.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background6()){
      bgPick = "space6.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background7()){
      bgPick = "space7.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background8()){
      bgPick = "space8.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background9()){
      bgPick = "space9.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if(background10()){
      bgPick = "space10.jpg";
      bg = loadImage(bgPick);
      bg.resize(1300,0);
    }
    if (bgPick == "space.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(25, 100, 150, 150);
      }
    if (bgPick == "space2.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(225, 100, 150, 150);
      }
    if (bgPick == "space3.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(425, 100, 150, 150);
      }
    if (bgPick == "space4.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(625, 100, 150, 150);
      }
    if (bgPick == "space5.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(825, 100, 150, 150);
      }
    if (bgPick == "space6.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(25, 300, 150, 150);
      }
    if (bgPick == "space7.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(225, 300, 150, 150);
      }
    if (bgPick == "space8.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(425, 300, 150, 150);
      }
    if (bgPick == "space9.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(625, 300, 150, 150);
      }
    if (bgPick == "space10.jpg")
      {
      noFill();
      stroke(246,255,3);
      strokeWeight(4);
      rect(825, 300, 150, 150);
      }
    if(backPressed()){
      phase = 0;
    }
    noStroke();
  }
  
  //background music
  if (musicOn) {
    image(vOn, 960,530);
    if (player.isPlaying() == false) {
      player.rewind();
      player.play();
    }  
  } 
  else {
    image(vOff, 960,530);
    player.pause();
  }
  
}