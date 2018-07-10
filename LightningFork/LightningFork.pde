import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup() {
  size(1280, 687, P2D);
  background(220, 220, 220);

  minim = new Minim(this);

  player = minim.loadFile("/Users/frenchal/Desktop/FinalProjectSong.mp3", 2048);
  player.play();
}

float x = height;
int left = 210;
int right = 290;
float c = 0.5;

void draw() {
  x = x - c;
  fill(220, 10);
  rect(-5, -5, width + 5, height + 5);
  for (int i = 0; i < 1280; i++)
  {
    stroke(30, 0, 80 + player.left.get(i)*300);
    line(i, 344 + player.left.get(i)*300, i+1, 344 + player.left.get(i+1)*200);
  }

  if (x < 0) {
    x = height;
    left = 225;
    right = 275;
  }
  
  if (x % 4 == 0) {
    left -= 1;
    right += 1;
    
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("####.png");
  }
}

void stop()
{
  player.close();
  minim.stop();

  super.stop();
}
