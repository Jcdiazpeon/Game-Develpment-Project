 class Block{
  //PVector location= new PVector(random(width*10)+width, random(-100, height));
  PVector location= new PVector(random(width), random( height * 100) + height);  //sets random locations for blocks
  color c = color(random(255), random(255), random(255)); //sets random color
  int w = 100;
  int h = floor(random(200, 350));
  int index;
  boolean inScreen = false;
  
  Block(int i){
    index = i;
  }
  
  void show(){ //draws rects on screen
    shapeMode(CORNER);
    fill(c);
    rect(location.x, location.y, w, h);
  }
  
  void update(){
    move();
    checkInScreen();
    checkOutOfScreen();
  }
  
  void move(){
    //location.x -= 6;
    location.y -= 7;
  }
  
  void checkInScreen(){
    if(!inScreen){
      if((location.y + h >= 0 && location.y <= height)){
        blocksInScreen.add(blockList.get(index));
        inScreen = true;
      }
    }
  }
  
  void checkOutOfScreen(){
    if(inScreen){
      if(location.y + h < 0 || location.y > height){
        blocksInScreen.remove(0);
        inScreen = false;
        score++;
      }
    }
  }
}
