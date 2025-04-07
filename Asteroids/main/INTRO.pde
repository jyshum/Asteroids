void intro() {
  background(black); //set background to black
  
  textFont(DeepwokenFont);
  textSize(60);
  fill(white);
  text("asteroids", width/2, height/2-150);
  
  
  tactileC(width/2,height/2+120, 80); 
  image(SilverSurfer, width/2, height/2+100);
  
}

void tactileC(float xa, float xb, float d) {

  if (dist(xa,xb, mouseX, mouseY) < d/2) {
    fill(white, 300);
  } else {
    fill(white, 20);
  }
  circle(xa,xb,d); 

}

void introClicks() {
  
  if (dist(500,520, mouseX,mouseY) < 40) {
     mode = GAME;  
  }

}
