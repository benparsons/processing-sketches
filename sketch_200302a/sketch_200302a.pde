int x, y;
int angle = 0;

void setup() {
  size (400, 400);
  noFill();
  x = width/2;
  y = height/2;
  //frameRate(2);
}

void draw() {
  background(255);
  int col = 0;
  int radius = 5;
  for (int i = 0; i < 299; i++) {
    col ++;
    if (col == 50) {
      col = 0;
      radius += 5;
    }
    stroke(col);
    ellipse(x + radius * cos(radians(angle)), y + radius * sin(radians(angle)),300-i,300-i);
  }
  angle ++;
}
