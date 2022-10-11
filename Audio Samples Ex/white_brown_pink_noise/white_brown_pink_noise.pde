import processing.sound.*;
WhiteNoise noise; //can change this to brown or pink noise

void setup() {
  size(640, 360);
  background(255);
  
  // Create the noise generator
  noise = new WhiteNoise(this); // can change this to brown or pink noise
  noise.play();
}      

void draw() {
}
