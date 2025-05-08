class Asteroid extends GameObject {

  float rotSpeed, angle;
  PShape rock;
  int sizeFactor = 75;


  Asteroid() {

    super(random(0, width), random(0, height), 1, 1);
    asteroidStuff();
    lives = 4;
    d = lives*sizeFactor;
    angle = 0;
    rotSpeed = random(-1, 1);
    build();
  }

  Asteroid(int lives) {
    super(random(0, width), random(0, height), 1, 1);
    asteroidStuff();
    d = lives*sizeFactor;
    this.lives = lives;
    angle = 0;
    rotSpeed = random(-2, 2);
    build();
  }

  void build() {
    PVector plot = new PVector(100, 0);
    rock = createShape();
    rock.beginShape();
    int i = 0;
    while (i < 50) {
      plot.rotate(radians(360/10));
      plot.setMag(d/2);
      rock.vertex(plot.x, plot.y);
      i++;
    }
    rock.endShape(CLOSE);
    
    rock.disableStyle();
  }

  void asteroidStuff() {
    vel.setMag(random(1, 1.5));
    vel.rotate(random(TWO_PI));
  }
  
  void randomGrey() {
    fill(random(150,220));
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(angle));
    stroke(245);
    fill(100);
    shape(rock, 0, 0);
    //ellipse(0,0,d,d);
    popMatrix();
  }


  void act() {
    angle = angle + rotSpeed;
    loc.add(vel);
    boundaries();
    checkForCollisions();
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

        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {

          
          if (lives == 4) {
            obj.lives -= 4;
            Asteroid asteroid1 = new Asteroid(lives - 1);
            Asteroid asteroid2 = new Asteroid(lives - 1);

            asteroid1.d = d * 0.65;
            asteroid2.d = d * 0.65;

            asteroid1.loc = new PVector(loc.x + random(-70, 50), loc.y + random(-70, 50));
            asteroid2.loc = new PVector(loc.x + random(-70, 50), loc.y + random(-70, 50));

            asteroid1.vel.setMag(random(1, 1.5));
            asteroid2.vel.setMag(random(1, 1.5));
            asteroid1.vel.rotate(random(TWO_PI));
            asteroid2.vel.rotate(random(TWO_PI));

            objects.add(asteroid1);
            objects.add(asteroid2);
          }
          else if (lives == 3) {
            obj.lives -= 4;
            Asteroid asteroid1 = new Asteroid(lives - 1);
            Asteroid asteroid2 = new Asteroid(lives - 1);
            Asteroid asteroid3 = new Asteroid(lives - 1);

            asteroid1.d = d * 0.65;
            asteroid2.d = d * 0.65;
            asteroid3.d = d * 0.65;

            asteroid1.loc = new PVector(loc.x + random(-100, 80), loc.y + random(-100, 80));
            asteroid2.loc = new PVector(loc.x + random(-100, 80), loc.y + random(-100, 80));
            asteroid3.loc = new PVector(loc.x + random(-100, 80), loc.y + random(-100, 80));

            asteroid1.vel.setMag(random(1, 2));
            asteroid2.vel.setMag(random(1, 2));
            asteroid3.vel.setMag(random(1, 2));
            asteroid1.vel.rotate(random(TWO_PI));
            asteroid2.vel.rotate(random(TWO_PI));
            asteroid3.vel.rotate(random(TWO_PI));

            objects.add(asteroid1);
            objects.add(asteroid2);
            objects.add(asteroid3);
          }
           else if (lives == 2) {
             obj.lives -= 4;
            Asteroid asteroid1 = new Asteroid(lives - 1);
            Asteroid asteroid2 = new Asteroid(lives - 1);
            Asteroid asteroid3 = new Asteroid(lives - 1);
            Asteroid asteroid4 = new Asteroid(lives - 1);

            asteroid1.d = d * 0.85;
            asteroid2.d = d * 0.85;
            asteroid3.d = d * 0.85;
            asteroid4.d = d * 0.85;

            asteroid1.loc = new PVector(loc.x + random(-70, 50), loc.y + random(-70, 50));
            asteroid2.loc = new PVector(loc.x + random(-70, 50), loc.y + random(-70, 50));
            asteroid3.loc = new PVector(loc.x + random(-70, 50), loc.y + random(-70, 50));
            asteroid4.loc = new PVector(loc.x + random(-70, 50), loc.y + random(-70, 50));

            asteroid1.vel.setMag(random(1, 2.5));
            asteroid2.vel.setMag(random(1, 2.5));
            asteroid3.vel.setMag(random(1, 2.5));
            asteroid4.vel.setMag(random(1, 2.5));
            asteroid1.vel.rotate(random(TWO_PI));
            asteroid2.vel.rotate(random(TWO_PI));
            asteroid3.vel.rotate(random(TWO_PI));
            asteroid4.vel.rotate(random(TWO_PI));

            objects.add(asteroid1);
            objects.add(asteroid2);
            objects.add(asteroid3);
            objects.add(asteroid4);
          }
          lives = 0;
        }
      }
      i++;
    }
  }
  
  void AsteroidSplitStuff() {
              Asteroid asteroid1 = new Asteroid(lives - 1);
            Asteroid asteroid2 = new Asteroid(lives - 1);

            asteroid1.d = d * 0.65;
            asteroid2.d = d * 0.65;

            asteroid1.loc = new PVector(loc.x + random(-70, 50), loc.y + random(-70, 50));
            asteroid2.loc = new PVector(loc.x + random(-70, 50), loc.y + random(-70, 50));

            asteroid1.vel.setMag(random(1, 1.5));
            asteroid2.vel.setMag(random(1, 1.5));
            asteroid1.vel.rotate(random(TWO_PI));
            asteroid2.vel.rotate(random(TWO_PI));
  }
}
