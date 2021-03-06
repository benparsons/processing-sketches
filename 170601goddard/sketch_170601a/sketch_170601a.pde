int r, g, b, y;

void setup() {
  size(2000, 1000);
  background(0);
}

void draw() {
  stroke(0);
  if (y > height) {
    y = 0;
    r = 100;
    g = 100;
    b = 100;
    saveFrame("big/#######.png");
  }
  
  r = intRandInRange(r, 10, 240, 10);
  g = intRandInRange(g, 10, 240, 10);
  b = intRandInRange(b, 10, 240, 10);
  drawLine(y, color(r, g, b));
  y+=2;
  
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