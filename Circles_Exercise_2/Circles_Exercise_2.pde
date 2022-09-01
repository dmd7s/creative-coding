float _angle = 0;

void setup()
{
  //fullScreen();
  size(800,600);
}

void draw()
{
  
  clearScreen();
  translate(width/2,height/2);
  scale(0.5);                       //scales all the sizes
  aCircle(0,0,200,255,255,255);     //WHITE CIRCLE
  pushMatrix();                     //makes a copy of our original state 
    rotate(radians(_angle));
    translate(250,0);
    aCircle(0,0,100,0,100,255);     //BLUE CIRCLE
    //aMoon(100,1,250,0,100,255);
    pushMatrix();
      rotate(radians(_angle/3));
      translate(150,0);
      aCircle(0,0,30,55,200,50);    //GREEN CIRCLE rotates around blue
    popMatrix();
    //aPlanet(30,3,150,55,200,50);
    
    rotate(radians(_angle/2));      //YELLOW CIRCLE rotates around blue if last matrix wasnt there it would rotate around green
    translate(150,0);
    aCircle(0,0,20,255,200,0);
  popMatrix();                      /*reverts back to our original state so that our next circle isnt 
                                      affected by the last translate bascially */
  pushMatrix();                             
    rotate(radians(_angle/2));      //rotate at half the rate
    translate(150,0);
    aCircle(0,0,50,255,100,0);      //ORANGE CIRCLE rotates around white again bc of matrix
  popMatrix();
  
  //pushMatrix();                             
    rotate(radians(_angle/-2));     //rotate at half the rate but also opposite direction
    translate(400,0);
    aCircle(0,0,80,200,0,255);      //PURPLE CIRLCLE also rotates around white bc of previous matrix
  //popMatrix();
  
  rotate(radians(_angle/-3));     
  translate(500,0);                 //RED CIRCLE rotates around purple unless we add previous matrix, then it rotates around white
  aCircle(0,0,80,255,0,20);
  
  _angle = _angle + 1;
}

void aPlanet(float size, float speed, float distance, int red, int green, int blue)
{
  pushMatrix();                             
    rotate(radians(_angle/speed));     
    translate(distance,0);
    aCircle(0,0,size,red,green,blue);   
  popMatrix();
}
void aMoon(float size, float speed, float distance, int red, int green, int blue)
{                            
    rotate(radians(_angle/speed));     
    translate(distance,0);
    aCircle(0,0,size,red,green,blue);
}

void aCircle(float x, float y, float d, int red, int green, int blue)
{
  noStroke();
  fill(color(red,green,blue));
  circle(x,y,d);
}

void clearScreen()
{
  noStroke();              //gets rid of outlines of shapes
  fill(color(0,0,0,2));
  rect(0,0,width,height);  //rect(x,y of the top left corner of the rect, width, height)
}
