void keyPressed() {
  if (key == 'a' || key == 'A') keyA = true;
  if (key == 'd' || key == 'D') keyD = true;
}


void keyReleased() {
  if (key == 'a' || key == 'A') keyA = false;
  if (key == 'd' || key == 'D') keyD = false;
}
