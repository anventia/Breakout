void gameSetup() {    
  ballD = 20;
  ballSX = 0;
  ballSY = 1;
  ballX = width/2;
  ballY = height-100;
  
  paddleD = 100;
  paddleX = width/2;
  paddleY = sHeight;
  paddleS = 15;
}

void gameSetScore() {
  score = 0;
  lives = 5;
}

void game() {
  introTheme.pause();
  //background(bg);
  fill(bg, 30);
  stroke(bg);
  strokeWeight(1);
  rect(width/2,height/2, width,height);
  fill(bg);
  //rect(width/2,720-paddleD/4, width,paddleD/2);
  
  // Pause //
  textSize(25);
  fill(0);
  textAlign(LEFT);
  text("Click anywhere to pause.",10, height-10);
  textAlign(CENTER);
  
  // Score //
  textSize(100);
  fill(0);
  text(score, width/2, height-100);
  
  // Lives //
  textSize(50);
  textAlign(RIGHT);
  text("Lives: "+lives, width-10, height-10);
  textAlign(CENTER);
  
  //fill(255);
  //rect(width/2,brickY[bricks-1], width,5);
  //rect(width/2,100+((brickY[bricks-1]-brickY[0])/4)*1, width,5);
  //rect(width/2,100+((brickY[bricks-1]-brickY[0])/4)*2, width,5);
  
  // Bricks //
  drawBricks();
  
  // Paddle //
  fill(paddle);
  stroke(paddle);
  strokeWeight(1);
  circle(paddleX,paddleY, paddleD);
    // Movement 
  if (keyA == true) paddleX -= paddleS;
  if (keyD == true) paddleX += paddleS;
    // X Limits
  if (paddleX < 0) paddleX = 0;
  if (paddleX > width) paddleX = width;
  
  // Ball //
  fill(ball);
  stroke(ball);
  strokeWeight(1);
  circle(ballX,ballY, ballD);
    // Movement
  ballX += ballSX;
  ballY += ballSY;
    // Wall Collisions
  if (ballX < ballD/2 || ballX > width-ballD/2) {
    wallB.play();
    ballSX *= -1;
    wallB.rewind();
  }
  if (ballY < ballD/2) {
    wallB.play();
    ballSY *= -1;
    wallB.rewind();
  }
  if (ballY > height-ballD/2) {
    gameSetup();
    lives -= 1;
  }
  if (ballX < ballD/2) ballX = ballD/2;  // Prevents ball from glitching off the screen
  if (ballX > width-ballD/2) ballX = width-ballD/2;  // ^
    // Paddle Collisions
  if (dist(ballX,ballY, paddleX,paddleY) < paddleD/2+ballD/2) {
    paddleB.play();
    ballSX = (ballX-paddleX)/8;
    ballSY = (ballY-paddleY)/8;
    paddleB.rewind();
  }
    // Brick Collisions
  int i = 0;
  while (i < bricks) {
    if (dist(ballX,ballY, brickX[i],brickY[i]) < ballD/2+brickD/2) {
      brickB.play();
      ballSX = (ballX-brickX[i])/map(ballD, 1,100, 1,16);  // Bounce ball
      ballSY = (ballY-brickY[i])/map(ballD, 1,100, 1,16);  //
      brickB.rewind();
      brickX[i] = -100;  // Remove brick off screen
      brickY[i] = -100;  //
      score += 1;  // Increase points
    }
    i += 1;
  }
  
  // Scoring //
    // Win
  if (score == bricks || lives == 0) {
    counter = 0;
    mode = GAMEOVER;
  }
}

void initializeBricks() {
  brickRow = int((sWidth-200)/(brickD))-4;     // Number of bricks in a row
  numRows = int(map(brickD, 25,80, 12,4));     // Number of rows
  bricks = int(brickRow*numRows-(numRows/2));  // Number of bricks
  rowNumber = 0;
  brickColor = new int[bricks];
  brickX = new float[bricks];
  brickY = new float[bricks];

  int i = 0;
  boolean rowIndent = false;
  float tempX = 100.0;
  float tempY = 100;
  float spacing = (1080.0)/(brickRow-1.0);  // Spacing between the bricks
  
  while (i < bricks) {
    brickX[i] = tempX;
    brickY[i] = tempY;
    tempX += spacing;
    if (rowIndent == false) {
      if (int(tempX) > width-100) {
        tempX = 100.0+spacing/2;
        tempY += sqrt(pow((spacing)/2,2)*3);
        rowIndent = true;
      }
    } else {
      if (int(tempX) > width-100-(spacing)/2) {
        tempX = 100.0;
        tempY += sqrt(pow((spacing)/2,2)*3);
        rowIndent = false;
      }
    }
    i += 1;
  }
  topRow = 100;
  bottomRow = brickY[bricks-1];
}

void drawBricks() {
  strokeWeight(1);
  int i = 0;
  fill(purple);
  stroke(purple);
    // Color the brick
  while (i < bricks) {
    if (brickY[i] > 100+((bottomRow-topRow)/4)*1) {
      fill(blue);
      stroke(blue);
    }
    if (brickY[i] > 100+((bottomRow-topRow)/4)*2) {
      fill(lightblue);
      stroke(lightblue);
    }
    if (brickY[i] > 100+((bottomRow-topRow)/4)*3) {
      fill(green);
      stroke(green);
    }
      // Draw the brick
    circle(brickX[i],brickY[i], brickD);
    i += 1;
  }
}

void gameClick() {
  mode = PAUSE;
}
