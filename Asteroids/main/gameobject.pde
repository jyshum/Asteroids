class GameObject {

  PVector loc;
  PVector vel;
  int lives;
  float d;
  
  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 4;
  }
  
  GameObject(PVector l, PVector v) {
    loc = l;
    vel = v;
    lives = 4;
    
  }
  
  GameObject(PVector l, PVector v, int lv) {
    loc = l;
    vel = v;
    lives = lv;
  }
  
  GameObject(int lv) {
    lives = lv;
  }
  
  
  
  void act() {
  
  }
  
  void show() {
  
  }
  
}
