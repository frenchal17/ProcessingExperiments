import ddf.minim.*;

AudioPlayer player;
Minim minim;
AudioInput in;

void setup () {
  size(500,500);
  background(0,0,0);
  
  minim = new Minim(this);
  in = minim.getLineIn();
}

float xCoord1 = 0;
float xCoord2 = 500;

void draw () {
  fill(0,30);
  rect(-1, -1, width + 1, height + 1);
  stroke(255,255,255);
  noFill();
  
    for(int i = 1; i < in.bufferSize() - 1; i++) {
      if (xCoord1 != 0 || 300 * in.left.get(0) > 40) {
        ellipse(xCoord1, 5 * height / 6, 300 * in.left.get(i), 300 * in.right.get(i));
        ellipse(xCoord2, height / 6, 300 * in.left.get(i), 300 * in.right.get(i));
      }
      ellipse(width/2, height/2, 300 * in.left.get(i), 300 * in.right.get(i));
    }
    
    if (xCoord1 != 0 || 300 * in.left.get(0) > 40) {
      xCoord1 = (xCoord1 < width) ? xCoord1 + 30 : 0;
      xCoord2 = (xCoord2 > 0) ? xCoord2 - 30 : width;
    }
  
}
