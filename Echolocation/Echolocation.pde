void setup() {
  size(400, 300);
  background(255,255,255); 
}

float c = 5;
float x = 0;
float x2 = -200;
float y = 150;
void draw() {
  fill(220,10);
  rect(-1, -1, 401, 301);
  fill(255,255,255);
  ellipse(x, y, 10, 3*x/4 + 50);
  ellipse(x2, y, 10, 3*x2/4 + 50);
  x += c;
  x2 += c;
  
  if (x >= 405){
    x = 0;
    c += .3;
  }
  
  if (x2 >= 405){
    x2 = 0;
  }
}
