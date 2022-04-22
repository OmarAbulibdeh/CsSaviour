// Your cotrolling an Avatar and your goal is to avoid the falling "acid rain" as long as you can
// Try not to get burnt :)
//And Have Fun
// Made by Omar Abulibdeh
// Inspiration from the electron and chain programs from class.

//Variables 
int playerXCor = 600;  // cordiantes of the players avatar
int playerYCor = 590;
int playerWidth = 55;  // width and height of the players avatar
int playerHeight = 55;
int difficulty = 10;  //the higher the diffucluty the more rain drops of acid falls
int limit = 10;
float score = 0;
String message = "Please, Do Try Again If You Had Fun :) ";
boolean isCollided = false; // detects the collison between the raindrops and the player
boolean lost = true;
Rain[] Rain;


void acidRain(int xMin, int xMax, int yMin, int yMax, int num){
  Rain = new Rain[num];
 
  for(int i = 0; i < Rain.length; i++){  // for loops for the rainfall
     int x = (int)random(xMin, xMax);
     int y = (int)random(yMin, yMax);
     Rain[i] = new Rain(x, y, 30, 15);
  }
}
void setup(){
  size(1280,720);
  acidRain(-100, width + 20, -250, -80, difficulty);  // spawning in the raindrops

  
}

void draw(){
 background(150); 
   drawPlayer();
  
  if(!isCollided){      // if the colliosn happens then:
    moveRain();
    if(score > limit && score < limit + 1){
      acidRain(-100, width + 20, -260, -80, difficulty); difficulty += 10; limit += 20;
    }
  }
 else{
   text("Your Final Score Was: "+(int)score,400, 360);
   println(message);
   noLoop();
 }

  
}

void moveRain(){
      for(int i = 0; i < Rain.length; i++){  // where the next group of acid rain will be summoned
        if(Rain[i].yCor > height){
           Rain[i].yCor = -10;
        }
        Rain[i].display();
        Rain[i].drop(random(1, 20));
      
      // detecting if the colliosn of the player happened with the acid rain
        boolean conditionXLeft = Rain[i].xCor + Rain[i].w >= playerXCor;
        boolean conditionXRight = Rain[i].xCor + Rain[i].w <= playerXCor + playerWidth + 4;
        boolean conditionUp =  Rain[i].yCor >= playerYCor;
        boolean conditionDown = Rain[i].yCor + Rain[i].h <= playerYCor + playerHeight;
      
        if(conditionXLeft && conditionXRight && conditionUp && conditionDown){
             isCollided = true;
        }
  
      }
     
    score += 0.1;

    fill(255);
    text("Score: "+(int)score, 10, 40);
    textSize(30);
}


// Players Avatar
void drawPlayer(){
  stroke(0);
  strokeWeight(2);
  fill(100, 50, 150);
  rect(playerXCor, playerYCor, playerWidth, playerHeight, 7);
}



// Allows player to control the avatar with cursor (learned in class... read notes to finish)
void mouseDragged(){
  if(mouseX >= 0 && mouseX <= width - playerWidth + 1){
    playerXCor = mouseX;
  }
  if(mouseY >= 0 && mouseY <= height - playerHeight){
    playerYCor = mouseY;
  }

}
 
