import peasy.*;

PeasyCam cam;

int stageSize = 2000;

void setup() {
  size(600,600,P3D);
  background(0);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(2*stageSize);
  cam.setWheelScale(0.1);
  cam.setDistance(2*stageSize);
  strokeWeight(0.1);
}

float x = 0;
float inc = PI/20;
float locX = 1000 * sin(x);
int locY = stageSize;
float locZ = 1000 * cos(x);

int[][] stageWalls = {{stageSize,0,0},
                      {-stageSize,0,0},
                      {0,stageSize,0},
                      {0,-stageSize,0},
                      {0,0,stageSize},
                      {0,0,-stageSize}};
int[][] stageWalls2 = {{0,stageSize * 2,stageSize * 2},
                       {stageSize * 2,0,stageSize * 2},
                       {stageSize * 2,stageSize * 2,0}};

void draw() {
  fill(0, 255, 255);
  //for(int i = 0; i < 6; i++) {
  //  pushMatrix();
  //  translate(stageWalls[i][0],stageWalls[i][1],stageWalls[i][2]);
  //  box(stageWalls2[floor(i/2)][0],stageWalls2[floor(i/2)][1],stageWalls2[floor(i/2)][2]);
  //  popMatrix();
  //}
  
  fill(255,255,255);
  locX = 1000 * sin(x);
  locZ = 1000 * cos(x);
  pushMatrix();
  translate(locX, locY, locZ);
  sphere(100);
  popMatrix();
  
  locY -= 15;
  
  if (locY < -stageSize) {
    locY = stageSize; 
  }
  x += inc;
}