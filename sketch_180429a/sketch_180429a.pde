class Point {
  Point(int _x, int _y) {
    x = _x;
    y = _y;
  }
  
  public int x;
  public int y;
  
  String toString() {
    return x + " " + y;
  }
}

void setup() {
  size(800, 250);
  stroke(0, 0, 120, 50);
  noFill();
}

void draw() {
  background(255);
  // 10 pixels
  for (int i = 0; i < 791; i+=10) {
    handLine(new Point(i, 50), new Point(i+10, 50));
  }
  
  //50 pixels (2x offset)
  for (int i = 0; i < 751; i+=50) {
    handLine(new Point(i, 100), new Point(i+50, 100));
  }
  for (int i = -25; i < 776; i+=50) {
    handLine(new Point(i, 100), new Point(i+50, 100));
  }
  
  // 100 pixels (2x offset)
  for (int i = 0; i < 701; i+=100) {
    handLine(new Point(i, 150), new Point(i+100, 150));
  }
  for (int i = -50; i < 751; i+=100) {
    handLine(new Point(i, 150), new Point(i+100, 150));
  }
  
  // 800 pixels
  handLine(new Point(0, 200), new Point(800, 200));
  noLoop();
}

void handLine(Point start, Point end) {
  Point difference = new Point(
  (end.x - start.x),
  (end.y - start.y));
  float distance = sqrt(difference.x * difference.x + difference.y * difference.y);
  Point cp1 = new Point(start.x + difference.x / 4, start.y + difference.y / 4);
  Point cp2 = new Point(start.x + difference.x / 4 * 3, start.y + difference.y / 4 * 3);
  for (int i = 0; i < 10; i++) {
    int movement1 = int(random(-distance/20,distance/20));
    int movement2 = int(random(-distance/20,distance/20));
    bezier(start.x, start.y, cp1.x, cp1.y + movement1, cp2.x, cp2.y - movement2, end.x, end.y);
  }
}
