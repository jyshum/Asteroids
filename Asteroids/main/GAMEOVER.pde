boolean showText = true;
int blinkCounter = 0;

void gameover() {
  background(0);
  textAlign(CENTER, CENTER);
  
  textSize(64);
  fill(255, 0, 0);
  text("GAME OVER", width/2, height/2 - 100);

  textSize(32);
  fill(255);
  text("Your ship has been destroyed!", width/2, height/2 - 30);

  // Blinking using toggle
  blinkCounter++;
  if (blinkCounter > 30) {  // change every half second
    showText = !showText;   // flip true to false or false to true
    blinkCounter = 0;
  }

  if (showText) {
    textSize(24);
    fill(200);
    text("Click to try again", width/2, height/2 + 50);
  }
}



void gameOverClicks() {
    if (mouseX > 0 && mouseX < 1000 && mouseY > 0 && mouseY < 800) {
    
     resetGame();
     mode = TRANSITION;
     TRANSITIONMODE = INTRO;
     transitionCounter = 0;
    
  }

}
