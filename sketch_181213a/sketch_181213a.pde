PImage photo; // 652, 470
int halfwidth = 652 / 2;

void setup() {
  size(2608, 470);
  photo = loadImage("../images/sealine.png");
}

void draw() {
  noLoop();
  imageMode(CORNERS);
  image(photo, 0, 0);
   pushMatrix();
 scale(-1.0, 1.0);
 //image(photo,-photo.width*1.5,0);
 blend(photo, 0,0 , photo.width, photo.height,    halfwidth, 0, halfwidth*3, photo.height,ADD);
 popMatrix();

}
