class Bullet extends GameObject{
    
    int timer;
    float bulletColor = 255;
  
    Bullet() {
      super(player1.loc.copy(), player1.direction.copy());
      vel.setMag(7);
      timer = 80;
      d = 8;
    } 
    
    void show() {
      fill(white, bulletColor);
      stroke(white);
      strokeWeight(2);
      circle(loc.x, loc.y, d);
    }
    
    
    
    void act() {
      loc.add(vel);
      timer --;
      bulletColor =- 3;
      if (timer == 0) lives = 0;
    }
   
  
}
