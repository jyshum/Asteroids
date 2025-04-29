import java.util.ArrayList;

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
color silver = #D9EFFC;
color board = #CCDDE8;

//font and image variables
PFont DeepwokenFont;
PImage SilverSurfer;

//objects
Spaceship player1;

//List of bullets
ArrayList<GameObject> objects;
ArrayList<GameObject> bullets;


//keyboard variables
boolean wkey, skey, akey, dkey, ekey, upkey, downkey, leftkey, rightkey, ctrlkey;

//star
Star[] myStars;
int numstars;
float starCounter;
BackStar[] myBackStars;
int numBackStars;
float BackStarCounter;

void setup() {

  size(1000, 800);

  //text Stuff
  textAlign(CENTER, CENTER);
  DeepwokenFont = createFont("Fondamento-Regular.ttf", 1);
  //image stuff
  imageMode(CENTER);
  SilverSurfer = loadImage("silverone.png");
  //player stuff
  objects = new ArrayList();
  player1 = new Spaceship();
  objects.add(player1);
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  objects.add(new Asteroid());
  bullets = new ArrayList();
  
  mode = INTRO;
  
  numstars = 100;
  myStars = new Star[numstars];
  starCounter = 0;

  int i = 0;
  while (i < numstars) {
    myStars[i] = new Star();
    i = i + 1;
  }
}

void draw() {

  //mode = INTRO;

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
