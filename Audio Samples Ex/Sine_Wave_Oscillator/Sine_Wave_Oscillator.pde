import processing.sound.*;
SinOsc sine; //change this to SqeOsc

void setup() {
  size(640, 360);
  background(255);
    
  // Create the sine oscillator.
  sine = new SinOsc(this);//can change this to SqrOsc
  sine.play();
}

void draw() {
  //the image is just for informative purposes
  //on how the soundwave looks
  sine.amp((float)mouseY/height);
  sine.freq((float)mouseX);
}
