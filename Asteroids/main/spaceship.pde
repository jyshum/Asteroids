class Spaceship extends GameObject {
  
  //instance stuff
  PVector loc; //location
  PVector vel; //velocity
  PVector direction; //direction
  int cooldown;
  
  //constructr
  Spaceship() {
    super(width/2, height/2, 0, 0);
    direction = new PVector(0,1);
    loc = new PVector(width/2,height/2);
    vel = new PVector(0,0);
    cooldown = 0;
  }
  
   void shoot() {
     cooldown--;
    if (ekey && cooldown <= 0) {
      bullets.add(new Bullet());
      cooldown = 40;
    }
  }
  
  //behaviour func
  void show() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(direction.heading());
    drawShip();
    popMatrix();
  }
 
  
  void drawShip() {
    fill(board);
    //triangle
    triangle(-10,18,-10,-18,20,0);
    stroke(white);
    strokeWeight(2);
    ellipse(0,0,60,20);
  }
  
  void act() {
    move();
    shoot();
    checkForCollisions();
    boundaries();
  }
  
  void move() {
    loc.add(vel);
    if (wkey) vel.add(direction);
    float topSpeed = 6;
    vel.setMag( min(vel.mag(), topSpeed)  );
    if (skey) vel.setMag(vel.mag()*0.962);
    if (akey) direction.rotate(-radians(3));
    if (dkey) direction.rotate(radians(3));
    
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
  
  
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x,loc.y,  obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
  
  
}
