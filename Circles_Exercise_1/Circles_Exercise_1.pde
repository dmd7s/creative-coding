//Declaring Global variables
int x = 0;
int y = 0;


//initial Setup of size of out output box
void setup()
{
  //println(x);
  size(800,600);
  x = 800;
  y = 600;
  //println(x);
}
//introduction of draw function
void draw()
{
  noStroke();       //gets rid of outlines of shapes
  
  fill(color(0,0,0,10));
  rect(0,0,x,y);     //rect(x,y of the top left corner of the rect, width, height)
  
  //setting up color variables
  colorMode(HSB, 360, 100, 100);
  
  float hue = random(60,180);
  float sat = random(100,100);
  float bright = random(60,100);
  color randColor = color(hue,sat,bright);    //no longer need to call the color function, can use the 'color' variable instead
  
  
  fill(randColor);       //making use of the 'color' variable we made
  
  
  circle(random(x),random(y),100);   //circle(x,y, height and width of elipse)
}
// HTML/C#/JavaScript > Java > Python :D
