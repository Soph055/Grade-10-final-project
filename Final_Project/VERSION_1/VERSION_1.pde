

allButton button1, button2, button3, button4, button5, button6, button7, button8, button9 ; //button class variables

PFont font; //allows me to set a font

PImage prisonCell, hallway, hallway2, cafeteria, doors, man, wallBlood, bloodHand, bloodHands, freedom, arrest; //images 
String gameState;


//pisoner variables
int prisonerX;
int prisonerY;
int prisonerW;
int prisonerH;

//player character x
float manX;

//counter to time text
float counter = 0;

//objects 
boolean money = false;
boolean tranquilizer = false;

boolean friend = false;



void setup() {
  size(600, 700);

  //loads font
  font = loadFont("Chiller-Regular-48.vlw");

  //allows me to make new buttons with diff x and y coords using button class
  button1 = new allButton(100, 250);
  button2 = new allButton (10, 350);
  button3 = new allButton (200, 350);
  button4 = new allButton (310, 380);
  button5 = new allButton (460, 380);
  button6 = new allButton (240, 340);
  button7 = new allButton (390, 340);
  button8 = new allButton(95, 235);
  button9 = new allButton(385, 235);
  //gameState ="startScreen";
  gameState ="doorsFriend";

  //images (game screens + other images)
  prisonCell = loadImage ("Scene_1.png");
  hallway = loadImage ("Scene_2.png");
  hallway2 = loadImage("Scene2.5.png");
  cafeteria = loadImage("Scene_3.png");
  doors = loadImage("Scene_4.png");
  man = loadImage("man.png");
  wallBlood = loadImage("blood_drip.png");
  bloodHand = loadImage("blood_hand.png");
  bloodHands = loadImage("blood_hands.png");
  freedom = loadImage("freedom.jpg");
  arrest = loadImage("arrested.jpg");


  //setting values for prisoner coords
  prisonerX = 14;
  prisonerY = 12;
  prisonerW = 14;
  prisonerH = 12;

  //player starting x coord
  manX = 300;
}


void draw() {
  println (mouseX +"," + mouseY);

  textFont(font, 40);

  if (gameState == "prisonCell") { //scene 1
    prisonCell();
  } else if (gameState == "hallway") { //scene 2 
    hallway();
  } else if (gameState =="cafeteria") {// scene 3
    cafeteria();
  } else if (gameState == "noItem") { //concequence of choosing item that you don't have in scene 3
    noItem();
  } else if (gameState =="tranq") {  //when player picks tranquilizer in hallways and picks "tranq him" in scene 3
    tranq();
  } else if (gameState == "hallway2") { // scene 4 (after player moves past from cafeteria)
    hallway2();
  } else if ( gameState =="doorsFriend") { //almost final scene (if player decided to tell other pirsoner about escape plans
    doorsFriend();//not finished
  } else if (gameState == "doors") { // final scene
    doors();
  } else if (gameState == "escape"){ //escape scene final scene
    escape();
  } else if (gameState == "arrest"){// arrest scene final scene
   arrest();
  }
}

//scene 1 of game - PRISONCELL
void prisonCell() { //displays images needed in scene, sets paramater for charachter (creates everything that needs to happen in this scene)

  image(prisonCell, 0, 0);  //prison drawing
  image(man, manX, 300);   // character image
  if (manX <= 110) {    // if certain distance to door, button to open door will appear
    button1.one(); //makes button
    fill(0);//black
    textSize(50);
    text("Open", 130, 280);//text on button
  } else if (manX >= 300) { //if near 300(where wall is) man will be blocked
    manX = 300;
  }
}

//scene 2 of game - HALLWAY
void hallway() { // displays image, creates paramters/choices. (does everything needed in scene to continue game)
  image(hallway, 0, 0);
  image(man, manX, 400); // displays character image 

  if (manX <= 215) { //displays item choices above chest when player is close
    //displays button and text
    button2.one();
    fill(0);
    text("money", 40, 375);
    button3.one();
    fill(0);
    text("tranquilizer", 202, 375);
  } else if (manX >= 515) {//character unable to go left of door
    manX = 515;
  } else if (manX <= 490) { //displays text about chest as player gets closer
    fill(137, 0, 0);
    textSize(60);
    text("you have found a lucky chest", 100, 250);
    if (manX <= 390) {
      textSize(50);
      text("open it, and choose wisely", 2, 320);
    }
  }
}
//scene 3 of game - CAFETERIA
void cafeteria() { //displays image, creates paramters/choices. (does everything needed in scene to continue game)
  counter = counter +1; //starts counter
  image(cafeteria, 0, 0);
  image(man, manX, 420);
  evilMan();

  if (counter < 150) { //text  displays untill certain time
    textSize(30);
    fill(255);
    text("Hey PUNK this is my turf", 300, 390); 
    text("either you get lost", 300, 415); 
    text("or i will beat you up", 300, 440);
  } else if (counter < 350) { //certian time passes, new text appears
    textSize(20);
    fill(#FF1C1C);
    text(" oh no, I must go through", 80, 420);
  } else if (counter < 550) {//certian time passes, new text appears
    textSize(20);
    fill(#FF1C1C);
    text("maybe I should use the item from the chest", 90, 400);
    text("lets approach him slowly", 90, 430);
  }
  if (manX >= 270) { //when close to prisoner, choices appear
    button4.one();
    fill(0);
    text("tranq him", 320, 410);
    button5.one();
    fill(0);
    text("bribe him", 485, 410);
  } else if (manX <=3) { //does not let player move out of screen towards left
    manX = 3;
  }
}

void noItem() {// scene occurs when player approaches prisoner and picks the item they do not have

  counter = counter +1;//increases counter
  background(0);// background turn black
  restartButton();
  for ( int i = -105; i <= 600; i += 300) { //displays blood on top of screen
    image(wallBlood, i, -60);
  }

  if (counter < 250) {//text displays for certain time
    fill(255);
    textSize(60);
    text("Uh Oh", 250, 270);
    textSize(40);
    text("you tried using an item you dont have on the prisoner", 10, 330);
  } else if (counter < 550) {
    fill(255);
    textSize(40);
    text("he became angry and beat you up", 120, 350);
    text("injuries were fatal", 210, 430);
  } else if ( counter < 1050) {
    fill(255, counter/3, counter/3);
    textSize(80);
    text("YOU HAVE DIED", 100, 300);
    image(bloodHands, 300, 300);
  }
}

void tranq () { // if players decided to tranquilize prisoner 
  counter = counter +1;//increases counter
  background(0);// background turn black
  restartButton();

  if (counter < 250) {//text displays for certain time
    fill(255);
    textSize(60);
    text("Uh Oh", 250, 270);
    textSize(40);
    text("the prisoner passed out after you tranquilized him", 10, 330);
  } else if (counter < 550) {
    fill(255);
    textSize(40);
    text("The gaurd saw you do this", 100, 350);
    text("you have been cuffed and locked in your cell", 80, 430);
  } else if ( counter < 1050) {
    fill(100, counter/2, counter/2);
    textSize(60);
    text("YOU HAVE BEEN DETAINED", 20, 300);
  }
}

void hallway2 () { // scene 4 - displays images, text, makes choices and continues story line of the game
  counter = counter +1;//increases counter
  image(hallway2, 0, 0);
  image(man, manX, 400);

  if (counter < 250) {
    fill(255, 0, 0);
    textSize(30);
    text("Hey, I know you tryna escape", 340, 335);
    text("bring me along bro", 350, 375);
  }

  if (manX < 5) { //prevents player to move off screen towards the left
    manX = 5;
  } else if (manX > 150) { // when player is a certain distance from other prisoner (choices and buttons show)
    button6.one();
    textSize(30);
    fill(0);
    text("bring him", 272, 370);
    button7.one();
    textSize(20);
    fill(0);
    text("pretend you don't know", 395, 350);
    text("what he's talking about", 395, 375);
  }
}
void doorsFriend() { //scene 4.5 if player picks to bring prisoner along
  counter = counter +1;//increases counter
  background(0);// background turn black
  restartButton();

  if (counter < 250) {//text displays for certain time
    fill(255);
    textSize(60);
    text("Uh Oh", 250, 270);
    textSize(40);
    text("the prisoner was an undercover cop", 110, 330);
  } else if (counter < 550) {
    fill(255);
    textSize(60);
    text("your plans have been exposed", 70, 350);
  } else if ( counter < 1050) {
    fill(200, counter/3, counter/3);
    textSize(60);
    text("YOU HAVE BEEN ARRESTED", 40, 300);
  }
}

void doors() { //final Scene, displays images, makes choices
  image(doors, 0, 0);
  image(man, manX, 400);

  if (manX < 10) {
    manX = 10;
  } else if (manX > 270) {

    textSize(30);
    button8.one();
    fill(0);
    text("Door 1", 130, 260);
    button9.one();
    fill(0);
    text("Door 2", 425, 260);
  }
}
void escape(){
 image(freedom,0,0);
  fill(11, 80, 175);
  textSize(45);
  text("you have escaped", 300, 450);
  text("and reached civilization",280, 525);
  textSize(45);
  text("thankyou for playing Escape The Prison",30, 600);
}

void arrest(){
  background(#AF0B1E);
  image(arrest,-100,0);
  fill(#AF0B1E);
  textSize(60);
  text("cops were waiting outside", 100, 250);
  text("you have been arrested", 110, 350);
  restartButton();
  
}
void evilMan() { //draws a stick man
  rectMode(CENTER);
  ellipseMode(CENTER);

  line(prisonerX*29, prisonerY*49, prisonerW*29, prisonerH*55);//leg
  line(prisonerX*31, prisonerY*49, prisonerW*31, prisonerH*55);//leg
  line(prisonerX*29, prisonerY*44, prisonerW*24, prisonerH*47);//arm
  line(prisonerX*31, prisonerY*44, prisonerW*35, prisonerH*47);//arm
  fill(#FA8D26);//orange colour
  rect(prisonerX*30, prisonerY*46, prisonerW*4, prisonerH*7);//body
  fill(#E3C579);//skin colour
  ellipse(prisonerX*30, prisonerY*40, prisonerW*6, prisonerH*6);//head
  fill(0);//black 
  ellipse(prisonerX*29, prisonerY*39, prisonerW, prisonerH);//eyes
  ellipse(prisonerX*31, prisonerY*39, prisonerW, prisonerH);//eyes
  ellipse(prisonerX*30, prisonerY*41.5, prisonerW*2, prisonerH*.8);
}

void restartButton() { // creates restart button 
  rectMode((CORNER));
  fill(160, 11, 11);
  rect(55, 550, 490, 100);
  fill(255);
  textSize(80);
  text("Restart", 200, 620);
}


void keyPressed() { //allows player to move
  if (keyPressed) {//when a certain key is pressed..
    if (keyCode == LEFT) {//left will make man move left
      manX = manX - 3.5;
    } else if (keyCode == RIGHT) {//right will make man move right
      manX = manX + 3.5;
    }
  }
}



void mousePressed() {
  //button1.one (open door) - prison cell scene
  if (gameState == "prisonCell") {
    if (mouseX >100 && mouseX < 230) {
      if (mouseY >250 && mouseY <290) {
        gameState = "hallway"; //second scene game state
        manX = 535;
      }
    }
  }
  //button2.one (money option) - hallway scene
  if (gameState == "hallway") {
    if (mouseX > 10 && mouseX < 140) {
      if (mouseY > 350 && mouseY < 390) {
        money = true;
        gameState = "cafeteria";
        manX = 10;
      }
    }
    //button3.one (tranquilizer option)
    if (mouseX > 200 && mouseX < 330) {
      if (mouseY > 350 && mouseY < 390) {
        tranquilizer = true;
        gameState ="cafeteria";
        manX = 10;
      }
    }
  }
  //button4.one and button5.one (tranq him option)
  if (gameState == "cafeteria") { 
    if (tranquilizer == true && money == false) { //if tranquilizer was selected in cafeteria scene and in hallway scene
      if (mouseX > 310 && mouseX < 440) {
        if (mouseY > 380 && mouseY <420) {
          gameState = "tranq";
          counter = 0;
          ;
        }
      }
      if (mouseX > 460 && mouseX < 590) { // if bribe him was selected in cafeteria scene but tranquilizer was selected in hallway scene
        if (mouseY > 380 && mouseY < 420) {
          gameState = "noItem";
          counter = 0;
        }
      }
    }

    //button4.one and button5.one (bribe him option)
    else  if (tranquilizer == false && money == true) { //if tranquilizer was not picked in hallways scene and pressed during cafeteria scene
      if (mouseX > 310 && mouseX < 440) {
        if (mouseY > 380 && mouseY <420) {
          gameState = "noItem";
          counter = 0;
        }
      } 

      if (mouseX > 460 && mouseX < 590) { // when money is selected in hallway and cafeteria (correct choice to continue story)
        if (mouseY > 380 && mouseY < 420) {
          gameState = "hallway2"; //moves on player to next scene
          manX = 10;
          friend = false;
          counter = 0;
        }
      }
    }
  } //button6.one and button 7.one  - hallway2 scene
  if (gameState == "hallway2") { //if bring him picked
    if (mouseX > 240 && mouseX < 370) {
      if (mouseY > 350 && mouseY < 380) {
        gameState = "doorsFriend";
        friend = true;
        manX = 10;
      }
    } else if (mouseX > 390 && mouseX < 520) { //if "pretend to not know" picked
      if (mouseY > 350 && mouseY < 380) {
        gameState = "doors";
        friend = false;
        manX = 10;
      }
    }
  }//button8.one and button9.one - final scene "doors"
  if (gameState == "doors") { //if player picks door 1
    if (mouseX > 95 && mouseX < 225) {
      if (mouseY > 235 && mouseY < 275) {
        gameState = "escape";
      }
    } else if (mouseX > 385 && mouseX < 515) { //if player picks door 2
      if (mouseY > 235 && mouseY < 275) {
        gameState = "arrest";
      }
    }
  }

  if (gameState == "noItem" || gameState == "tranq" || gameState == "arrest") { // for restart button
    if (mouseX > 55 && mouseX < 545) {
      if (mouseY > 550 && mouseY < 650) {
        //gameState = "startScreen"; change this to when start screen is made
        gameState = "prisonCell";
        manX = 300;//resets veriables whenever game is restarted
        counter = 0;
        money = false;
        tranquilizer = false;
        friend = false;
      }
    }
  }
}
