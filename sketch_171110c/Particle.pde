class Particle {
  int x, y;
  int prevX, prevY;
  int energy;
  color c;
  
  Particle(int _x, int _y, int _energy, color _c) {
    x = _x;
    y = _y;
    energy = _energy;
    c = _c;
  }
  
  void mark() {
    stroke(c);
    point(x, y);
  }
  
  void jump() {
    stroke(c);
    line(prevX, prevY, x, y);
  }
  
  void walk() {
    prevX = x;
    prevY = y;
    x += random(0-energy,1+energy);
    y += random(0-energy,1+energy);
    
    postMove();
  }
  
  void headFor(int targetX, int targetY) {
    prevX = x;
    prevY = y;
    if (x < targetX) x++;
    if (x > targetX) x--;
    if (y < targetY) y++;
    if (y > targetY) y--;
    
    postMove();
  }
  
  void postMove() {
    if (x < 0) x = 0;
    if (x > width) x = width;
    if (y < 0) y = 0;
    if (y > height) y = height;
  }
  
  void bwFlip() {
    if (red(c) == 255 && blue(c) == 255 & green(c) == 255) {
      c = color(0,0,0);
    } else 
    if (red(c) == 0 && blue(c) == 0 & green(c) == 0) {
      c = color(255,255,255);
    }
  }
}