void intro() {
  introTheme.play();
  background(bg2);
  textSize(200);
  fill(255);
  text("Breakout", width/2,height/2);
  
  textSize(50);
  text("Click anywhere to start", width/2,height/4*3);
  
}

void introClick() {
  counter = 0;
  mode = OPTIONS;
}
