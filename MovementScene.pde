int lineCount = 15;

ArrayList<Float> startLocations = new ArrayList<Float>();
ArrayList<Float> endLocations = new ArrayList<Float>();

void setupMovementScene() {
  for (int i=0; i<lineCount; i++) {
    startLocations.add(random(50, width - 50));
    endLocations.add(random(50, width - 50));
  }
}

void drawMovementScene() {
  colorMode(HSB, 360, 100, 100);

  if (frameCount % 30 == 0) {
    startLocations.clear();
    startLocations.addAll(endLocations);
    endLocations.clear();

    for (int i=0; i<lineCount; i++) {
      endLocations.add(random(100, width -100));
    }
  }
  
  background(0);
  stroke(255, 95);
  strokeWeight(2);
  noFill();
  translate(0, height /2);

  float time = (float)(frameCount % 30) /30;
  
  //time = pow(time, 2);
  //time = pow(time, 1f /2);
  time = 0.5 - (cos(PI * time) /2);

  for (int i=0; i<lineCount; i++) {
    float start = startLocations.get(i);
    float end = endLocations.get(2);

    float location = lerp(start, end, time);
    line(location, -64, location - 250, 64);
  }
}
