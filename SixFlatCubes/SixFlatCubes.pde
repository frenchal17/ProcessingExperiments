import peasy.*;

PeasyCam cam;

float inc = TWO_PI/50.0;
int stageSize = 2000;
int locX = stageSize;
int locY = stageSize;
int locZ = stageSize;

void setup() {
  size(600,600,P3D);
  background(0);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(stageSize - 200);
  cam.setWheelScale(0.1);
  cam.setDistance(stageSize - 200);
  strokeWeight(3);
  cam.rotateY(PI/2);
}

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
  background(0);
  spotLight(255,255,255,
            stageSize - 50, 0, 0,
            -1, 0, 0,
            PI, 2);
  spotLight(255,255,255,
            -stageSize, 0, 0,
            1, -1, -1,
            PI, 2);
  spotLight(255,255,255,
            -stageSize, 0, 0,
            1, -1, 1,
            PI, 2);
  for(int i = 0; i < 6; i++) {
    pushMatrix();
    translate(stageWalls[i][0],stageWalls[i][1],stageWalls[i][2]);
    box(stageWalls2[floor(i/2)][0],stageWalls2[floor(i/2)][1],stageWalls2[floor(i/2)][2]);
    popMatrix();
  }
  
  pushMatrix();
  translate(locX, locY, locZ);
  sphere(200);
  locX -= 9;
  locY -= 9;
  locZ -= 9;
  if (locX < -stageSize || locY < -stageSize || locZ < -stageSize) {
    locX = stageSize;
    locY = stageSize;
    locZ = stageSize;
  }
  popMatrix();
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      cam.pan(-10, 0); 
    }
    if (key == 's' || key == 'S') {
      cam.pan(0, 10); 
    }
    if (key == 'd' || key == 'D') {
      cam.pan(10, 0); 
    }
    if (key == 'w' || key == 'W') {
      cam.pan(0, -10); 
    }
  }
}