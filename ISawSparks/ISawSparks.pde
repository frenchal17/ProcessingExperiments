import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup(){
  size (800, 700);
  background (0,0,0);
  
  minim = new Minim(this);
  player = minim.loadFile("/Users/frenchal/Downloads/WeirdDarkThings.mp3", 2048);

  player.play();
}

float n = 0;

void draw(){
  

  for(int i = 0; i < player.left.size()-1; i++){
    stroke(0,0,(850 * (player.left.get(i))));
    n += 0.0001;
    point(n, height - (850 * (player.left.get(i))));
    //line(n, height, n, height - ((player.left.get(i))));
    if (n >= width){
      n = 0;
      fill(0,10);
      rect(-5,-5,width + 5, height + 5);
    }
  }
}

void keyPressed(){
  if (key == 's'){
    saveFrame("####.png");
  }
}
