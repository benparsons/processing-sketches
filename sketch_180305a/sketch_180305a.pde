PImage img, maskImg, scene1, scene2;
PGraphics m2;
void setup() {
  size(400, 400);
  scene1 = loadImage("../images/lake.png");
  scene2 = loadImage("../images/lake.png");
  //img = loadImage("washington.png");
  //maskImg = loadImage("circle.png");
  m2 = createGraphics(400, 400);
}

void draw() {
  //scene1.filter(POSTERIZE, 4);
  image(scene1, 0, 0);
  //background(0);
  //maskImg.filter(INVERT);
  //img.mask(maskImg);
  scene2.filter(POSTERIZE, 4);
  //image(img, 0, 0);
  m2.beginDraw();
  m2.background(0);
  m2.noStroke();
  m2.ellipse(mouseX, mouseY, 100, 100);
  m2.endDraw();
  scene2.mask(m2.get());
  
  image(scene2, 0, 0);
}