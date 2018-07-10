float[] pts = new float[4];

void setup() {
  background(0, 0, 0);
  size(800, 800);
  pts[0] = 404;
  pts[1] = 404;
  pts[2] = 396;
  pts[3] = 396;
}

float x = 0;
float y = 0;

void draw() {
  stroke(0, 0, 400 - pts[2]);
  for (int i = 0; i < 4; i++) {
    if (i % 2 == 0) {
      point(pts[i], 400);
      if ((int)pts[i] % 8.0 == 0) {
        line(pts[i], 0, pts[i], 800);
      }
    } else {
      point(400, pts[i]);
      if ((int)pts[i] % 8.0 == 0) {
        line(0, pts[i], 800, pts[i]);
      }
    }
  }
  pts[0] += 1;
  pts[1] += 1;
  pts[2] -= 1;
  pts[3] -= 1;
  
  if (pts[0] > 800) {
    background(0, 0, 0);
    pts[0] = 404;
    pts[1] = 404;
    pts[2] = 396;
    pts[3] = 396;
  }
}

//int fractal(int x, int y, int depth) {
//
//  if (depth == 0) {
//    return 0;
//  }
//
//  if (x % 4 == 0) {
//    fractal(x, y + 1, depth - 1);
//    fractal(x, y - 1, depth - 1);
//  }
//  if (y % 4 == 0) {
//    fractal(x + 1, y, depth - 1);
//    fractal(x - 1, y, depth - 1);
//  }
//  return 0;
//}

