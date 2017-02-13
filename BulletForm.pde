class BulletForm extends Bullet {
  
  BulletForm(float _x, float _y, float _newx, float _newy){
    super(_x,_y,_newx,_newy);
  }
  
  void drawline(){
    stroke(#FFFFFF);
    strokeWeight(2);
    line(firex,firey,firex+(vvx*4),firey+(vvy*4));
  }
}