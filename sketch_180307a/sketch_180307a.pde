// parasol, size 5, posterize 6
// stives, size 5, posterize 7
// amanda, size 8, posterize 8
import java.util.Map;
HashMap<String, Integer> countColours;

void setup() {
  size(400, 400);
  PImage scene;
  scene = loadImage("../images/parasol.png");
  
  image(scene, 0, 0);
  println(countColours().size());
  noStroke();
  int size = 5;
  for (int i = 0; i < 2000; i++) {
    int x = int(random(0, width));
    int y = int(random(0, height));
    fill(scene.get(x, y));
    ellipse(x, y, size, size);
  }
  println(countColours().size());
  filter(BLUR);
  println(countColours().size());
  filter(POSTERIZE, 6);
  //image(scene, 0, 0);
  
  //for (Map.Entry me : countColours.entrySet()) {
  //  print(me.getKey() + " is ");
  //  println(me.getValue());
  //}
  println(countColours().size());

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