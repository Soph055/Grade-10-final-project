//ps I did not do a moving background as I realized the way i drew my background, 
//it would not make sense for backgrounds to scroll
String gameState;
PImage prisonCell, hallway, hallway2, cafeteria, doors, man;

float prisonerX;
float prisonerY;
float prisonerW;
float prisonerH;

float manX;

void setup() {
  size(600, 700);
  //gameState ="startScreen";
  gameState ="prisonCell";

  //images (game screens)
  prisonCell = loadImage ("Scene_1.png");
  hallway = loadImage ("Scene_2.png");
  hallway2 = loadImage("Scene2.5.png");
  cafeteria = loadImage("Scene_3.png");
  doors = loadImage("Scene_4.png");
  man = loadImage("man.png");

  prisonerX = 10;
  prisonerY = 10;
  prisonerW = 10;
  prisonerH = 10;
  
  manX = 300;
}


void draw() {
  println (mouseX +"," + mouseY);
  if (gameState == "prisonCell") {
    image(prisonCell, 0, 0);
    image(man, manX,300);
    if (manX >= 300){
      manX = 300;
    }
  }
}


  void keyPressed() {
    if (keyPressed) {
      if (keyCode == LEFT) {
      manX = manX - 1.5;
      }
      else if(keyCode == RIGHT){
        manX = manX + 1.5;
      }
    }
  }
  
  
   void stickMan() {
    rectMode(CENTER);
    ellipseMode(CENTER);

    line(prisonerX*29, prisonerY*49, prisonerW*29, prisonerH*55);//leg
    line(prisonerX*31, prisonerY*49, prisonerW*31, prisonerH*55);//leg
    line(prisonerX*29, prisonerY*44, prisonerW*24, prisonerH*44);//arm
    line(prisonerX*31, prisonerY*44, prisonerW*35, prisonerH*44);//arm
    fill(#FA8D26);//orange colour
    rect(prisonerX*30, prisonerY*46, prisonerW*4, prisonerH*7);//body
    fill(#E3C579);//skin colour
    ellipse(prisonerX*30, prisonerY*40, prisonerW*6, prisonerH*6);//head
    fill(0);//black 
    ellipse(prisonerX*29, prisonerY*39, prisonerW, prisonerH);//eyes
    ellipse(prisonerX*31, prisonerY*39, prisonerW, prisonerH);//eyes
    ellipse(prisonerX*30, prisonerY*41.5, prisonerW*2, prisonerH*.8);
  }
