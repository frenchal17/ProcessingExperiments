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

public class DailyRise extends PApplet {

float ptsX[] = new float[15];
float ptsY[] = new float[15];
float decrem[] = new float[15];
float c;
boolean csign = true;

public void setup() {
  size(600, 400);
  background(0, 0, 0);
  for (int i = 0; i < 15; i++) {
    ptsX[i] = random(1, (width - 1));
    ptsY[i] = (height - 25);
    decrem[i] = random(1, 10);
  }
}

public void draw() {
  background(c, c, c);
  stroke(255, 255, 255);
  line(0, (height - 25), width, (height - 25));
  for (int j = 0; j < 15; j++) {
    point(ptsX[j], ptsY[j]);
    ptsY[j] -= decrem[j];
    if (ptsY[j] <= 0) {
      ptsX[j] = random(1, (width - 1));
      ptsY[j] = (height - 25);
      decrem[j] = random(1, 10);
      if (c < 170 && csign == true) {
        c += 0.2f;
      } else if (csign == false && c > 0) {
        c -= 0.2f;
      } else {
        csign = !csign;
      }
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "DailyRise" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
