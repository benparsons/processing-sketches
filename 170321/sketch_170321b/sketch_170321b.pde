int p_count = 10;
Particle p[] = new Particle[10];

void setup() {
  size(100, 100);
  for (int i = 0; i < p_count; i++) {
    Particle p_ = new Particle();
    p_.x = 50;
    p_.y = (i + 1) * 8;
    p_.vector.x = round(random(-3, 3));
    p[i] = p_;
  }
}

void draw() {
  background(0);
  stroke(255);
  
  for (int i = 0; i < p_count; i++) {
    point(p[i].x,p[i].y);
    p[i].x += p[i].vector.x;
    if (p[i].x >= 100 || p[i].x <= 0) {
      p[i].vector.x *= -1;
    }
  }
}