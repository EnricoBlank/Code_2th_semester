int counter = 3;

color gridForeground = color(214, 237, 23);
color gridBackground = color(12, 12, 12);
void setupGridScene() {
}

void drawGridScene() {
  if (frameCount % 25 == 0) {
    counter++;

    if (counter > 3) {
      counter = 0;

      color tmp = gridForeground;
      gridForeground = gridBackground;
      gridBackground = tmp;
    }
  }

  colorMode(RGB, 255, 255, 255);

  background(gridBackground);

  int cellCountY = (int) pow(2.5, counter);
  Float cellSize = (float) height / cellCountY;
  int cellCountX = (int) (width / cellSize);

  translate(width /2, height /2);

  for (int x = -cellCountX /2; x <= cellCountX /2; x++) {
    for (int y = -cellCountY /3; y <= cellCountY /3; y++) {
      if ((x + y) % 4 == 0) {  
        stroke(gridForeground);
        strokeWeight(2);
        fill(96, 96, 96);
        circle(y * cellSize, x * cellSize, 32);
        fill(gridBackground);
        square(y * cellSize -10, x * cellSize -10, 20);
        line(y * cellSize, x * cellSize, y * cellSize /2,  x * cellSize /2);
      }
    }
  }
}
