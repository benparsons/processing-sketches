import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_181129a extends PApplet {

Particle[] p = new Particle[100];
PGraphics textP;
int number = 1;
int dim = 400;

public void setup() {
  
  for (int i = 0; i < p.length; i++) {
    p[i] = new Particle(PApplet.parseInt(random(50, 350)), PApplet.parseInt(random(50, 350)));
  } 
  //background(255);
  textP = createGraphics(400, 400);
}

public void draw() {
  updateNumber();
  
  noStroke();
  fill(255, 10);
  rect(0,0,width, height);
  
  for (int i = 0; i < p.length; i++) {
    p[i].move(textP);
    p[i].render();
  }
}

public void updateNumber() {
  number = PApplet.parseInt( (millis() % 10000) / 1000 );
  textP.beginDraw();
  //textP.background(255);
  textP.noStroke();
  textP.fill(255);
  textP.rect(0,0,width, height);
  textP.fill(0);
  textP.textSize(256);
  textP.text(str(number), 150, 250);
  textP.endDraw();
}
class Particle {
  int x;
  int y;
  float speed = 2;
  
  Particle(int _x, int _y) {
    x = _x;
    y = _y;
  }
  
  public void render() {
    stroke(0);
    strokeWeight(10);
    point(x, y);
  }
  
  public void move(PGraphics textP) {
    int h = PApplet.parseInt((width/2 - x)/100);
    int v = PApplet.parseInt((height/2 - y)/100);
    x += PApplet.parseInt(random(-speed+h,speed+h));
    y += PApplet.parseInt(random(-speed+v,speed+v));

    if (x > textP.width) { x += -5; speed = 2; }
    if (x < 0) { x += 5; speed = 2; }
    if (y > textP.height) { y += -5; speed = 2; }
    if (y < 0) { y += 5; speed = 2; }


    float blues = blue(textP.get(x, y));
    //println(blues);
    if (blues == 0) {
      speed = 0;
    } else {
      speed += 0.3f;
    }
    // if (speed == 0 && random(1) > 0.9) {
    //   println("released");
    //   speed = 2;
    // }
  }
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_181129a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
