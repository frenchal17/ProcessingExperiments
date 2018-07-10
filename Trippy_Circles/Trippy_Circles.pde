void setup() {
  //size takes in (width, height) as params order
  size(700, 700);
  background(255);
}

int positionX = 0;
int positionY = 0;
int size = 200;
float x = 0;
float y = 1;
float change = .001;

void draw() {
  background(255);
  for (int i = 0; i < size; i++) {
    //noStroke();
    fill(100,100,100,10);
    float dimension = (size - i)/4;
    pushMatrix();
      translate(width - (i - 30*sin(x)), i - 30*cos(x));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    pushMatrix();
      translate(width - (i + 30*sin(x)), height - (i - 30*sin(x)));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    pushMatrix();
      //translate(i + 30*(sin(x/4)+cos(x)), i);
      translate(i + 30*(sin(x/4)+cos(2*x)), i);
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    pushMatrix();
      translate(width/2 + i*(sin(x)), height/2 + i*cos(x));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    x += 1;
    //y += change;
    //if (abs(y) > 30) {
    //  change = -change;
    //}
  }
  
}