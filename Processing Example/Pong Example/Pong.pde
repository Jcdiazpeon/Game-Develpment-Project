PVector scores = new PVector();
boolean isRightPlayerTurn = true; //Is the right player's turn
ArrayList<Puck> pucks = new ArrayList<Puck>();
boolean[] leftKeys; 
boolean[] rightKeys;
Puck puck;
Bar leftBar;
Bar rightBar;
int bounces = 0;
int counter = 0;


void setup(){
  fullScreen();
  frameRate(60);
  pucks.add(new Puck(1));
  leftBar = new Bar();
  rightBar = new Bar("Right");
  leftKeys = new boolean[2]; //Keys 0 & 1 == Up & Down
  rightKeys = new boolean[2];
  leftKeys[0] = false;
  leftKeys[1] = false;
  rightKeys[0] = false;
  rightKeys[1] = false;
}

void draw(){
  showBoard();
  
  for(Puck temp : pucks){
    temp.show();
    temp.update();
  }
  
  
  leftBar.show();
  rightBar.show();
  leftBar.update();
  rightBar.update();
  
  //if(bounces == 5 && counter == 0){
  //  pucks.add(new Puck(2));
  //  counter++;
  //}
}

void showBoard(){
  background(0);
  
  stroke(255);
  fill(255);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  line(0, 0, 0, height);
  line(0, 0, width, 0);
  line(width, 0, width, height);
  line(0, height, width, height);
  
  textSize(50);
  text(floor(scores.x), 100, 100);
  text(floor(scores.y), width - 100, 100);
}

void keyPressed(){
  if(key == 'w' || key == 'W')
    leftKeys[0] = true;
  else{
    if(key == 's' || key == 'S')
      leftKeys[1] = true;
  }
  
  if(key == CODED){
    if(keyCode == UP)
      rightKeys[0] = true;
    else{
      if(keyCode == DOWN)
        rightKeys[1] = true;
    }
  }
}

void keyReleased(){
  if(key == 'w' || key == 'W')
    leftKeys[0] = false;
  else{
    if(key == 's' || key == 'S')
      leftKeys[1] = false;
  }
  
  if(key == CODED){
    if(keyCode == UP)
      rightKeys[0] = false;
    else{
      if(keyCode == DOWN)
        rightKeys[1] = false;
    }
  }
} 
