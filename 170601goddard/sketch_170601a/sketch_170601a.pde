void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {
  stroke(0);
  int r = 100;
  int g = 100;
  int b = 100;
  for (int i = 0; i <= height; i += 2) {
    r = intRandInRange(r, 10, 240, 5);
    g = intRandInRange(g, 10, 240, 5);
    b = intRandInRange(b, 10, 240, 5);
    drawLine(i, color(r, g, b));
  }
  //filter(BLUR, 1);
  //noLoop();
}

void drawLine(int y, color c) {
  stroke(c);
  int w = 6;
  for (int i = 0; i < width; i++) {
    strokeWeight(w);
    point(i, y);
    w = intRandInRange(w, 2, 10, 1);
  }
}

int intRandInRange(int start, int min, int max, int delta) {
  start += random(-delta, delta + 1);
  if (start < min) return min;
  if (start > max) return max;
  return start;
}