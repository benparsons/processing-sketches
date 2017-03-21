int x;
int y;
PVector vector = new PVector();

void setup() {
  x = 50;
  y = 50;
  size(100, 100);
  vector.x = 1;
}

void draw() {
  background(0);
  stroke(255);
  point(x, y);
  x += vector.x;
  if (x > 100 || x < 0) {
    vector.x *= -1;
  }
}