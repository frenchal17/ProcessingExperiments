import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup(){
  size(500,500, P2D);
  background(220,220,220);
  
  minim = new Minim(this);
  
   player = minim.loadFile("/Users/frenchal/Downloads/Close.mp3", 2048);
    player.play();
}

  float BPM = 120;
  float calc2 = BPM / 4;
  float calc3 = calc2 / 2;

  float x = 0;
  float y = 0;
  float z = 2 * PI;
  float c = .006956525;
  float z2 = 0;
  float z3 = PI/100;
  float r = 59;
  float r2 = 0;
  
  
  
void draw(){
  x = x + c;
  y = y + c;
  fill(220,10);
  rect(-5,-5,width + 5,height + 5);
  for(int i = 0; i < player.left.size()-1; i++)
  {
    stroke(30, 0, 80 + player.left.get(i)*200);
    line(i, height/2 + player.left.get(i)*100, i+1, height/2 + player.left.get(i+1)*100);
    //line(i, height / 3 + player.left.get(i)*50, i+1, 2 * height/3 + player.left.get(i+1)*50);
    line(i, height/4 + player.right.get(i)*100, i+1, height/4 + player.right.get(i+1)*100);
    line(i, 3 * height/4 + player.right.get(i)*100, i+1, 3 * height/4 + player.right.get(i+1)*100);
    
  }
  
 /* if (x > z){
       background(201,200,200);
       z = z + 2 * PI;
  }*/
  
//Colored!
  if (x > z2){
    z2 = z2 + PI/calc3;
    r2 = random(0,150);
    stroke(r2,r2,r2);
    //r = random(100, 250);
  }
  
  //if (x > z3){
   // z3 = z3 + PI/calc3;
   // stroke(0,0,0);
   // r = 100;
  //}
  
}

void keyPressed(){
  if (key == 's'){
    saveFrame("####.png");
  }
}

void stop()
{
  player.close();
  minim.stop();
  
  super.stop();
}
