// parasol, size 5, posterize 6
// stives, size 5, posterize 7
// amanda, size 8, posterize 8
import java.util.Map;
HashMap<String, Integer> countColours;
  PImage scene;
LiquitexBasics basics;
void setup() {
  basics = new LiquitexBasics();
  size(400, 400);
  scene = loadImage("../images/amanda.png");
  
}
void draw() {
  println(countColours().size());
  noStroke();
  int size = 8;
  for (int i = 0; i < 100000; i++) {
    int x = int(random(0, width));
    int y = int(random(0, height));
    fill(scene.get(x, y));
    //ellipse(x, y, size, size);
    rect(x, y, size, size);
  }
  println(countColours().size());
  filter(BLUR);
  println(countColours().size());
  filter(POSTERIZE, 8);
  
  println(countColours().size());

  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = getNearest(pixels[i], basics.colors);
  }
  updatePixels();
  println(countColours().size());
  noLoop();
}

HashMap<String, Integer> countColours() {
  HashMap<String, Integer> colourCount = new HashMap<String, Integer>(); 
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < width; y++) {
      color c = get(x,y);
      if (colourCount.containsKey(hex(c))) {
        colourCount.put(hex(c), colourCount.get(hex(c)) + 1);
      }
      else {
        colourCount.put(hex(c), 1);
      }
    }
  }
  return colourCount;
}

int getNearest(int input, int[] choices){
  int c = 0; //<>//
  int r = int(red(input));
  int g = int(green(input));
  int b = int(blue(input));
  int bestDist = 766;
  for(int i = 0; i < choices.length; i++){
    int R = int(red(choices[i]));
    int G = int(green(choices[i]));
    int B = int(blue(choices[i]));
    int dist = abs(R - r) + abs(G - g) + abs(B - b);
    if(dist < bestDist){
      c = choices[i];
      bestDist = dist;
    }
  }
  return c;
}