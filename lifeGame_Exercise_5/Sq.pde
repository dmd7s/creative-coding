class Sq
{
 float d = 30;
 int xpos = 0;
 int ypos = 0;
 boolean isBlack = true;
 boolean nextBlack = true; //next color
 
 Sq(int _x, int _y, float _d)
 {
   this.xpos = _x;
   this.ypos = _y;
   this.d = _d;
 }
 
 void liveOrDie()
 {
   int nLive = 0;
   
   int x = this.xpos;
   int xp = this.xpos + 1; if(xp > maxX - 1) xp = 0;
   int xm = this.xpos - 1; if(xm < 0) xm = maxX - 1;
   
   int y = this.ypos;
   int yp = this.ypos + 1; if(yp > maxY - 1) yp = 0;
   int ym = this.ypos - 1; if(ym < 0) ym = maxY - 1;
   
   if(!mySquare[xm][y].isBlack) nLive = nLive + 1;
   if(!mySquare[xp][y].isBlack) nLive = nLive + 1;
   if(!mySquare[x ][ym].isBlack) nLive = nLive + 1;
   if(!mySquare[x ][yp].isBlack) nLive = nLive + 1;
   
   if(!mySquare[xm][ym].isBlack) nLive = nLive + 1;
   if(!mySquare[xp][ym].isBlack) nLive = nLive + 1;
   if(!mySquare[xm][yp].isBlack) nLive = nLive + 1;
   if(!mySquare[xp][yp].isBlack) nLive = nLive + 1;
   
   if(!this.isBlack)
   {
     if(nLive == 2 || nLive == 3)
     {
       this.nextBlack = false;
     }
     else
     {
       this.nextBlack = true;
     }
   }
   else
   {
     if(nLive == 3 /*|| nLive == 4*/) // changing this will allow for out lives to last longer or shorter
     {
       this.nextBlack = false;
     }
     else
     {
       this.nextBlack = true;
     }
   }
   
   
   //fill(255,100,100);
   //textSize(30);
   //text(nLive,this.xpos*this.d,this.ypos*this.d+20);
 }
 
 void clicked(float x, float y)
 {
   if(
       x > this.xpos*this.d
       &&
       x < (this.xpos*this.d)+this.d
       &&
       y > this.ypos*this.d
       &&
       y < (this.ypos*this.d)+this.d
      )
      {
        this.isBlack = !this.isBlack;
      }
 }
 
 void show()
 {
   if(this.isBlack) 
    {
      fill(color(0,0,0));
    }
    else
    {
      fill(color(255,255,255));
    }
    square(this.xpos*this.d,this.ypos*this.d,this.d);
    //fill(255,100,100);
    
  }
}
