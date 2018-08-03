void setup() {
  size(800,800, P3D);
  background(255,255,255);
}

float turn = 0;
float distance = 0;
float progression = 0;


void draw() {
  //background(255,255,255);
  fill(100,100,100,10);
  noStroke();
  translate(width/2, height/2);
  if (progression < 1000) {
    progression++;
  }
  for (int i = 0; i < progression; i++) {
    distance++;
    pushMatrix();
      rotate(turn);
      translate(distance, 0);
      ellipse(0,0,10,10);
    popMatrix();
    turn += PI/32;
  }
  distance = 0;
}
