class Tank {
  float rot = 0;
  Bullet bullet;
  float cx,cy;
  
  Tank(int x, int y){
    locationX = x;
    locationY = y;
    cx = x;
    cy = y - 700;
  }
  
  void drawTank(){
    strokeWeight(1);
    fill(#989393);
    stroke(#000000);
    pushMatrix();
    rectMode(CENTER);
    translate(locationX,locationY-35);
    rotate(rot);
    rect(0,0,20,80);
    popMatrix();
    strokeWeight(10);
    tankPic.resize(130,0);
    image(tankPic,locationX - 65,locationY - 60);
    constrictTank();
  }
  
  void constrictTank(){
    locationX = constrain(locationX,25,width-25);
    locationY = constrain(locationY,575,576);
    rot = constrain(rot,-PI/4,PI/4);
  }


  void moveLEFT(){
    locationX -= 15;
    cx -= 15;
  }
  void moveRIGHT(){
    locationX += 15;
    cx += 15;
  }
  
  void rotLEFT(){
    rot -= PI/12;
    if(rot >= -PI/4 && rot <= PI/4){
      cx -= 690*tan(PI/12);
    }
  }
  void rotRIGHT(){
    rot += PI/12;
    if(rot >= -PI/4 && rot <= PI/4){
      cx += 690*tan(PI/12);
    }
  }
}