PVector center;
float angle = 0.0;
int redvalue = 177;
int greenvalue = 177;
int bluevalue = 177;
float falling = 0;
float velocity = 0;
float acceleration = 0.5;

void setup() {
  size(600, 600, P3D);
  background(0);
  center = new PVector(width/2, height/2, 0);
}

void draw() {
  velocity += acceleration;
  falling += velocity;
  directionalLight(redvalue,greenvalue,bluevalue, -1, -1, 0);
  directionalLight(redvalue,greenvalue,bluevalue, 1, -1, 0);
  translate(center.x, falling, 0);
  if(falling >= height - 50) {
    falling = height - 50;
    acceleration = 0;
    velocity = 0;
  } else {
    rotateZ(frameCount/100.0);
    rotateY(frameCount/200.0);
  }
  box(100);
}
