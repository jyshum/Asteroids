class Star {

  //instance variables or fields
  float x, y, vx, vy, size, transp1, transp2;

  Star() {
    x = random(0, width);
    y = random(0, height);
    vx = random(5,8);
    vy = random(10, 15);
    transp2 = random(0,255);
    size = random(4,7);;
  }

  void show() {
    noStroke();
    fill(255, transp2);
    circle(x, y, size);
  }

  void act() {
    starCounter = starCounter + 1;
    if (starCounter > 120) {
     transp2 = random(0,255);
     size = random(4,7);
    starCounter = 0;
    }
    println(starCounter);
    //x = x + vx;
    //y = y + vy;
    //if (y > height+size) {
    //  y = -size;
    //}
    //if (x > width+size) {
    //x = -size;
    //}
  }
}
