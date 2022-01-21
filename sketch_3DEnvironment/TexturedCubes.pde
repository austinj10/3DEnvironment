float rotx, roty;

//void draw() {
//  background(0);

//  texturedCube(width/1.5, height/2, 0, quartz, 100);
//  texturedCube(width/1.5, height/4, 0, obsidian, 100);
//  texturedCube(width/3, height/2, 0, glowstone, 100);
//  texturedCube(width/3, height/4, 0, TNTtop, TNTside, TNTbottom, 100);
//}


void texturedCube(float x, float y, float z, PImage toptexture, PImage sidetexture, PImage bottomtexture, float size){
  pushMatrix();
  translate(x,y,z);
  scale(size);//magnify unit
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS); 
  texture(toptexture);
  //top face
  vertex(0, 0, 0, 0, 0);//x, y, z, texturex, texturey
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1); 
  endShape();

  beginShape(QUADS); 
  texture(bottomtexture);
  //bottom face
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1); 
  endShape();

  beginShape(QUADS);
  texture(sidetexture);
  //front face
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back face
  vertex(1, 0, 0, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(1, 1, 0, 0, 1);

  //left face
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right face
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 1, 1, 0, 1);
  endShape();

  popMatrix();

}


void texturedCube(float x, float y, float z, PImage texture, float size){
  pushMatrix();
  translate(x,y,z);
  scale(size);//magnify unit
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS); 
  texture(texture);
  //top face
  vertex(0, 0, 0, 0, 0);//x, y, z, texturex, texturey
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1); 
  endShape();

  //bottom face
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1); 
  endShape();

  //front face
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back face
  vertex(1, 0, 0, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(1, 1, 0, 0, 1);

  //left face
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right face
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 1, 1, 0, 1);
  endShape();

  popMatrix();

}
