//mode variables
int mode;
final int INTRO = 0;
final int GAMEMODE = 1;
final int GAMEWIN = 2;
final int GAME = 3;
final int GAMEOVER = 4;
final int PAUSE = 5;
final int TRANSITION = 6;
int TRANSITIONMODE;
int transitionCounter;

//color pallette
color black = #000000;
color white = #FFFFFF;

//font and image variables
PFont DeepwokenFont;
PImage SilverSurfer; 

void setup() {

  size(1000,800);
  
  //text Stuff
  textAlign(CENTER, CENTER);
  DeepwokenFont = createFont("Fondamento-Regular.ttf",1); 
  
  //image stuff
  imageMode(CENTER);
  SilverSurfer = loadImage("silverone.png");
  
}

void draw() {
  
    mode = INTRO;
  
    if (mode == INTRO) {
    intro();
  } else if (mode == GAMEMODE) {
    gamemode();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEWIN) {
    gamewin();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == TRANSITION) {
    transition();
  } else {
    println("Error: Mode = " + mode);
  }
}
