void setup() {
  size(700, 700);
  background(255);
}

int size = 200;
float x = 0;
float y = 1;
char progToDisplay = '1';

void draw() {
  background(255);
  for (int i = 0; i < size; i++) {
    stroke(0);
    fill(100,100,100,10);
    float dimension = (size - i)/4;
    pushMatrix();
      switch(progToDisplay) {
        case '1':
          translate(width/2 - abs(i*(sin(x/8))), height/2 + i*cos(x/8));
          break;
        case '2':
          translate(width/2 - abs(i*(sin(x/32))), height/2 + i*cos(x/32));
          break;
        case '3':
          translate(width/2 + i*(sin(x/8)), height/2 + i*cos(x/16));
          break;
        case '4':
          translate(width/2 + i*(sin(x)), height/2 + i*cos(x/32));
          break;
        default:
          translate(width/2 + i, height/2 + i*cos(x/32));
          break;
      }
      //180 degree tentacle sped up (rotating circles)
      //translate(width/2 - abs(i*(sin(x/8))), height/2 + i*cos(x/8));
      
      //180 degree tentacle 
      //translate(width/2 - abs(i*(sin(x/32))), height/2 + i*cos(x/32));
      
      //Hourglass
      //translate(width/2 + i*(sin(x/8)), height/2 + i*cos(x/16));
      
      //Trippy inverting cup
      //translate(width/2 + i*(sin(x)), height/2 + i*cos(x/32));
      
      //Realistic tentacle (what I originally was hoping for)
      //translate(width/2 + i, height/2 + i*cos(x/32));
      
      //This one is tied to the translate/Matrix block below
      //translate(width/2 - abs(i*(sin(x/32))), height/2 + i*cos(8*x));
      ellipse(0, 0, dimension, dimension);
    popMatrix();
    //pushMatrix();
    //  translate(width/2 + abs(i*(sin(x/32))), height/2 + i*cos(8*x));
    //  ellipse(0, 0, dimension, dimension);
    //popMatrix();
    x += 1;
  }
  
}

void keyTyped() {
  progToDisplay = key; 
}