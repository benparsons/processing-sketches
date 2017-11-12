// this sketch shows the behaviour
// when we repeatedly add
// Gaussian Blur to an image

void setup() {
  background(255);
  size(200,200);
  strokeWeight(10);
  point(100,100);
}

void draw() {
  filter(BLUR);
}