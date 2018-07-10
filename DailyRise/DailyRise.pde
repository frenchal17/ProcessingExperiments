float ptsX[] = new float[15];
float ptsY[] = new float[15];
float decrem[] = new float[15];
float c;
boolean csign = true;

void setup() {
  size(600, 400);
  background(0, 0, 0);
  for (int i = 0; i < 15; i++) {
    ptsX[i] = random(1, (width - 1));
    ptsY[i] = (height - 25);
    decrem[i] = random(1, 10);
  }
}

void draw() {
  background(c, c, c);
  stroke(255, 255, 255);
  line(0, (height - 25), width, (height - 25));
  for (int j = 0; j < 15; j++) {
    point(ptsX[j], ptsY[j]);
    ptsY[j] -= decrem[j];
    if (ptsY[j] <= 0) {
      ptsX[j] = random(1, (width - 1));
      ptsY[j] = (height - 25);
      decrem[j] = random(1, 10);
      if (c < 170 && csign == true) {
        c += 0.2;
      } else if (csign == false && c > 0) {
        c -= 0.2;
      } else {
        csign = !csign;
      }
    }
  }
}
