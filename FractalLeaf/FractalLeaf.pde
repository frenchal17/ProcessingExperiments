int[] points = new int[6];
int curX = (int) random(0, 500);
int curY = (int) random(0, 500);

void setup () {
  size(500, 500);
  background(255,255,255);
  for (int i = 0; i < 6; i++) {
    points[i] = (int) random(0, 500); 
  }
}

void draw () {
  fill(0);
  ellipse(curX, curY, 3, 3);
  int nextDirection = (int) random(0, 6);
  int dirX;
  int dirY;
  switch(nextDirection) {
    case 0:
    case 1:
      dirX = points[0];
      dirY = points[1];
      break;
    case 2:
    case 3:
      dirX = points[2];
      dirY = points[3];
      break;
    default:
      dirX = points[4];
      dirY = points[5];
      break;
  }
  
  curX = (int) (curX + dirX)/2;
  curY = (int) (curY + dirY)/2;
}
