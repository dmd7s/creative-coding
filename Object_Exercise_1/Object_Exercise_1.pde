
Planet sun;
int nGeneration = 3;

void setup()
{
  size(1200,1000);
  sun = new Planet(random(100,500));
  sun.dist = 0;
  sun.col = color(255,200,0);
  sun.size = 100;
  sun.nPlanet = floor(random(5));
  sun.makeMoons();
}

void draw()
{
  noStroke();
  fill(color(0,0,0,40));
  rect(0,0,width,height);
  translate(width/2,height/2);
  scale(0.4);
 
  sun.show();

}
