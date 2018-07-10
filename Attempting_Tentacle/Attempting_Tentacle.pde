int height = 700;
int width = 700;
int segments = 50;
float reserveX = 0;
float reserveY = 0;

Circle[] circles = new Circle[segments];

void setup() {
  //size takes in (width, height) as params
  size(700, 700);
  background(255);
  for (int i = 0; i < segments; i++) {
    circles[i] = new Circle(i*20, 0); 
  }
}

void draw() {
  background(255, 255, 255);
  for (int i = segments - 1; i > 0; i--) {
      if (sqrt(pow(abs(circles[i].x - circles[i-1].x), 2) +
               pow(abs(circles[i].y - circles[i-1].y), 2)) >= circles[i].dim) {
      circles[i].x = circles[i].x + floor((.2 * (circles[i-1].x - circles[i].x)));
      circles[i].y = circles[i].y + floor((.2 * (circles[i-1].y - circles[i].y)));
          }
    circles[i-1].display();
  }
  reserveX = circles[0].x;
  reserveY = circles[0].y;
  circles[0].x = circles[0].x + floor((.1 * (mouseX - circles[0].x)));
  circles[0].y = circles[0].y + floor((.1 * (mouseY - circles[0].y)));
}