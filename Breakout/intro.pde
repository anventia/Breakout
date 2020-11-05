void intro() {
  introTheme.play();
  //background(bg2);
  image(gif[gifFrame], 0,0, width,height);
  gifFrame += 1;
  if (gifFrame == numFrames) gifFrame = 0;
  
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
