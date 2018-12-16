import java.util.*;

PImage photo;

void setup() {
  size(400, 400);
  photo = loadImage("../images/pinkseasunset.png");
  println(photo.width);
  
  surface.setResizable(true);
  surface.setSize(photo.width, photo.height);

  
}

void draw() {
  noLoop();
  image(photo, 0, 0);
  println("red: " + red(photo.get(50,50)) );
  println("green: " + green(photo.get(50,50)) );
  println("blue: " + blue(photo.get(50,50)) );
  println("hue: " + hue(photo.get(50,50)) );
  println("saturation: " + saturation(photo.get(50,50)) );
  println("brightness: " + brightness(photo.get(50,50)) );
  
  loadPixels();
  for (int i = 0; i < height; i++) { // for each row
    ArrayList al = new ArrayList<My>();
    for (int p = 0; p < width; p++) { // for each pixel in the row
      al.add(new My(pixels[i * width + p]));
    }
    Collections.sort(al);
    for (int p = 0; p < width; p++) { // for each pixel in the row
      pixels[i * width + p] = ((My)al.get(p)).col;
    }
  }
  
  updatePixels();
}

class My implements Comparable<My> {
  color col;
  
  My(color col) {
    this.col = col;
  }
  
  public int compareTo(My my) {
    return (int) Math.signum(hue(col) - hue(my.col));
  }
}
