class Bullet extends GameObject{
    
    int timer;
  
    Bullet() {
      super(player1.loc.copy(), player1.direction.copy());
      vel.setMag(15);
      timer = 60;
      d = 5;
    } 
    
    void show() {
      fill(white);
      stroke(white);
      strokeWeight(2);
      circle(loc.x, loc.y, d);
    }
    
    
    
    void act() {
      loc.add(vel);
      timer --;
      if (timer == 0) lives = 0;
    }
   
  
}
