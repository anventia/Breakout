
int mode;
final int INTRO    = 0;
final int GAME     = 1;
final int PAUSE    = 2;
final int GAMEOVER = 3;

// Colors
color bg = 10;
color ball = #52CAFF;
color paddle = #5000AD;

color purple = #9D2EFF;  // Purple
color blue = #5259FF;  // Blue
color lightblue = #52B0FF;  // Light Blue
color green = #2EFF79;  // Green


// Bricks
int bricks;
int brickD;
int rowNumber = 0;
int[] brickColor;
float[] brickX;
float[] brickY;
float topRow;
float bottomRow;

// Ball
float ballD, ballSX, ballSY;
float ballX, ballY;

// Paddle
int paddleD, paddleS;
int paddleX, paddleY;

// Keys
boolean keyA = false;
boolean keyD = false;

// Other
int points = 0;

// Screen
final int sWidth = 1280;
final int sHeight = 720;

void setup() {
  size(1280, 720);
  gameSetup();
  mode = GAME;
  
  rectMode(CENTER);
  textAlign(CENTER);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  }
}
