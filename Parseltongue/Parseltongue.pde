void setup() {
  size(700, 700);
  background(255);
}

int size = 200;
float x = 0;
float y = 1;

void draw() {
  background(255);
  for (int i = 0; i < size; i++) {
    //Turn on or off
    stroke(0);
    fill(100,100,100,10);
    float dimension = (size - i)/4;
    pushMatrix();
      translate(width/2 + i, height/2 + i*cos(x/32));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    pushMatrix();
      translate(width/2 - i, height/2 + i*cos(x/32));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    noStroke();
    pushMatrix();
      translate(width/2 - i, height/2 - i*cos(x/32));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    pushMatrix();
      translate(width/2 + i, height/2 - i*cos(x/32));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    x += 1;
    //y += change;
    //if (abs(y) > 30) {
    //  change = -change;
    //}
  }
  
}