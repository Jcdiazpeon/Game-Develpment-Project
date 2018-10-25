class Puck{
  PVector location = new PVector(width/2, height/2);
  PVector vel = new PVector(10,0);
  PVector force;
  int r = 25;
  int angle = 0;
  int type;
  color c = (255);
  
  Puck(int n){
    type = n;
    
    if(type == 2){
      c = color(255, 0, 0);
      vel.x = 30;
    }
  }
 
  void show(){
    strokeWeight(0);
    fill(c);
    
    ellipseMode(CENTER);
    ellipse(location.x, location.y, r*2, r*2);
  }
  
  void update(){
    offScreen();
    hitBar();
    move();
  }
  
  void move(){
    force = PVector.fromAngle(radians(angle));
    force = (vel.x > 0) ? force : force.mult(-1);
    force.add(vel);
    location.add(force);
    vel.x = constrain(vel.x, -35, 35);
  }
  
  void offScreen(){
    //right Side
    if(location.x + r >= width){
      scores.x++;
      reset();
    }
      
    //left Side
    if(location.x <= 0){
      scores.y++;
      reset();
    }
    
    //Top
    if(location.y < 0)
      vel.y *= -1;
      
    //Bottom
    if(location.y + r > height)
      vel.y *= -1;
  }
  
  void hitBar(){
    //rihgt bar
    if(location.x >= rightBar.x && location.x <= rightBar.x + 40){
      if(location.y >= rightBar.y && location.y <= rightBar.y + 200){        
        vel.x = (vel.x >= 0) ? vel.x +1.5 : vel.x -1.5; //increments the speed        
        vel.y = floor(random(-10, 10));            //sets random y direction        
        vel.mult(-1);                             //flips the orientation of puck
        isRightPlayerTurn = !isRightPlayerTurn;  //changes the player's turn
        bounces++;                              //increments the bounces
      }
    }
    //left Bar
    if(location.x <= leftBar.x + 40 && location.x >= leftBar.x){
      if(location.y >= leftBar.y && location.y <= leftBar.y + 200){
        vel.x = (vel.x >= 0) ? vel.x +1.5 : vel.x -1.5;
        vel.y = floor(random(-10, 10));
        vel.mult(-1);
        isRightPlayerTurn = !isRightPlayerTurn;
        bounces++;
      }
    }
  }
  
  void reset(){
    location.x = width/2;
    location.y = height/2;
    vel.x = 10;
    vel.y = 0;
    isRightPlayerTurn = true;
  }
}
