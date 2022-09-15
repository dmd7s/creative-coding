float angle = 0;

void setup()
{
  size(800,800);
}
void draw()
{
  translate(width/2,height/2);
  
  strokeWeight(20);
  stroke(color(0,0,0));
  circle(0,0,700);
  
  pushMatrix();
    strokeWeight(15);
    rotate(radians(angle));
    line(0,40,0,-300);
  popMatrix();
  
  pushMatrix();
    rotate(radians(angle/12));
    //stroke(255,0,0);
    strokeWeight(20);
    line(0,40,0,-200);
  popMatrix();
  
  pushMatrix();
    strokeWeight(8);
    stroke(255,0,0);
    rotate(radians(angle*60));
    line(0,40,0,-250);
  popMatrix();
  
  stroke(0,0,0);
  circle(0,0,50);
  angle = angle + 0.1;
}
