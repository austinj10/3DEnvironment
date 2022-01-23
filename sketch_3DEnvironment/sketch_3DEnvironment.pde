import java.awt.Robot;

Robot rbt;
boolean skipFrame;

//color pallette
color black = #000000; // glowstone
color white = #FFFFFF; //empty space
color dullBlue = #7092BE; // quartz

//map variables
int gridSize;
PImage map;

//textures
PImage quartz, obsidian, glowstone, TNTtop, TNTbottom, TNTside;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  size(displayWidth, displayHeight, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = height/1.15;
  eyeZ = 0;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  upX = 0;
  upY = 1;
  upZ = 0;
  leftRightHeadAngle = radians(270);

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  skipFrame = false;

  //initialize map
  map = loadImage("map.png");
  gridSize = 100;//100 by 100

  //load images
  quartz = loadImage("quartz.png");
  obsidian = loadImage("obsidian.png");
  glowstone = loadImage("glowstone.png");
  TNTtop = loadImage("tnttop.png");
  TNTside = loadImage("tntside.png");
  TNTbottom = loadImage("tntbottom.png");

  noCursor();
}


void draw() {
  pointLight(230,230,230,eyeX,eyeY,eyeZ);
  
  background(0);
  
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  
  drawFloor(-2000,2000,height,100);//floor
  drawFloor(-2000,2000,height-gridSize*4,100);//ceiling
  drawFocalPoint();
  controlCamera();
  drawMap();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == dullBlue) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, quartz, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, quartz, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, quartz, gridSize);
      } if (c == black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, glowstone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, glowstone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, glowstone, gridSize);
      }
    }
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  strokeWeight(1);
  int x = start;
  int z = start;
  while (z < end){
    texturedCube(x, level, z, obsidian, gap);
    x = x + gap;
    if (x == end){
      x = start;
      z = z + gap;
    }
  }
}


void controlCamera() {
  if (wkey) {
    eyeX = eyeX + cos(leftRightHeadAngle) * 10;
    eyeZ = eyeZ + sin(leftRightHeadAngle) * 10;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle) * 10;
    eyeZ = eyeZ - sin(leftRightHeadAngle) * 10;
  }
  if (akey) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2) * 10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2) * 10;
  }
  if (dkey) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2) * 10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2) * 10;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.001;//
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.001;
  }

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  focusX = eyeX + cos(leftRightHeadAngle) * 300;
  focusZ = eyeZ + sin(leftRightHeadAngle) * 300;
  focusY = eyeY + tan(upDownHeadAngle) * 300;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
}



void keyPressed() {
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'S' || key == 's') skey = true;
  if (key == 'D' || key == 'd') dkey = true;
}


void keyReleased() {
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'S' || key == 's') skey = false;
  if (key == 'D' || key == 'd') dkey = false;
}
