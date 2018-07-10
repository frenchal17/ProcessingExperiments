import ddf.minim.*;

AudioPlayer player;
Minim minim;

float ptsX[] = new float[15];
float ptsY[] = new float[15];
float decrem[] = new float[15];
float amp[] = new float[15];

void setup() {
  size(600, 400);
  background(255, 255, 255);
  for (int i = 0; i < 15; i++) {
    ptsY[i] = (height - 2);
    decrem[i] = random(1, 10);
    amp[i] = random(-5, 5);
    ptsX[i] = 300 - amp[i];
  }
  
  minim = new Minim(this);
  player = minim.loadFile("/Users/frenchal/Downloads/WeirdDarkThings.mp3", 2048);

  player.play();
}

void draw() {
  background(255, 255, 255);
  stroke(0, 0, 0);
  for(int i = 0; i < player.left.size()-1; i++){
    for (int j = 0; j < 15; j++) {
      point(ptsX[j], ptsY[j]);
      ptsY[j] -= decrem[j];
      ptsX[j] = 300 - amp[j] * cos(height - ptsY[j]);
      if (ptsY[j] <= 0) {
        amp[j] = 100 * player.left.get(i);
        ptsX[j] = 300 - amp[j];
        ptsY[j] = height - 2;
        decrem[j] = random(1, 10);
      }
    }
  }
}
