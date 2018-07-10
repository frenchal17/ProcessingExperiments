float eyeX, eyeY, eyeZ, cenX, cenY, cenZ = 0;
StringList keyCommands = new StringList();
float xDirection = 0;
float zDirection = 0;
float grade = 0;

void setup () {
  fullScreen(P3D);
}

public void draw() {
  println(eyeX + " " + eyeY + " " + eyeZ);
  if (eyeZ == cenZ) {
    grade = 1; 
  } else {
    grade = abs((eyeX - cenX) / (eyeZ - cenZ));
  }
  xDirection = 1;
  zDirection = 1;
  if ((eyeX - cenX) != 0) {
    xDirection = (eyeX - cenX)/abs(eyeX - cenX)*grade;
  }
  if ((eyeZ - cenZ) != 0) {
    zDirection = (eyeZ - cenZ)/abs(eyeZ - cenZ)*(1 - grade);
  }
  camera(eyeX, eyeY, eyeZ, cenX, cenY, cenZ, 1, 1, 1);
  rotateX(-.5f);
  rotateY(-.5f);
  lights();
  scale(10);
  strokeWeight(1 / 10f);
  background(255);
  fill(255, 0, 0);
  box(30);
  pushMatrix();
  translate(0, 0, 20);
  fill(0, 0, 255);
  box(5);
  popMatrix();
  executeAllCommands();
}

public void executeAllCommands() {
  
  for (String command : keyCommands) {
    switch(command) {
      case "a":  //A
        eyeX += 4/xDirection;
        cenX += 4/xDirection;
        eyeZ += 4/zDirection;
        cenZ += 4/zDirection;
        break;
      case "s":  //S
        eyeX -= 4*xDirection;
        cenX -= 4*xDirection;
        eyeZ -= 4*zDirection;
        cenZ -= 4*zDirection;
        break;
      case "d":  //D
        eyeX -= 4/xDirection;
        cenX -= 4/xDirection;
        eyeZ -= 4/zDirection;
        cenZ -= 4/zDirection;
        break;
      case "w":  //W
        eyeX += 4*xDirection;
        cenX += 4*xDirection;
        eyeZ += 4*zDirection;
        cenZ += 4*zDirection;
        break;
      case " ":
        eyeY -= 2;
        cenY -= 2;
        break;
    }
  }
}

public void keyPressed() {
  if (!keyCommands.hasValue(str(key))) {
    keyCommands.append(str(key)); 
  }
}

public void keyReleased() {
  for (int i = 0; i < keyCommands.size(); i++) {
    if (keyCommands.get(i).equals(str(key))) {
      keyCommands.remove(i);
      break;
    }
  }
}