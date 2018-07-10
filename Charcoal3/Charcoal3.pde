import ddf.minim.*;

AudioPlayer player;
Minim minim;

float ptsX[] = new float[15];
float ptsY[] = new float[15];
float decrem[] = new float[15];
float amp[] = new float[15];
int c = 0;

void setup() {
  size(600, 400);
  background(255, 255, 255);
  for (int i = 0; i < 15; i++) {
    ptsY[i] = (height - 2);
    decrem[i] = random(0, 0.01);
    amp[i] = random(-5, 5);
    ptsX[i] = 300 - amp[i];
  }
  
  minim = new Minim(this);
  player = minim.loadFile("/Users/frenchal/Downloads/WeirdDarkThings.mp3", 2048);

  player.play();
}

void draw() {
  background(255, 255, 255);
  fill(0, 0, 0);
  noStroke();
  while (c < player.left.size()-1) {
    c++;
    for (int j = 0; j < 15; j++) {
      ellipse(ptsX[j], ptsY[j], 4, 4);
      ptsY[j] -= decrem[j];
      ptsX[j] = 300 - amp[j] * cos((height - ptsY[j]) / 20);
      if (ptsY[j] <= 0) {
        amp[j] = 100 * player.left.get(c);
        ptsX[j] = 300 - amp[j];
        ptsY[j] = height - 2;
        decrem[j] = random(0.008, 0.02);
      }
    }
  }
  c = 0;
}
