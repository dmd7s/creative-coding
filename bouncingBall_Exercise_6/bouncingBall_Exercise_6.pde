PVector location = new PVector(100,100);
PVector speed = new PVector(-1,-2);
float acceleration = 1.001;

int d = 40;

void setup()
{
  size(800,600);
}

void draw()
{
  background(255);
  circle(location.x,location.y,d);
  
  speed.mult(acceleration);
  location.add(speed);
  
  if(location.x < 0 + (d/2) || location.x > width - (d/2))
  {
    speed.x = speed.x*(-1);
  }
  if(location.y < 0 + (d/2) || location.y > height - (d/2))
  {
    speed.y = speed.y*(-1);
  }
}
