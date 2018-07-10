void setup() {
  background(0, 0, 0);
  size(800, 800);
  fractal(400, 400, 25);
}

void draw() {
  stroke(255, 255, 255);
}

int fractal(int x, int y, int depth) {
  
  if (depth == 0) {
    return 0;
  }
  
  if (x % 4 == 0) {
    fractal(x, y + 1, depth - 1);
    fractal(x, y - 1, depth - 1);
  }
  if (y % 4 == 0) {
    fractal(x + 1, y, depth - 1);
    fractal(x - 1, y, depth - 1);
  }
  
}
