class Spaceship extends GameObject {

  // Instance variables
  PVector loc;         // Location
  PVector vel;         // Velocity
  PVector direction;   // Direction the ship is facing
  int cooldown;
  int invTimer = 0;    // Invincibility timer

  // Constructor
  Spaceship() {
    super(width/2, height/2, 0, 4);
    direction = new PVector(0, 1);
    loc = new PVector(width / 2, height / 2);
    vel = new PVector(0, 0);
    cooldown = 0;
    invTimer = 120;  // 2 seconds of invincibility (60 FPS)
  }

  void shoot() {
    cooldown--;
    if (ekey && cooldown <= 0) {
      objects.add(new Bullet());
      cooldown = 40;
    }
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(direction.heading());
    drawShip();
    popMatrix();
  }

void drawShip() {
  // Draw the forcefield if invincible
  if (invTimer > 0) {
    fill(board, 100);
    stroke(0, 200, 255, 150); // Light blue, semi-transparent
    strokeWeight(4);
    ellipse(0, 0, 80, 80); // Bigger than the ship
  }

  // Draw the actual ship
  fill(board);
  noStroke();
  triangle(-10, 18, -10, -18, 20, 0);
  stroke(white);
  strokeWeight(2);
  ellipse(0, 0, 60, 20);
}


  void act() {
    invincibleTimer();  // Update invincibility timer
    move();
    shoot();
    checkForCollisions();
    boundaries();
    checkForDeath();
  }

  void move() {
    loc.add(vel);
    if (wkey) vel.add(direction);
    float topSpeed = 5;
    vel.setMag(min(vel.mag(), topSpeed));
    if (skey) vel.setMag(vel.mag() * 0.962);
    if (akey) direction.rotate(-radians(3));
    if (dkey) direction.rotate(radians(3));
  }

  void boundaries() {
    if (loc.y > height + 100) loc.y = -50;
    if (loc.y < -100) loc.y = height + 50;
    if (loc.x > width + 100) loc.x = -50;
    if (loc.x < -100) loc.x = width + 50;
  }

  void checkForCollisions() {
    if (invTimer > 0) return; // Skip collisions while invincible

    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d / 2 + obj.d / 2) {
          lives = lives - 1;
          obj.lives = 0;
        }
      }
    }
  }

  void checkForDeath() {
    if (lives == 0) {
      mode = TRANSITION;
      TRANSITIONMODE = GAMEOVER;
      transitionCounter = 0;
    }
  }

  void invincibleTimer() {
    if (invTimer > 0) {
      invTimer--;
    }
  }
}
