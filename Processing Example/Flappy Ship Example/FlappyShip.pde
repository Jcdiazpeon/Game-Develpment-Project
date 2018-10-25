//This is the main file that runs the game

Ship player1;
Ship player2;
ArrayList<Block> blockList = new ArrayList<Block>();
ArrayList<Ship> ships = new ArrayList<Ship>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Block> blocksInScreen = new ArrayList<Block>();
boolean gameOver = false;
boolean leftKeys[];
boolean rightKeys[];
int score = 0, loser;
int numOfBlocks = 1000;

void setup(){
  frameRate(30);
  //size(1200, 800);
  fullScreen();
  player1 = new Ship(1);
  player2 = new Ship(2);
  ships.add(player1);
  ships.add(player2);
  leftKeys = new boolean[4];
  rightKeys = new boolean[4];
  
  for(int i = 0; i < numOfBlocks; i++){ //Creates all the blocks
    blockList.add(new Block(i));
  }
}

void draw(){
  if(!gameOver){
    background(0);
    
    for(Ship temp: ships){ //Updates the Ships
      temp.update();
      temp.show();
    }
    
    for(Bullet temp: bullets){ //Udates bullets
      temp.update();
      temp.show();
    }
    
    for(Block temp : blockList){    //shows and updates all blocks
     temp.update();
     temp.show();
    }
    
    deleteBlocks(); //Deletes blocks outside of screen
  }
  else{ //If game ended
   background(0);
   textSize(64);
   textAlign(CENTER);
   text("Game Over!", width/2, height/2);
   text("Loser: Player " + loser, width/2, height/2+100);
  }
  textSize(32);
  text("Score: " + score, 100, 50);
  println("Blocks in Screen: " + blocksInScreen.size());
}

void keyPressed(){
  if(key == 'w' || key == 'W')//right Player
    leftKeys[0] = true;
  
  if(key == 'a' || key == 'A')
    leftKeys[1] = true;
      
  if(key == 'd' || key == 'D')
    leftKeys[2] = true;
    
  if(key == 's' || key == 'S')
    leftKeys[3] = true;
    
    
  if(key == 'i' || key == 'I')//Left Player
    rightKeys[0] = true;
  
  if(key == 'j' || key == 'J')
    rightKeys[1] = true;
      
  if(key == 'l' || key == 'L')
    rightKeys[2] = true;
    
  if(key == 'k' || key == 'K')
    rightKeys[3] = true;
  }


void keyReleased(){
  if(key == 'w' || key == 'W') //right Player
    leftKeys[0] = false;
  
  if(key == 'a' || key == 'A')
    leftKeys[1] = false;
    
  if(key == 'd' || key == 'D')
    leftKeys[2] = false;
  
  if(key == 's' || key == 'S')
    leftKeys[3] = false;
    
    
  if(key == 'i' || key == 'I')//Left Player
    rightKeys[0] = false;
  
  if(key == 'j' || key == 'J')
    rightKeys[1] = false;
      
  if(key == 'l' || key == 'L')
    rightKeys[2] = false;
    
  if(key == 'k' || key == 'K')
    rightKeys[3] = false;
}

void deleteBlocks(){
  for(Block temp: blockList){
    if(temp.location.y <= 0){
      //blockList.remove(temp);
      numOfBlocks--;
    }
  }
}
