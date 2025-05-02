class Bullet extends GameObject {

  int timer;
  float bulletColor = 255;

  Bullet() {
    super(player1.loc.copy(), player1.direction.copy());
    vel.setMag(8);
    timer = 80;
    d = 8;
  }

  void show() {
    noStroke();

    // Outer glow
    fill(blue, 60);
    ellipse(loc.x, loc.y, d * 3, d * 3);

    // Core bullet
    fill(blue);
    ellipse(loc.x, loc.y, d, d);
  }



  void act() {
    loc.add(vel);
    timer --;
    bulletColor =- 3;
    if (timer == 0) lives = 0;
  }
}
