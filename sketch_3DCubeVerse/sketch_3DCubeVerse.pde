import peasy.*;

PeasyCam cam;

float a = 0.0;
float b = 0.0;
float inc = TWO_PI/25.0;
float prev_x = 250, prev_y = 0, x, y, x2;
float prev_x2 = 250;

void setup() {
  size(500,500,P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}
void draw() {
  rotateX(-.5);
  rotateY(-.5);
  background(0);
  fill(255,0,0);
  box(30);
  fill(0,0,255);
  pushMatrix();
  for(int i = 0; i < 6; i++) {
     translate(30,0,0);
     box(5);
  }
  popMatrix();
  pushMatrix();
  for(int i = 0; i < 6; i++) {
     translate(0,30,0);
     box(5);
  }
  popMatrix();
  pushMatrix();
  for(int i = 0; i < 6; i++) {
     translate(0,0,30);
     box(5);
  }
  popMatrix();
  pushMatrix();
  for(int i = 0; i < 6; i++) {
     translate(-30,0,0);
     box(5);
  }
  popMatrix();
  pushMatrix();
  for(int i = 0; i < 6; i++) {
     translate(0,-30,0);
     box(5);
  }
  popMatrix();
  pushMatrix();
  for(int i = 0; i < 6; i++) {
     translate(0,0,-30);
     box(5);
  }
  popMatrix();
}