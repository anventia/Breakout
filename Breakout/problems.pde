//float spacing = (1080.0)/(brickRow-1.0);  // Spacing between the bricks
//println(spacing*(brickRow-1));  // This line should always return 1080
  // But with some values of brickRow, it does not
  // After checking some things with a calculator, it seems like when [spacing] contains very long/never-ending decimal places,
  // it just rounds the number down (floor?). This causes the second line to not return 1080.
  
  // Example:
  // brickRow = 24
  // spacing = 1080 / brickRow-1 = 46.95652173913... (brickRow-1 is 23)
  // When it does the second line, it removes the decimals and thinks spacing is equal to 46, and prints 1058, which is 46*23.
  
  // FIXED: 1080 -> 1080.0, 1 -> 1.0
