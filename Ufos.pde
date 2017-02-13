class Ufos{
  float x1,y1,speed,direction1;
  float x2,y2,direction2;
  float x3,y3,direction3;
  float x4,y4,direction4;
  float x5,y5,direction5;
  int count;
  float time;
  float wait;
  PImage sprite;
  Ufos(){
    x1=random(width);
    y1=random(height-200);
    x2=random(width);
    y2=random(height-200);
    x3=random(width);
    y3=random(height-200);
    x4=random(width);
    y4=random(height-200);
    x5=random(width);
    y5=random(height-200);
    speed=2;
    direction1=random(-1,1);
    direction2=random(-1,1);
    direction3=random(-1,1);
    direction4=random(-1,1);
    direction5=random(-1,1);
    sprite=loadImage("ufo.png");
    lspeed=2;
    time=millis();
    wait=5000;
  }
  
  void drawufo(){
    if (ufo1==1){
    image(sprite,x1,y1,148,125);}
    if (ufo2==1){
    image(sprite,x2,y2,148,125);}
    if (ufo3==1){
    image(sprite,x3,y3,148,125);}
    if (ufo4==1){
    image(sprite,x4,y4,148,125);}
    if (ufo5==1){
    image(sprite,x5,y5,148,125);}
    moveufo();
  }
  

  void moveufo(){
    x1+=speed*cos(direction1);
    y1+=speed*sin(direction1);
    x2+=speed*cos(direction2);
    y2+=speed*sin(direction2);
    x3+=speed*cos(direction3);
    y3+=speed*sin(direction3);
    x4+=speed*cos(direction4);
    y4+=speed*sin(direction4);
    x5+=speed*cos(direction5);
    y5+=speed*sin(direction5);
    if (x1<0){
      x1=1000-148;}
    if (x1>1000-148){
      x1=0;}
    if (y1<0){
      y1=400;}
    if (y1>400){
    y1=0;}
    if (x2<0){
      x2=1000-148;}
    if (x2>1000-148){
      x2=0;}
    if (y2<0){
      y2=400;}
    if (y2>400){
    y2=0;}
     if (x3<0){
      x3=1000-148;}
    if (x3>1000-148){
      x3=0;}
    if (y3<0){
      y3=400;}
    if (y3>400){
    y3=0;}
     if (x4<0){
      x4=1000-148;}
    if (x4>1000-148){
      x4=0;}
    if (y4<0){
      y4=400;}
    if (y4>400){
    y4=0;}
     if (x5<0){
      x5=1000-148;}
    if (x5>1000-148){
      x5=0;}
    if (y5<0){
      y5=400;}
    if (y5>400){
    y5=0;}
    ufoc1x=x1+74;
    ufoc1y=y1+65;
    ufoc2x=x2+74;
    ufoc2y=y2+65;
    ufoc3x=x3+74;
    ufoc3y=y3+65;
    ufoc4x=x4+74;
    ufoc4y=y4+65;
    ufoc5x=x5+74;
    ufoc5y=y5+65;
  }
 void shootlaser(){
   if (millis()-time>=wait){
    lx1=x1+74;
    ly1=y1+125;
    lx2=x2+74;
    ly2=y2+125;
    lx3=x3+74;
    ly3=y3+125;
    lx4=x4+74;
    ly4=y4+125;
    lx5=x5+74;
    ly5=y5+125;
    l1=1;
    l2=1;
    l3=1;
    l4=1;
    l5=1;
    time=millis();}
    fill(#58F00F);
    if (l1==1 && ufo1==1){
    ellipse(lx1,ly1,20,20);}
    if (l2==1 && ufo2==1){
    ellipse(lx2,ly2,20,20);}
    if (l3==1 && ufo3==1){
    ellipse(lx3,ly3,20,20);}
    if (l4==1 && ufo4==1){
    ellipse(lx4,ly4,20,20);}
    if (l5==1 && ufo5==1){
    ellipse(lx5,ly5,20,20);}
   ly1+=lspeed;
   ly2+=lspeed;
   ly3+=lspeed;
   ly4+=lspeed;
   ly5+=lspeed;}
     
}