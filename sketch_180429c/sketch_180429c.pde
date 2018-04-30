PImage source;
int ratio = 2;

void setup() {
  size(100,100);
  source = loadImage("parasol00004.png");
  println(source.width);
  surface.setSize(source.width * ratio, source.height * ratio);
  background(255);
}

void draw() {
  int previous = -1;
  int next = -1;
  stroke(0);
  for (int x = 0; x < source.width ; x++) {
    for (int y = 0; y < source.height; y++) {
      next = source.get(x, y);
      println(x, y);
      if (previous != next) {
        //point(x * ratio - 1, y * ratio);
        point(x * ratio, y * ratio);
      }
      //println(blue(source.get(x, y)));
      
      previous = next;
    }
  }
  
  for (int y = 0; y < source.height; y++) {
    for (int x = 0; x < source.width; x++) {
      next = source.get(x, y);
      println(x, y);
      if (previous != next) {
        //point(x * ratio, y * ratio - 1);
        point(x * ratio, y * ratio);
      }
      //println(blue(source.get(x, y)));
      
      previous = next;
    }
  }
  save("out.png");
  noLoop();
}
