float _angle = 0;
int nPlanets = floor(random(2,10));

float[] distance = new float [nPlanets];
float[] size = new float [nPlanets];
float[] speed = new float [nPlanets];
color[] col = new color [nPlanets];

void setup()
{
  //fullScreen();
  size(800,600,P3D);
  
  for(int i = 0; i < nPlanets; i = i + 1)
  {
    distance[i] = random(100,550);
    size[i] = random(30,100);
    speed[i] = random(-2.0,2.0);
    col[i] = color(random(255),random(255),random(255));
  }
}

void draw()
{
  
  clearScreen();
  translate(width/2,height/2);
  scale(0.5);          //scales all the sizes
  
  aCircle(0,0,200,color(255,255,255));     //WHITE CIRCLE
  
                       /*reverts back to our original state so that our next circle isnt 
                                      affected by the last translate bascially */
  for(int i = 0; i < nPlanets; i = i + 1)
  {
    aPlanet(size[i], speed[i], distance[i], col[i]);
  }
  
  _angle = _angle + 1;
}

void aPlanet(float size, float speed, float distance, color col)
{
  pushMatrix();                             
    rotate(radians(_angle*speed));     
    translate(distance,0);
    aCircle(0,0,size,col);   
  popMatrix();
}

void aCircle(float x, float y, float d, color col)
{
  noStroke();
  //fill(color(red,green,blue));
  fill(col);
  circle(x,y,d);
}

void clearScreen()
{
  noStroke();              //gets rid of outlines of shapes
  fill(color(0,0,0,10));   //in this code, this controls the length/visibility of the trails
  rect(0,0,width,height);  //rect(x,y of the top left corner of the rect, width, height)
}
