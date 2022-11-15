import processing.sound.*;
import de.looksgood.ani.*;
SoundFile beep;

float angle = 0;

int gameState = 0; //0 = startscreen, 1 = play, 2 = dead

int count = 0;
Zombie s;
Ground[] g;
int nGround = 0;
Boulder[] b;
int nBoulder = 4;
SkyBoulder[] b2;
int nSkyBoulder = 4;

void setup()
{
  size(1200,800);
  
  //fullScreen();
  beep = new SoundFile(this,"beep.wav");
  reset();
}

void draw()
{
  if(gameState == 0) startScreen();
  if(gameState == 1) game(); 
  if(gameState == 2) endScreen();
}

void reset()
{
  s = new Zombie(50,150,120,200);
  String[] files = {"zombie1.svg","zombie2.svg"};
  s.addAnimation(new Animation(files));
  String[] files1 = {"zombie1a.svg","zombie2a.svg"};
  s.addAnimation(new Animation(files1));
  String[] files2 = {"zombieup.svg"};
  s.addAnimation(new Animation(files2));
  String[] files3 = {"zombiefall1.svg","zombiefall2.svg"};
  s.addAnimation(new Animation(files3));
  s.currentAni=0;
  
  nGround = ceil(width/1000.0)+1;
  
  String[] files4 = {"ground1.svg"};
  String[] files5 = {"ground2.svg"};
  String[] files6 = {"ground3a.svg","ground3b.svg"};
  String[] files7 = {"ground4.svg"};
  String[] files8 = {"ground5.svg"};
  String[] files9 = {"ground6.svg"};
  g = new Ground[nGround];
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i] = new Ground(0,0,1000,250);
    g[i].location.x = (-width/2.0)+(i*1000.0);
    g[i].addAnimation(new Animation(files4));
    g[i].addAnimation(new Animation(files5));
    g[i].addAnimation(new Animation(files6));
    g[i].addAnimation(new Animation(files7));
    g[i].addAnimation(new Animation(files8));
    g[i].addAnimation(new Animation(files9));
  }
  String[] files10 = {"boulder1.svg"};
  String[] files11 = {"boulder2.svg"};
  String[] files12 = {"boulder3.svg"};
  String[] files13 = {"boulder4.svg"};
  String[] files14 = {"boulder5.svg"};
  b = new Boulder[nBoulder];
  for(int i = 0; i < nBoulder; i = i + 1)
  {
    b[i] = new Boulder(0,0,100,100);
    b[i].addAnimation(new Animation(files10));
    b[i].addAnimation(new Animation(files11));
    b[i].addAnimation(new Animation(files12));
    b[i].addAnimation(new Animation(files13));
    b[i].addAnimation(new Animation(files14));
  }  
  
  b2 = new SkyBoulder[nSkyBoulder];
  for(int i = 0; i < nBoulder; i = i + 1)
  {
    b2[i] = new SkyBoulder(0,0,100,100);
    b2[i].addAnimation(new Animation(files10));
    b2[i].addAnimation(new Animation(files11));
    b2[i].addAnimation(new Animation(files12));
    b2[i].addAnimation(new Animation(files13));
    b2[i].addAnimation(new Animation(files14));
  }  
}

//end screen
void endScreen()
{
  noStroke();
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("You are in a Hellscape. Press a key to resurrect.",width/2,height/2);
}

//startscreen
void startScreen()
{
  noStroke();
  fill(color(255,0,100));
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("Press any key to start",width/2,height/2);
}



//game state
void game()
{
  background(255);
  translate(width/2,height/2);
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i].update();
    g[i].check();
    g[i].display();
  }

  s.update();
  s.check();
  s.display();
  for(int i = 0; i < nGround; i = i + 1)
  {
    b[i].update();
    b[i].check();
    b[i].display();
  }  
  for(int i = 0; i < nGround; i = i + 1)
  {
    b2[i].update();
    b2[i].check();
    b2[i].display();
  }  
}

void keyPressed()
{
  if(gameState == 0) gameState = 1;
  if(gameState == 1) s.jump();
  if(gameState == 2) 
  {
    reset();
    gameState = 1;
  } 
}

boolean collision(Sprite s1, Sprite s2)
{
  PVector loc1 = new PVector(s1.location.x,s1.location.y);
  PVector loc2 = new PVector(s2.location.x,s2.location.y);
  PVector d = loc1.sub(loc2);
  float dist = d.mag();
  float limit = (min(s1.boxx,s1.boxy)/2)+(min(s2.boxx,s2.boxy)/2);
  if(dist < limit) return(true);
  return(false);
}
