class Bullet{
  PVector location;
  PVector vel;
  float angle;
  int d = 5;
  boolean collided = false;
  
  Bullet(float x, float y, float a){
    location = new PVector(x, y);
    angle = a;
    vel = PVector.fromAngle(radians(angle));
    vel.mult(15);
  }
  
  void show(){
    if(!collided){
      fill(255);
      ellipse(location.x, location.y, d, d);
    }
  }
  
  void update(){
    if(!collided){
      location.add(vel); //Moves bullets
      //checkCollisionWithShip();
      checkCollisionWithBlocks();
    }
  }
  
  void checkCollisionWithShip(){
    for(Ship temp: ships){
      for(int i = 0; i < temp.w; i++){
        for(int j = 0; j < temp.h; j++){
          if(this.location.x == temp.locations[i][0] && this.location.y == temp.locations[0][j]){
            gameOver = true;
            collided = true;
            loser = temp.player;
          }
        }
      }
    }
  }
  
  void checkCollisionWithBlocks(){
    for(Block temp: blocksInScreen){
      if(this.location.x > temp.location.x && this.location.x < temp.location.x + temp.w){
        if(this.location.y > temp.location.y && this.location.y < temp.location.y + temp.h)
          collided = true;
      }
    }
  }
}
