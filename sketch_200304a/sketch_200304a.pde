int _x, _y;
int slider, sliderVector;
int reach;
color[] c;
color black = color(0, 100);
int c1, c2;
boolean up = true;

void setup() {
  size(640, 480);
  //size(320, 240);
  background(255);
  stroke(0, 100);
  _x = width/2;
  _y = height/2;
  slider = height/2;
  sliderVector = 1;
  reach = 0;
  c = new color[5];
  c[0] = color(255, 0, 193, 100);
  c[1] = color(151, 0, 255, 100);
  c[2] = color(77, 0, 255, 100);
  c[3] = color(22, 255, 249, 100);
  c[4] = color(23, 183, 255, 100);
  c1 = 2;
  c2 = 1;
}

void draw() {
  int x = int(randomGaussian() * width/5) + width/2;
  int y = int(randomGaussian() * height/4) + height/2;
  type2(x, y);
  _x = x;
  _y = y;
}

void type1(int x, int y) {
  line(x,y, _x, _y);
}

void type2(int x, int y) {
  if (x > width/2) {
    line(width, height/2, x, y);
  } else {
    line(0, height/2, x, y);
  }
  if (frameCount % 20 == 0) {
    if (up) {
      filter(BLUR);
    } else {
      filter(INVERT);
      filter(BLUR);
      filter(INVERT);
    }
    //println(frameCount);
  }
  if (frameCount % 3000 == 0) {
    up = !up;
    println(up);
  }
}


void type3(int x, int y) {
  if (x > width/2) {
    stroke(c[c1]);
    line(width, slider, x - reach, y);
  } else {
    stroke(c[c2]);
    line(0, slider, x + reach, y);
  }
  slider += sliderVector;
  if (slider < 0 | slider > height) sliderVector*=-1;
  
  if (frameCount % 20 == 0) {
    filter(INVERT);
    filter(BLUR);
    filter(INVERT);
    reach++;
  }
  if (frameCount % 200 == 0) {
    c1++;
    if (c1 == 5) c1 = 0;
    c2++;
    if (c2 == 5) c2 = 0;
  }
}
