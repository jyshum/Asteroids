class Asteroid extends GameObject {

  float rotSpeed, angle;
  PShape rock;
  int sizeFactor = 65;


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
  }

  void asteroidStuff() {
    vel.setMag(random(0.75, 1.25));
    vel.rotate(random(TWO_PI));
  }


  void show() {
    pushMatrix();
    rock.setFill(black);
    fill(black);
    stroke(white);
    rock.setStroke(white);
    translate(loc.x, loc.y);
    rotate(radians(angle));
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
      println(objects.size());
      if (obj instanceof Bullet) {

        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {

          obj.lives = 0;
          if (lives > 1) {
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
          lives = 0;
        }
      }
      i++;
    }
  }
}
