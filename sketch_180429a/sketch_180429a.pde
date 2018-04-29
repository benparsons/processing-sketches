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
  bezier(start.x, start.y, cp1.x, cp1.y + 50, cp2.x, cp2.y - 50, end.x, end.y);
  
  noLoop();
}
