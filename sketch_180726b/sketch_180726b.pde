int col = 0;
int colVector = 1;
int count = 0;
int spread = 20;
int paint_size = 20;

void setup() {
  size(400,400);
  background(255);
  strokeWeight(2);
  fill(0,0,255, 90);
  noStroke();
}

void draw() {
  int x = int(map(randomGaussian(), -1, 1, 200-spread, 200+spread));
  int y = int(map(randomGaussian(), -1, 1, 200-spread, 200+spread));
  ellipse(x, y, paint_size, paint_size);
  count++;
  if (count > 100) {
    noLoop();
    filter(POSTERIZE, 4);
  }
}
