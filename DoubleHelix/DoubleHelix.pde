void setup() {
   size(400,400, P3D);
   background(0,0,0);
}

float a = 0.0;
float b = 0.0;
float rotation = 0;
float inc = TWO_PI/25.0;
float prev_x = 250, prev_y = 0, x, y, x2;
float prev_x2 = 250;

void draw() {
  background(0,0,0);
  stroke(255,255,255);
  
  for(int i = 0; i < 400; i = i + 4) {
    a = a + inc;
    y = i;
    x = 200 + sin(2*a/3) * 40.0;
    x2 = 200 - sin(2*a/3) * 40.0;
    line(prev_x, prev_y, x, y);
    line(prev_x, prev_y, x2, y);
    prev_x = x;
    prev_y = y; 
  }
  b = b + inc/30;
  a = b;
  prev_x = 250;
  prev_y = 0;
}