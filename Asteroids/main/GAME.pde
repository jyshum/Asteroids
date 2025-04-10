void game() {
    background(black);
    
    int i2 = 0;
    while (i2 < bullets.size()) {
      GameObject currentObject = bullets.get(i2);
      currentObject.act();
      currentObject.show();
      if (currentObject.lives == 0) 
        bullets.remove(i2);
        else
      i2++;
    }
    
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
    
}

void gameClicks() {

}
