int x, y;
int frame;

void setup() {
  size(400, 400);
  x = width / 2;
  y = height / 2;
  background(255);
}

void draw() {
  frame++;
  point(x, y);
  x += random(-1, 2);
  y += random(-1, 2);
  if (frame % 20 == 0) {
    filter(BLUR);
    filter(POSTERIZE, 8);
    if (frame % 100 == 0) saveFrame("1/#####.png");
  }
  
}