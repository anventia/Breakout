void gameSetup() {
  bricks = 40*8-4;
  brickD = 25;
  rowNumber = 0;
  brickColor = new int[bricks];
  brickX = new float[bricks];
  brickY = new float[bricks];

  // Creating brick coordinates
  int i = 0;
  int row = 40; // Number of bricks in a row
  boolean rowIndent = false;
  float tempX = 100;
  float tempY = 100;
  float spacing = (width-200)/(row-1);
  while (i < bricks) {
    brickX[i] = tempX;
    brickY[i] = tempY;
    tempX += spacing;
    if (rowIndent == false) {
      if (tempX > width-100) {
        tempX = 100+spacing/2;
        tempY += sqrt(pow((spacing)/2,2)*3);
        rowIndent = true;
      }
    } else {
      if (tempX > width-100-(spacing)/2) {
        tempX = 100;
        tempY += sqrt(pow((spacing)/2,2)*3);
        rowIndent = false;
      }
    }
    i += 1;
  }
  topRow = 100;
  bottomRow = brickY[bricks-1];
    
  ballD = 20;
  ballSX = 5;
  ballSY = 5;
  ballX = width/2;
  ballY = height-100;
  
  paddleD = 100;
  paddleX = width/2;
  paddleY = sHeight;
  paddleS = 10;
}

void game() {
  //background(bg);
  fill(bg, 10);
  stroke(bg);
  strokeWeight(1);
  rect(width/2,height/2, width,height);
  fill(bg);
  rect(width/2,720-paddleD/4, width,paddleD/2);
  
  
  //fill(255);
  //rect(width/2,brickY[bricks-1], width,5);
  //rect(width/2,100+((brickY[bricks-1]-brickY[0])/4)*1, width,5);
  //rect(width/2,100+((brickY[bricks-1]-brickY[0])/4)*2, width,5);
  
  // Bricks //
  strokeWeight(1);
  int i = 0;
  fill(purple);
  while (i < bricks) {
    if (brickY[i] > 100+((bottomRow-topRow)/4)*1) {
      fill(blue);
    }
    if (brickY[i] > 100+((bottomRow-topRow)/4)*2) {
      fill(lightblue);
    }
    if (brickY[i] > 100+((bottomRow-topRow)/4)*3) {
      fill(green);
    }
    
    ///////
    circle(brickX[i],brickY[i], brickD);
    i += 1;
  }
  
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
  if (ballX < ballD/2 || ballX > width-ballD/2) ballSX *= -1;
  if (ballY < ballD/2) ballSY *= -1;
  if (ballY > height-ballD/2) ballSY *= -1; // Replace this with losing a point later
    // Paddle Collisions
  if (dist(ballX,ballY, paddleX,paddleY) < paddleD/2+ballD/2) {
    ballSX = (ballX-paddleX)/6;
    ballSY = (ballY-paddleY)/6;
  }
    // Brick Collisions
  i = 0;
  while (i < bricks) {
    if (dist(ballX,ballY, brickX[i],brickY[i]) < ballD/2+brickD/2) {
      ballSX = (ballX-brickX[i])/3.5;  // Bounce ball
      ballSY = (ballY-brickY[i])/3.5;  //
      
      brickX[i] = -100;  // Remove brick off screen
      brickY[i] = -100;  //
      points += 1;  // Increase points
    }
    i += 1;
  }
}

void gameClick() {
  
}

void colorBricks(int i) {
  if (brickY[i] < brickY[bricks-1]/4) {
    fill(purple);
  }
  if (brickY[i] < (brickY[bricks-1]/4)*2) {
    fill(blue);
  } 
}
