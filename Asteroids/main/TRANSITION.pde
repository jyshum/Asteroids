void transition() {
  if (transitionCounter > 80) {
    mode = TRANSITIONMODE;
  } else {
    transitionCounter = transitionCounter + 1;
  }
  
  fill(0,10);
  rect(0,0,1000,800);
}
