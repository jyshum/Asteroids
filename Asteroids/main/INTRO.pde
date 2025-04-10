void intro() {
  background(black); //set background to black
    
          int i = 0;
  while (i < numstars) {
    myStars[i].show();
    myStars[i].act();
    i = i + 1;
  }
  
  textFont(DeepwokenFont);
  textSize(60);
  fill(white);
  text("asteroids", width/2, height/2-150);
  
  tactileC(width/2,height/2+120, 80); 
  image(SilverSurfer, width/2, height/2+100);
  
}

void tactileC(float xa, float xb, float d) {

  if (dist(xa,xb, mouseX, mouseY) < d/2) {
    fill(white, 20);
    circle(xa, xb, d+25);
    fill(white, 30);
    circle(xa,xb,d+20);
    fill(white, 50);
    circle(xa,xb,d+10);
    fill(silver, 100);
  } else {
    fill(white,30);
    circle(xa,xb,d+10);
    fill(white, 40);
  }
  circle(xa,xb,d); 

}

void introClicks() {
 
  
  if (dist(500,520, mouseX,mouseY) < 40) {
      mode = TRANSITION;
     TRANSITIONMODE = GAME;
     transitionCounter = 0;
  }

}
