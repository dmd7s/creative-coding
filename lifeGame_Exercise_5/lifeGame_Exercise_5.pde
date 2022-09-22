float d = 10;
int maxX = 0;
int maxY = 0;

int state = 0;

Sq[][] mySquare = new Sq[1000][1000];

void setup()
{
  size(800,600);
  d = width / 100;
  maxX = floor(width / d);
  maxY = floor(height / d);
  for(int y = 0; y < maxY; y = y + 1)
  {
   for(int x = 0; x < maxX; x = x + 1)
   {
     mySquare[x][y] = new Sq(x,y,d);
   }
  }
}

void draw()
{
  for(int y = 0; y < maxY; y = y + 1)
  {
   for(int x = 0; x < maxX; x = x + 1)
   {
     mySquare[x][y].show();
   }
  }
  
  for(int y = 0; y < maxY; y = y + 1)
  {
   for(int x = 0; x < maxX; x = x + 1)
   {
     if(state == 1) mySquare[x][y].liveOrDie();
   }
  }
  
  for(int y = 0; y < maxY; y = y + 1)
  {
   for(int x = 0; x < maxX; x = x + 1)
   {
     if (state == 1) mySquare[x][y].isBlack = mySquare[x][y].nextBlack;
   }
  }
}

void mousePressed()
{
  if(state == 0)              //checks state, for a psuedo drawing mode[ON/OFF];
  {
    for(int y = 0; y < maxY; y = y + 1)
    {
     for(int x = 0; x < maxX; x = x + 1)
     {
       mySquare[x][y].clicked(mouseX, mouseY);
     }
    }
  }
}

void keyPressed()             //registers if a key has been pressed
{
  if(state == 0)
  {
   state = 1;
  }
  else
  {
   state = 0; 
  }
}
