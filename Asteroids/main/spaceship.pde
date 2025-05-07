class Spaceship extends GameObject {

  // Instance variables
  PVector loc;        // Location
  PVector vel;        // Velocity
  PVector direction;  // Ship's facing direction
  int cooldown;       // Shooting cooldown
  int invTimer = 240; // Invincibility time (4 seconds)
  float shieldPulse = 0; // For forcefield animation


  Spaceship() {
    super(width / 2, height / 2, 0, 4);
    direction = new PVector(0, 1);
    loc = new PVector(width / 2, height / 2);
    vel = new PVector(0, 0);
    cooldown = 0;
  }

  void act() {
    move();
    shoot();
    checkForCollisions();
    boundaries();
    checkForDeath();

    if (invTimer > 0) {
      invTimer--;
    }
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

  void shoot() {
    cooldown--;
    if (ekey && cooldown <= 0 && invTimer <= 0) {
      objects.add(new Bullet());
      cooldown = 40;
    }
  }

  float pulseSize = 90;
  boolean pulseGrowing = true;

  void show() {
    if (lives > 0) {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(direction.heading());

    // Draw animated forcefield if active
    if (invTimer > 0) {
      stroke(blue, 150);  // Light blue forcefield
      strokeWeight(2);
      fill(board, 100);
      ellipse(0, 0, pulseSize, pulseSize);

      // Simple grow-shrink pulse logic
      if (pulseGrowing) {
        pulseSize += 0.5;
        if (pulseSize >= 100) pulseGrowing = false;
      } else {
        pulseSize -= 0.5;
        if (pulseSize <= 80) pulseGrowing = true;
      }
    }

    drawShip();  // Draw the spaceship
    popMatrix();
    }
  }

  void drawShip() {
    // Body
    fill(board);
    stroke(blue);
    strokeWeight(2);
    triangle(-12, 18, -12, -18, 22, 0);  // Sleek pointed triangle

    // Wings
    fill(blue);
    stroke(white);
    triangle(-12, 10, -25, 20, -12, 0);  // Left wing
    triangle(-12, -10, -25, -20, -12, 0);  // Right wing

    // Engine flare (optional)
    if (wkey) {
      noStroke();
      fill(orange, 120);
      triangle(-17, -8, -17, 8, -55, 0);
      fill(blueFlame);
      triangle(-17, -5, -17, 5, -50, 0);  // Flame coming out of back
    }
  }

  void boundaries() {
    if (loc.y > height + 100) loc.y = -50;
    if (loc.y < -100) loc.y = height + 50;
    if (loc.x > width + 100) loc.x = -50;
    if (loc.x < -100) loc.x = width + 50;
  }

  void checkForCollisions() {
    for (int i = 0; i < objects.size(); i++) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d / 2 + obj.d / 2) {
          if (invTimer <= 0) {
            if (obj.lives == 4) {
              lives = lives - 4;
            }
            if (obj.lives == 3) {
              lives = lives - 3;
            }
            if (obj.lives == 2) {
              lives = lives - 2;
            }
            if (obj.lives == 1) {
              lives = lives - 1;
            }
            obj.lives = 0;
          }
        }
      }
    }
  }

  int deathTimerDelay;
  boolean dead = false;

  void checkForDeath() {
    if (lives == 0) {
      dead = true;
      println(dead);
      deathTimerDelay = 60;
      println(deathTimerDelay);
    }
    if (dead) {
      deathTimerDelay -= 1;
      println(deathTimerDelay);
      
      if (deathTimerDelay <= 0) {
        mode = TRANSITION;
        TRANSITIONMODE = GAMEOVER;
        transitionCounter = 0;
      }
    }
  }
}
