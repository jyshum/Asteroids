void game() {
    background(black);
    
    
    int i = 0;
    while (i < objects.size()) {
      GameObject currentObject = objects.get(i);
      currentObject.act();
      currentObject.show();
      if (currentObject.lives == 0) 
        objects.remove(i);
        else
      i++;
    }
    
    //pause button
    tactileR(10, 30, 10, 30);
    rect(10, 10, 20, 20);
    
    
}

void gameClicks() {

}

void tactileR(float xa, float xb, float ya, float yb) {
  if (mouseX > xa && mouseX < xb && mouseY > ya && mouseY < yb) {
    fill(black, 150);
  } else {
    fill(black, 50);
  }
}
