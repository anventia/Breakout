void gameover() {
  fill(bg, 30);
  rect(width/2,height/2, width,height);
  counter += 1;
  if (counter > 30) background(bg);
    // Win
  if (score == bricks) {
    fill(0);
    textSize(100);
    text("You Won!", width/2, 300);
    textSize(30);
    text("Lives Left: "+lives+"/5" , width/2, 360);
    text("Click anywhere to continue", width/2, 400);
  }
    // Lose
  if (lives == 0) {
    fill(0);
    textSize(100);
    text("You Lost!", width/2, 300);
    textSize(30);
    text("Bricks Broken: "+score+"/"+bricks, width/2, 360);
    text("Click anywhere to continue", width/2, 400);
  }
  
}

void gameoverClick() {
  mode = INTRO;
}    
