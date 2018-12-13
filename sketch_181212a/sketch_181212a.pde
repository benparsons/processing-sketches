import java.util.*;

PImage photo;
ArrayList al = new ArrayList<My>();

void setup() {
  size(400, 400);
  photo = loadImage("../images/parasol.png");
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
  for (int i = 0; i < (width*height); i++) {
    //pixels[i] = pixels[pixels.length-i-1];
    al.add(new My(pixels[i]));
  }
  Collections.sort(al);
  
  for (int i = 0; i < (width*height); i++) {
    pixels[i] = ((My)al.get(i)).col;
  }
  updatePixels();
}

class My implements Comparable<My> {
  color col;
  
  My(color col) {
    this.col = col;
  }
  
  public int compareTo(My my) {
    return (int) Math.signum(saturation(col) - saturation(my.col));
  }
}
