void options() {
  // fade in //
  fill(bg2, 30);
  rect(width/2,height/2, width,height);
  counter += 1;
  if (counter > 30) background(bg2);
  
  fill(0);
  textSize(80);
  text("Set Brick Size", width/2, height-30);
  
  // Slider //
  stroke(0);
  strokeWeight(5);
  line(width/2-300,height-140, width/2+300,height-140);
  fill(bg);
  circle(sliderX,height-140, 30);
  if (sliderDown == true) sliderX = mouseX;
  if (sliderX < width/2-300) sliderX = width/2-300;
  if (sliderX > width/2+300) sliderX = width/2+300;
  
  // Brick preview //
  brickD = map(sliderX, width/2-300,width/2+300, 25,80);
  initializeBricks();
  drawBricks();
  
  // Next //
  
  fill(250);
  stroke(230);
  strokeWeight(5);
  tactileRect(width-70,height-70, 100,100, 5);
  fill(0);
  stroke(0);
  strokeJoin(ROUND);
  triangle(width-90,height-90, width-90,height-50, width-50,height-70);
  strokeJoin(POINT);
}

void optionsPressed() {
  if (mouseX > width/2-300-15 && mouseX < width/2+300+15 && mouseY > height-140-15 && mouseY < height-140+15) {
    sliderDown = true;
  }
}

void optionsClick() {
  sliderDown = false; 
  
  if (mouseX > width-70-50 && mouseX < width-70+50 && mouseY > height-70-50 && mouseY < height-70+50) {
    gameSetup();
    mode = GAME;
  }
}
