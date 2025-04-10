class Asteroid extends GameObject {

  Asteroid() {
    super(random(0,width), random(0,height), 1, 1);
    vel.setMag(random(1,3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
  }
  
  void show() {
    fill(black);
    stroke(white);
    strokeWeight(3);
    circle(loc.x, loc.y, d);
    line(loc.x,loc.y, loc.x+d/2, loc.y);
  }
  
  void act() {
    loc.add(vel);
    boundaries();
  }
  
   void boundaries() {
    if (loc.y > height+100) {
      loc.y = -50;
    }
    if (loc.y < -100) {
      loc.y = height+50;
    }
    if (loc.x > width+100) {
      loc.x = -50;    
    }
    if (loc.x < -100) {
      loc.x = width+50;
    }
  }
  
  
  
}
