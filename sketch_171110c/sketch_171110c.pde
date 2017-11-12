Particle p, f;

void setup() {
  size(600,600);
  p = new Particle(100, 100, 6, color(0, 0, 0));
  f = new Particle(100, 100, 1, color(255, 0, 0));
  background(255, 0);
  strokeWeight(3);
}

void draw() {
  p.walk();
  p.jump();
  f.headFor(p.x, p.y);
  f.jump();
  if (frameCount % 50 == 0) {
    filter(BLUR);
    //filter(DILATE);
    p.bwFlip();
  }
}