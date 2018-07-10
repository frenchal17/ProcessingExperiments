void setup() {
  //size takes in (width, height) as params order
  size(700, 700);
  background(255);
}

int size = 200;
float x = 0;

void draw() {
  background(255);
  frameRate(30);
  for (int i = 0; i < size; i++) {
    //noStroke();
    fill(100,100,100,20);
    float dimension = (size - i)/4;
    pushMatrix();
      translate(width/2 + sin(x)*width/4 + i*(sin(x)), height/2 + cos(x)*height/4 + i*cos(x));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    pushMatrix();
      translate(width/2 - i*(sin(x)), height/2 + i*cos(x));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    x += 1;
  }
  
}