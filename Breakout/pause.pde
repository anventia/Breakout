void pause() {
  // Pause //
  fill(bg, 30);
  stroke(bg,30);
  strokeWeight(0);
  rectMode(CORNER);
  rect(0,height-40, 350,40);
  rectMode(CENTER);
  textSize(25);
  fill(0);
  textAlign(LEFT);
  text("Click anywhere to resume.",10, height-10);
  textAlign(CENTER);
}

void pauseClick() {
  mode = GAME;
}
