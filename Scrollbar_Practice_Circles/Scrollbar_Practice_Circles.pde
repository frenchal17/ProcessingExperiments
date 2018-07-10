HScrollbar hs1;
HScrollbar hs2;

void setup() {
  //size takes in (width, height) as params order
  size(700, 700);
  background(255);
  
  hs1 = new HScrollbar(0, 8, width, 16, 1, 'a', 'd');
  hs2 = new HScrollbar(0, 24, width, 16, 1, 'j', 'l');
}

int numCircles = 200;
float x = 0;
boolean lockSliders = false;
boolean spinOffset = false;

void draw() {
  background(255);
  frameRate(25);
  for (int i = 0; i < numCircles; i++) {
    stroke(0);
    fill(100,100,100,20);
    float dimension = (numCircles - i)/4;
    float sinDivisor = 175 / max(5, hs1.getPos());
    float cosDivisor = 175 / max(5, hs2.getPos());
    if (spinOffset) {
      cosDivisor *= .9999;
    }
    //pushMatrix();
    //  translate(width/2 + sin(x)*width/4 + i*(sin(x)), height/2 + cos(x)*height/4 + i*cos(x));
    //  ellipse(0, 0, dimension, dimension);
    //popMatrix();
    pushMatrix();
      translate(width/2 - i*(sin(x/sinDivisor)), height/2 + i*cos(x/cosDivisor));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    x += 1;
    
    hs1.update();
    hs1.display();
    hs2.update();
    
    if (lockSliders) {
      hs2.spos = hs1.spos;
    }
    
    hs2.display();
  }
  
}

void triggerLock() {
  lockSliders = !lockSliders;
}

void triggerSpin() {
  spinOffset = !spinOffset;
}

void keyTyped() {
  hs1.keyTrigger(key);
  hs2.keyTrigger(key);
  if (key == ' ') {
    triggerLock(); 
  }
  if (key == 's') {
    triggerSpin();
  }
}