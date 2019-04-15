void setup() {
  size(400,400);
  //frameRate(20);
  color sky = color(0, 0, 255);
  background(sky);
  color c2 = color(0, 102, 153);
  for (int i = 0; i <= height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(sky, c2, inter);
    stroke(c);
    line(0, i, width, i);
  }
}

void draw() {
  drawCloud();
  if (frameCount > 40) {
    noLoop();
  }
}

void drawCloud() {
  PGraphics p = createGraphics(100, 100);
  color blue2 = color(50, 50, 255);
  color blue3 = color(100, 100, 255);
  color blue4 = color(200, 200, 255);
  color blue5 = color(250, 220, 255);
  color white = color(255, 255, 255);
  
  int lowTop = 50;
  int highTop = lowTop - 15;
  
  IntList anchors = new IntList();
  anchors.append(int(random(30, 40)));
  anchors.append(int(random(65, 72)));
  anchors.append(int(random(anchors.get(0) + 8, anchors.get(1) - 8)));
  anchors.sort();
  //println(anchors);
  p.beginDraw();
  
  int y = lowTop;
  IntList top = new IntList();
  for (int x = 20; x < 80; x++) {
    if (x < anchors.get(0)) {
      if (y > highTop && random(1) > 0.5) y--;
    } else if (x < anchors.get(1) && random(1) > 0.5) {
      if (y < lowTop) y++;
    } else if (x < anchors.get(2) && random(1) > 0.5) {
      if (y > highTop) y--;
    } else {
      if (y < lowTop && random(1) > 0.5) y++;
    }
    top.append(y);
    p.set(x, y, blue5);
  }
  for (int x = 20; x < 80; x++) {
    y = top.get(x-20) - 1;
    if (random(1) > 0.5) {
      p.set(x, y, white);
    }
  }
  IntList base = new IntList();
  //y = top.get(59);
  //for (int x = 79; x >= 20; x--) {
  //  if (x > anchors.get(1)) {
  //    if (y < lowTop + 8 && random(1) > 0.5) y++;
  //  } else if (x > anchors.get(0)) {
  //    if (y > lowTop + 5 && random(1) > 0.5) y--;
  //  } else {
  //    if (y > lowTop && random(1) > 0.5) y--;
  //  }
  //  base.append(y);
  //  p.set(x, y, blue2);
  //}
  //base.reverse();
  y = lowTop;
  for (int x = 20; x < 80; x++) {
    if (x < anchors.get(0)) {
      if (y < lowTop + 2 && random(1) > 0.5) y++;
    } else if (x < anchors.get(1) && random(1) > 0.5) {
      if (y < lowTop + 8) y++;
    } else if (x < anchors.get(2) && random(1) > 0.5) {
      if (y > lowTop + 5) y--;
    } else {
      if (y > top.get(59) && random(1) > 0.5) y--;
    }
    base.append(y);
    p.set(x, y, blue2);
  }
  for (int x = 20; x < 80; x++) {
    p.set(x , base.get(x-20) - 1, blue3);
  }
  for (int x = 20; x < 80; x++) {
    for ( y = top.get(x-20) + 1; y < base.get(x-20) - 1; y++) {
      p.set(x, y, blue4);
    }
  }
  
  p.endDraw();
  //image(p, 0, 0, 400, 400);
  image(p, random(-50, 350), random(-50, 250));
}
