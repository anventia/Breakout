void mousePressed() {
  if (mode == OPTIONS) {
    optionsPressed();
  }
}

void mouseReleased() {
  if (mode == INTRO) {
    introClick();
  } else if (mode == OPTIONS) {
    optionsClick();
  } else if (mode == GAME) {
    gameClick();
  } else if (mode == PAUSE) {
    pauseClick();
  } else if (mode == GAMEOVER) {
    gameoverClick();
  }
}
