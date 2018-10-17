class Ship{
  PShape body, triangle, tail, line1, line2; //shape of the ship (triangle)
  PVector location = new PVector (width/2, height/2);
  PVector force;
  PVector vel = new PVector(0,0);
  color c;
  float angle = -90;
  int player, w = 20, h = 35;
  float[][] coordinates = new float[4][2];
  float[][] newCoordinates = new float[4][2];
  float[][] locations = new float[w][h];
  
  Ship(int num){
    makeShape();
    player = num;
    location.x += (player * 100);
  }
  
  void show(){
    //draws ship and rotates
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle + 90));
    shape(body, 0 ,0);
    popMatrix();
  }
  
  void update(){
    move();
    shoot();
    keepInScreen();
    checkCollision();
    
    location.add(vel);
    vel.mult(.94);
    
    //calculateCoordinates();
    //calculateLocations();
  }
  
  void move(){
    if(player == 1){
      if(leftKeys[0]){ //moves ship forward
          force = PVector.fromAngle(radians(angle));
          force.mult(1.5); //force applied
          vel.add(force); //force added to velocity
       }
      if(leftKeys[1]) // rotates left
        angle -= 10;
        
      if(leftKeys[2]) // rotates right
        angle += 10;
    }
    if(player == 2){
      if(rightKeys[0]){ //moves ship forward
          force = PVector.fromAngle(radians(angle));
          force.mult(1.5); //force applied
          vel.add(force); //force added to velocity
       }
      if(rightKeys[1]) // rotates left
        angle -= 10;
        
      if(rightKeys[2]) // rotates right
        angle += 10;
    }
  }
  
  void keepInScreen(){
    if(location.x > width)
      location.x = 0;
      
    if(location.x < 0)
      location.x = width;
      
    if(location.y > height)
      location.y = 0;
      
    if(location.y < 0)
      location.y = height;
  }
  
  void shoot(){
    if(player == 1){
      if(leftKeys[3])
        bullets.add(new Bullet(location.x, location.y, angle));
    }
    if(player == 2){
      if(rightKeys[3])
        bullets.add(new Bullet(location.x, location.y, angle));
    }
  }
  
  void checkCollision(){
    for(Block temp: blocksInScreen){
      if(this.location.x >= temp.location.x && this.location.x <= temp.location.x + temp.w){
        if(this.location.y >= temp.location.y && this.location.y <= temp.location.y + temp.h){
          gameOver = true;
          loser = player;
        }
      }
    }
  }
  
  void calculateCoordinates(){    
    coordinates[0][0] = (location.x - w/2) - location.x;
    coordinates[0][1] = location.y - location.y;
    
    coordinates[1][0] = (location.x + w/2) - location.x;
    coordinates[1][1] = location.y - location.y;
    
    coordinates[2][0] = (location.x + w/2) - location.x;
    coordinates[2][1] = (location.y + h) - location.y;
    
    coordinates[3][0] = (location.x - w/2) - location.x;
    coordinates[3][1] = (location.y + h) - location.y;
    
    
    newCoordinates[0][0] = (coordinates[0][0])*(cos(radians(angle+90))) - (coordinates[0][1])*(sin(radians(angle+90)));
    newCoordinates[0][1] = (coordinates[0][1])*(cos(radians(angle+90))) + (coordinates[0][0])*(sin(radians(angle+90)));
    
    newCoordinates[1][0] = (coordinates[1][0])*(cos(radians(angle+90))) - (coordinates[1][1])*(sin(radians(angle+90)));
    newCoordinates[1][1] = (coordinates[1][1])*(cos(radians(angle+90))) + (coordinates[1][0])*(sin(radians(angle+90)));
    
    newCoordinates[2][0] = (coordinates[2][0])*(cos(radians(angle+90))) - (coordinates[2][1])*(sin(radians(angle+90)));
    newCoordinates[2][1] = (coordinates[2][1])*(cos(radians(angle+90))) + (coordinates[2][0])*(sin(radians(angle+90)));
    
    newCoordinates[3][0] = (coordinates[3][0])*(cos(radians(angle+90))) - (coordinates[3][1])*(sin(radians(angle+90)));
    newCoordinates[3][1] = (coordinates[3][1])*(cos(radians(angle+90))) + (coordinates[3][0])*(sin(radians(angle+90)));
    
    
    newCoordinates[0][0] += location.x;
    newCoordinates[0][1] += location.y;

    newCoordinates[1][0] += location.x;
    newCoordinates[1][1] += location.y;
    
    newCoordinates[2][0] += location.x;
    newCoordinates[2][1] += location.y;
    
    newCoordinates[3][0] += location.x;
    newCoordinates[3][1] += location.y;
     
    //quad(newCoordinates[0][0], newCoordinates[0][1], newCoordinates[1][0], newCoordinates[1][1], newCoordinates[2][0], newCoordinates[2][1], newCoordinates[3][0], newCoordinates[3][1]);
  }
  
  void calculateLocations(){
    for(int i = 0; i < w; i++){
      for(int j = 0; j < h; j++){
        locations[i][0] = newCoordinates[1][0] + i;
        locations[0][j] = newCoordinates[0][1] + j;
        println(locations[i][j]);
      }
    }       
  }
  
  void makeShape(){
    shapeMode(CENTER);
    body = createShape(GROUP);
    
    //Creates the ship
    //                               x1 y1  x2  y2  x3  y3
    triangle = createShape(TRIANGLE, 0, 0, -10, 35, 10, 35);
    triangle.setFill(c);
    triangle.setStroke(255);
    
    line1 = createShape(LINE,  0, 0, -2, 35);
    line1.setFill(c);
    line1.setStroke(255);
    
    line2 = createShape(LINE,  0, 0, 2, 35);
    line2.setFill(c);
    line2.setStroke(255);
    
    tail = createShape(TRIANGLE, -2, 35, 2, 35, 0, 40);
    tail.setFill(c);
    tail.setStroke(255);
    
    body.addChild(triangle);
    body.addChild(line1);
    body.addChild(line2);
    body.addChild(tail);
    
    body.setFill(255);
    body.setStroke(255);
  }
 }
