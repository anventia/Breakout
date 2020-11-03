// Modes
int mode;
final int INTRO    = 0;
final int GAME     = 1;
final int OPTIONS  = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;

// Fonts
PFont MontserratMedium;

// Colors
color bg = 255;
color bg2 = #D3CBFF;
color ball = 0;
color paddle = #5000AD;

color purple = #9D2EFF;  // Purple
color blue = #5259FF;  // Blue
color lightblue = #52B0FF;  // Light Blue
color green = #2EFF79;  // Green

// Bricks
int bricks;
float brickD;
int rowNumber = 0;
int[] brickColor;
float[] brickX;
float[] brickY;
float topRow;
float bottomRow;
int brickRow;
int numRows;

// Ball
float ballD, ballSX, ballSY;
float ballX, ballY;

// Paddle
int paddleD, paddleS;
int paddleX, paddleY;

// Keys
boolean keyA = false;
boolean keyD = false;

// Screen
final int sWidth = 1280;
final int sHeight = 720;

// Other
int score;
int lives;
int counter;
int sliderX = sWidth/2-300;
boolean sliderDown = false;



void setup() {
  size(1280, 720);
  
  mode = INTRO;
  MontserratMedium = createFont("Montserrat-Medium.ttf", 100);
  textFont(MontserratMedium);
  rectMode(CENTER);
  textAlign(CENTER);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == OPTIONS) {
    options();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  }
}
