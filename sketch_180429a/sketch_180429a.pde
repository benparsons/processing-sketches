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
  size(400, 400);
  stroke(0);
  noFill();
}

void draw() {
  background(255);
  Point start = new Point(100, 200);
  Point end = new Point(300, 200);
  Point quarter = new Point(
    (end.x - start.x) / 4,
    (end.y - start.y) / 4);
  println(quarter);
  Point cp1 = new Point(start.x + quarter.x, start.y + quarter.y);
  Point cp2 = new Point(start.x + quarter.x * 3, start.y + quarter.y * 3);
  for (int i = 0; i < 10; i++) {
    int movement = int(random(-50, 50));
    bezier(start.x, start.y, cp1.x + movement, cp1.y + movement, cp2.x + movement, cp2.y + movement, end.x, end.y);
  }
  noLoop();
}
