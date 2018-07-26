int col = 0;
int colVector = 1;

void setup() {
  size(400,400);
  background(255);
  strokeWeight(2);
}

void draw() {
  int x = int(map(randomGaussian(), -3, 3, 100, 300));
  int y = int(map(randomGaussian(), -3, 3, 100, 300));
  stroke(col);
  line(200, 200, x, y);
  if (col > 255 || col < 0)
    colVector *= -1;
  col += colVector;
}
