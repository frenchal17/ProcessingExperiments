int[] points = new int[6];
float curX = 350;
float curY = 350;
float curX2 = 350;
float curY2 = 350;

void setup () {
  size(700, 700);
  background(255,255,255);
  for (int i = 0; i < 6; i++) {
    points[i] = (int) random(0, 500); 
  }
}

void draw () {
  fill(0);
  ellipse(curX, curY, 3, 3);
  ellipse(curX2, curY2, 3, 3);
  int rulePercent = (int) random(0,100);
  int rule = -1;
  if (rulePercent == 0) { rule = 0; };
  if (rulePercent > 0 && rulePercent < 8) { rule = 1; };
  if (rulePercent >= 8 && rulePercent < 15) { rule = 2; };
  if (rule == -1) { rule = 3; };
  switch(rule) {
    case 0:
      //curX = 0;
      //curY *= 0.16;
      curX2 = 0;
      curY2 *= -0.16;
      break;
    case 1:
      //curX = curX * 0.2 - curY * 0.26;
      //curY = curX * 0.23 + curY * 0.22 + 1000;
      curX2 = curX2 * -0.2 + curY2 * 0.26;
      curY2 = curX2 * -0.23 - curY2 * 0.22 + 1000;
      break;
    case 2:
      //curX = curX * 0.15 + curY * 0.28;
      //curY = curX * 0.26 + curY * 0.24 + 1.44;
      curX2 = curX2 * -0.15 + curY2 * -0.28 + 1000;
      curY2 = curX2 * -0.26 + curY2 * -0.24 + 1.44;
      break;
    default:
      //curX = curX * 0.85 + curY * 0.08; //The 0.08 changes the horizontal position of the leafpt
      //curY = curX * -0.04 + curY * 0.85 + 100; //The 100 changes the vertical position of leafpt
      curX2 = curX2 * -0.85 - curY2 * 0.08; //The 0.08 changes the horizontal position of the leafpt
      curY2 = curX2 * 0.04 - curY2 * 0.85 + 100;
      break;
  }
}