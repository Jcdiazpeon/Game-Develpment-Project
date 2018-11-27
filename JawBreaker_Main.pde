JawBreaker character = new JawBreaker(0, 0); //Creates object 

void setup(){
  fullScreen();
  //size(600, 600)  //You can also set the size manually
  frameRate(60); //(optional)
}

void draw(){
  background(0); //draws a new background every frame to avoid duplicates
  
  character.show();
  character.move();
}
