import peasy.*;

PeasyCam cam;

float inc = TWO_PI/50.0;
float rotation = 0;

void setup() {
  size(500,500,P3D);
  background(0);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(55);
  cam.setMaximumDistance(130);
  cam.setWheelScale(0.1);
  cam.setDistance(100);
  strokeWeight(0.1);
}

void draw() {
  fill(0,0,200);
  background(0);
  
  pushMatrix(); //Draw 2x2x2 cube of spheres
    translate(4,0,0);
    drawHalfAtom(0);
  popMatrix();
  pushMatrix();
    translate(-4,0,0);
    drawHalfAtom(1);
  popMatrix();
  fill(0,200,0);
  pushMatrix();
    translate(-30 * cos(rotation), 30 * cos(rotation), 30 * sin(rotation));
    sphere(3);
  popMatrix();
  pushMatrix();
    translate(-30 * sin(rotation + PI), 0, 30 * cos(rotation + PI));
    sphere(3);
  popMatrix();
  pushMatrix();
    translate(30 * sin(rotation), 30 * sin(rotation), 30 * cos(rotation));
    sphere(3);
  popMatrix();
  
  rotation += inc;
}

void drawHalfAtom(int trigger) {
  pushMatrix();
    translate(0,5,0);
    sphere(5);
  popMatrix();
  pushMatrix();
    translate(0,-5,0);
    sphere(5);
  popMatrix();
  if(trigger == 1) {
    fill(0,0,200);
  } else {
    fill(200,0,0);
  }
  pushMatrix();
    translate(0,0,5);
    sphere(5);
  popMatrix();
  pushMatrix();
    translate(0,0,-5);
    sphere(5);
  popMatrix();
}