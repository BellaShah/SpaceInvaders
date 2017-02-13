class Bullet {
  float firestep = .03;
  float firex,firey;
  float newx,newy,vvx,vvy;
  
  Bullet(float _x, float _y, float _newx, float _newy){
    firex = _x;
    firey = _y;
    newx = _newx;
    newy = _newy;
  }
  
  void shoot(){
    vvx = (newx - firex) * firestep;
    vvy = (newy - firey) * firestep;
    firex += vvx;
    firey += vvy;
  }
}