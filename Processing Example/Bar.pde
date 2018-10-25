class Bar{
  int x, y;
  boolean isRight;
  int speed = 17;
  PImage bar = loadImage("bar.png");
  
  Bar(){ //Left Bar
    x = 50;
    y = height/2;
    isRight = false;
  }
  
  Bar(String s){ //right bar
    x = width - 75;
    y = height/2;
    
    if(s == "Right" || s == "right")
      isRight = true;
    else
      isRight = false;
  }
  
  void show(){
   //rect(x, y, 40, 200); 
   bar.resize(40, 200);
   imageMode(CORNER);
   image(bar, x, y);
  }
  
  void update(){
    keepInScreen();  
    move();
  }
  
  void move(){
    if(isRight){
      if(rightKeys[0])
        y -= speed;
      
      if(rightKeys[1])
        y += speed;
    }
    else{
      if(leftKeys[0])
        y -= speed;
      
      if(leftKeys[1])
        y += speed;
    }     
  }
  
  void keepInScreen(){
    if(y < 0)
      y =0;
      
    if(y > height - 200)
      y = height - 200;
  }
}
  
