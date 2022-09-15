//float whiteSquare = 0;
//float blackSquare = 100;

void setup()
{
  size(800,800);
}

void draw()
{
  drawRow();
}
void drawRow()
{
  for(int y = 0; y < 800; y = y + 100)
  {
    for(int x = 0; x < 800; x = x + 100)
    {
      if ((x+y) % 200 > 0)
      {
        fill(color(0,0,0));
      }
      else
      {
        fill(color(255,255,255));
      }
      rect(x,y,100,100);
     }
   }
}
