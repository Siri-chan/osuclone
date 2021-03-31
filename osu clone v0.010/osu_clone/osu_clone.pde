/*import processing.sound.*;
 SoundFile song;*/
int circle = 0; //a counter for level generation.
int piece = 0; //a counter for level reading
String[] splashtext = {"better than ppy!", "Electric Boogaloo", "North Korea's Finest!", "please play the normal osu! please please please", "Buggiest Game of 2019!", "Buggiest Game of 2020!", "Buggiest Game of 2021!", "This game's most Recent Update is an April Fool's Joke", "\"Dream Luck!\"", "At least bootlegs steal code.", "Puts Pineapple on Pizza", "Circle Clicker!"}; //a list of the splash text options
int start; //used a couple of times in our broken timing system
boolean[] keys = {false, false, false}; //bool used when user is inputting
boolean die = false; //used to stop the game from load-looping
int index = 0; //used to split levels into individual coords
PrintWriter output; //used to write things to a file - only currently used in our default.level reset switch
String[] lines; //the string with all of the .level file (un-split)
int[] circlex = new int[21474836]; // the x coords for every possible circle
int[] circley = new int[21474836]; // the y coords for every possible circle
int cs = 75; //circle size variable
int clicked = 0; //counts level progress
String[] pieces; //the array that our level's coords go into before becoming ints
PImage cursor; //the image used as our horrible cursor
boolean loli = false; //menu open/closed
PImage bg; //map backgrounds
// boolean[] slider; currently unused (although you can probably guess what it's for)
String mapname = ""; //the string used in the menu asset where it has a live typing feed of the user's map selection
String mapplaying = "default.level"; //string storing the map that is currently being played
PImage menubg; //menu background
int timer; //used in note timing
int timer2; //also used in note timing
int hp = 10; //hp value (you can probably guess what this does)
boolean loli2 = true; //used to track failure
color pink = color(255, 192, 203); //osu!clone pink
void setup() {
  //song = new SoundFile(this, "Grey Beard Halt.mp3");
  size(800, 600); //sets forced window size
  background(128); // sets perfect grey background
  text("Loading", 50, 50, 750, 550);
  cursor = loadImage("osucursor.png"); //loads the image for the cursor
  //cursor(cursor); //sets the cursor, which isn't even aligned with the cursor properly
  surface.setTitle("osu!clone: " + splashtext[int(random(11))]); //sets the funny splash text !!
  /* !!IMPORTANT DEV NOTE!!
   The following lines being uncommented resets the default level */
  /*
  output = createWriter("default.level");
   output.print("300,200,444,222,200,300,600,400,599,100,291,429,200,200,200,488,488,292,725,13l,020,202,743,544,744,494,328,382,292,484,1000,1000");
   */
  start = millis(); //used in the timer system (surely we don't need to set it here kekw)
  menubg = loadImage("menu.jpg"); //loads the menu background
}
void draw() {
  timer = millis() - start - 4000; //millisecond timer
  timer2 = timer / 1000; // seconds timer
  if (!loli) { //if the menus are open
    if (loli2) { //checks for a player failure state
      background(menubg); //sets the background to the menu
      textAlign(CENTER, CENTER); //aligns text
      fill(255); //sets text color to white
      textSize(50); //sets text size (in pt i think)
      try {
        text(mapname, 400, 500); //attempts to draw the map title, if it can't; game doesn't crash
      }
      catch(Exception e) {
      }
      text(mapplaying, 400, 550); //draws the current set map to the screen
      fill(pink); //sets fill to play button colour
      textSize(100); 
      if (mouseX > 250 && mouseX < 550 && mouseY > 82.5 && mouseY < 467.5) { //draws the playbutton if the mouse is close enough to it
        ellipse(400, 275, 300, 385);
        fill(255);
        text("PLAY", 400, 275);
        if (mousePressed && mouseButton == LEFT) { //if the player clicks in the box around the play button
          start = millis();
          loli = true; // starts game
        }
      }
    } else { //failure screen
      background(50, 50, 255); //blue
      fill(0); //black text
      text("Failure. M to return to Menu", 50, 50, 750, 550);
    }
  }
  ///////////////////////////////////////////////////////////////
  /*
  AND NOW WE TRULY ENTER THE GAME BOYS AND GIRLS
   */
  //////////////////////////////////////////////////////////////
  if (loli) {
    textAlign(LEFT, BOTTOM); // changes text align (should probably make it uniform bruh)
    // SUPER COMPLEX 9000IQ GENIUSES ONLY MAP LOADING ALGORITHM
    try {
      lines = loadStrings(mapplaying); //loads a file
      if (index < lines.length) {
        pieces = split(lines[index], ','); // splits the file up
        if (die == false) {
          //song.play();
          cs = 75; // still hopeful we can implement cs changes one day
          try { //loads data from the file
            circlex[circle] = int(pieces[piece]);
            piece++;
            circley[circle] = int(pieces[piece]);
            piece++;
            circle++;
          } 
          catch(Exception e) { // until it finds nothing
            die=true;
          }
        }
      }
    }
    catch (Exception e) { //if the level doesn't exist
      println("Failed to load Level: Check Game Directory and Filename");
      Reset();
    }
    try { //tries to find a custom background
      bg = loadImage(mapplaying+".jpg");
    } 
    catch(Exception e) { //loads a default if it fails
      bg = loadImage("bg.jpg");
    }

    fill(pink); //prepares the circles
    textSize(25);
    try { //loads background
      background(bg);
    } 
    catch(Exception e) { //if it fails loads a default
      bg = loadImage("bg.jpg");
      background(bg);
    }
    if (hp <= 0) { //resets everything on failure
      loli2 = false;
      Reset(); //get ready to see this void a lot
    }
    if (clicked == 0) { //first circle has a special exception to the rest
      if (timer < ((clicked*1000) + 700) * 2) {
        hp = 10;
        ellipse(circlex[0], circley[0], cs, cs);
        fill(0);
        text(clicked+1, circlex[0]-10, circley[0]+10);
      }
      textSize(100);

      if (timer2 >= 0) { //if timer hasnt run out
        if (mouseX > circlex[0] - cs && mouseX < circlex[0] + cs && mouseY > circley[0] - cs && mouseY < circley[0] + cs) { //if mouse is in the range of circle
          if (keys[0] || keys[1]) { //clicks if z/x
            clicked++;
            if (hp < 15) { // if below max hp, gain hp
              hp++;
            }
          } else if (timer > ((clicked*1000) + 700) * 2) { //if you miss (this is basically impossible plz balance)
            hp-=2;
            clicked++;
          }
        } else if (timer > ((clicked*1000) + 700) * 2) { //this is also just missing, maybe move above if loops for 1 section
          hp-=2;
          clicked++;
        }
      } else { //draws timer
        text(timer2 *-1, 20, 100);
      }
    }
    if (clicked > 0) { //every other circle
      fill(255); //draws hp in white despite timer being black wtf
      text("hp:" + hp, 700, 50);
      fill(0);
      try { //attempts to load bits of level
        if (timer > (clicked *1000) + 700 && timer < ((clicked*1000) + 700) * 2) { //basically the same as before
          fill(pink);
          ellipse(circlex[clicked], circley[clicked], cs, cs);
          fill(0);
          text(clicked+1, circlex[clicked]-10, circley[clicked]+10);
          if (mouseX > circlex[clicked] - cs && mouseX < circlex[clicked] + cs && mouseY > circley[clicked] - cs && mouseY < circley[clicked] + cs) {
            if (keys[0]==true) {
              clicked++;
              if (hp < 15) {
                hp++;
              }
            }
          }
        } else if (timer > ((clicked*1000) + 700) * 2) {
          hp-=2;
          clicked++;
        }
      }
      catch (Exception e) {
        Reset();
      }
    }
  }
}

void keyPressed() {
  if (loli)
  { // if in game
    if (key == 'z' || key == 'Z') { //checks for clickies
      keys[0] = true;
    }
    if (key == 'x' || key == 'X') { 
      keys[1] = true;
    }
    if (keyCode == DOWN) { //screenshot
      keys[2] = true;
    }
  } else {
    if (keyCode == ENTER || keyCode == RETURN) { //sets level
      mapplaying = mapname+".level";
    } else {
      if (key == '0') { //resets the typing field
        mapname = "";
      } else {
        if ( key == BACKSPACE) { //backspaces the tyuping field
          if (mapname.length() > 0) {
            mapname = mapname.substring(0, max(0, mapname.length() - 1));
          }
        } else { //types a letter in the text field
          mapname = mapname+key;
        }
      }
    }
  }
}
void Reset() { //resets everything
  loli = false;
  mapname = "";
  die = false;
  cs = 75;
  index = 0;
  clicked = 0;
  circle = 0;
  piece = 0;
  hp = 10;
}
void keyReleased()
{ //check keyPressed() for info
  if (loli)
  {
    if (key == 'z' || key == 'Z') {
      keys[0] = false;
    }
    if (key == 'x' || key == 'X') {
      keys[1] = false;
    }

    if (key=='q' || key == 'Q') { //quits .exe
      exit();
    }

    if (key=='p' || key == 'P') { //opens editor
      OtherSketch otherSketch = new OtherSketch();
      runSketch(new String[]{"OtherSketch"}, otherSketch);
    }
  }
  if (key == 'm' || key == 'M') { //opens menu
    Reset();
    loli2=true;
  }
  if (keyCode == DOWN) {
    if (keys[2]==true) {
      saveFrame("screenshot-"+millis()+"-###.jpg");
    }
    keys[2]=false;
  }
}



/////////////////////////////////////////////////////////////////////////////
/*
                                               dddddddd                                                                                                                                                                                                                                                                                                
                                               d::::::d                                                                                                                     tttt         hhhhhhh                                      EEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDD      IIIIIIIIIITTTTTTTTTTTTTTTTTTTTTTT     OOOOOOOOO     RRRRRRRRRRRRRRRRR   
                                               d::::::d                                                                                                                  ttt:::t         h:::::h                                      E::::::::::::::::::::ED::::::::::::DDD   I::::::::IT:::::::::::::::::::::T   OO:::::::::OO   R::::::::::::::::R  
                                               d::::::d                                                                                                                  t:::::t         h:::::h                                      E::::::::::::::::::::ED:::::::::::::::DD I::::::::IT:::::::::::::::::::::T OO:::::::::::::OO R::::::RRRRRR:::::R 
                                               d:::::d                                                                                                                   t:::::t         h:::::h                                      EE::::::EEEEEEEEE::::EDDD:::::DDDDD:::::DII::::::IIT:::::TT:::::::TT:::::TO:::::::OOO:::::::ORR:::::R     R:::::R
  aaaaaaaaaaaaa  nnnn  nnnnnnnn        ddddddddd:::::d      nnnn  nnnnnnnn       ooooooooooo wwwwwww           wwwww           wwwwwww                             ttttttt:::::ttttttt    h::::h hhhhh           eeeeeeeeeeee           E:::::E       EEEEEE  D:::::D    D:::::D I::::I  TTTTTT  T:::::T  TTTTTTO::::::O   O::::::O  R::::R     R:::::R
  a::::::::::::a n:::nn::::::::nn    dd::::::::::::::d      n:::nn::::::::nn   oo:::::::::::oow:::::w         w:::::w         w:::::w                              t:::::::::::::::::t    h::::hh:::::hhh      ee::::::::::::ee         E:::::E               D:::::D     D:::::DI::::I          T:::::T        O:::::O     O:::::O  R::::R     R:::::R
  aaaaaaaaa:::::an::::::::::::::nn  d::::::::::::::::d      n::::::::::::::nn o:::::::::::::::ow:::::w       w:::::::w       w:::::w                               t:::::::::::::::::t    h::::::::::::::hh   e::::::eeeee:::::ee       E::::::EEEEEEEEEE     D:::::D     D:::::DI::::I          T:::::T        O:::::O     O:::::O  R::::RRRRRR:::::R 
           a::::ann:::::::::::::::nd:::::::ddddd:::::d      nn:::::::::::::::no:::::ooooo:::::o w:::::w     w:::::::::w     w:::::w                                tttttt:::::::tttttt    h:::::::hhh::::::h e::::::e     e:::::e       E:::::::::::::::E     D:::::D     D:::::DI::::I          T:::::T        O:::::O     O:::::O  R:::::::::::::RR  
    aaaaaaa:::::a  n:::::nnnn:::::nd::::::d    d:::::d        n:::::nnnn:::::no::::o     o::::o  w:::::w   w:::::w:::::w   w:::::w                                       t:::::t          h::::::h   h::::::he:::::::eeeee::::::e       E:::::::::::::::E     D:::::D     D:::::DI::::I          T:::::T        O:::::O     O:::::O  R::::RRRRRR:::::R 
  aa::::::::::::a  n::::n    n::::nd:::::d     d:::::d        n::::n    n::::no::::o     o::::o   w:::::w w:::::w w:::::w w:::::w                                        t:::::t          h:::::h     h:::::he:::::::::::::::::e        E::::::EEEEEEEEEE     D:::::D     D:::::DI::::I          T:::::T        O:::::O     O:::::O  R::::R     R:::::R
 a::::aaaa::::::a  n::::n    n::::nd:::::d     d:::::d        n::::n    n::::no::::o     o::::o    w:::::w:::::w   w:::::w:::::w                                         t:::::t          h:::::h     h:::::he::::::eeeeeeeeeee         E:::::E               D:::::D     D:::::DI::::I          T:::::T        O:::::O     O:::::O  R::::R     R:::::R
a::::a    a:::::a  n::::n    n::::nd:::::d     d:::::d        n::::n    n::::no::::o     o::::o     w:::::::::w     w:::::::::w                                          t:::::t    tttttth:::::h     h:::::he:::::::e                  E:::::E       EEEEEE  D:::::D    D:::::D I::::I          T:::::T        O::::::O   O::::::O  R::::R     R:::::R
a::::a    a:::::a  n::::n    n::::nd::::::ddddd::::::dd       n::::n    n::::no:::::ooooo:::::o      w:::::::w       w:::::::w                                           t::::::tttt:::::th:::::h     h:::::he::::::::e               EE::::::EEEEEEEE:::::EDDD:::::DDDDD:::::DII::::::II      TT:::::::TT      O:::::::OOO:::::::ORR:::::R     R:::::R
a:::::aaaa::::::a  n::::n    n::::n d:::::::::::::::::d       n::::n    n::::no:::::::::::::::o       w:::::w         w:::::w          ######  ######  ######            tt::::::::::::::th:::::h     h:::::h e::::::::eeeeeeee       E::::::::::::::::::::ED:::::::::::::::DD I::::::::I      T:::::::::T       OO:::::::::::::OO R::::::R     R:::::R
 a::::::::::aa:::a n::::n    n::::n  d:::::::::ddd::::d       n::::n    n::::n oo:::::::::::oo         w:::w           w:::w           ######  ######  ######              tt:::::::::::tth:::::h     h:::::h  ee:::::::::::::e       E::::::::::::::::::::ED::::::::::::DDD   I::::::::I      T:::::::::T         OO:::::::::OO   R::::::R     R:::::R
  aaaaaaaaaa  aaaa nnnnnn    nnnnnn   ddddddddd   ddddd       nnnnnn    nnnnnn   ooooooooooo            www             www            ######  ######  ######                ttttttttttt  hhhhhhh     hhhhhhh    eeeeeeeeeeeeee       EEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDD      IIIIIIIIII      TTTTTTTTTTT           OOOOOOOOO     RRRRRRRR     RRRRRRR
*/
/////////////////////////////////////////////////////////////////////////////


class OtherSketch extends PApplet {
  String[] splashtext = {"Never Updated™", "Probably Easier to Use Notepad", "Puts Pineapple on Pizza", "1... 2! 1... 2!", "Harumachi Clover ain't got nothing on this!", "", "", "", "", "", ""};
  String typing = ""; //just some input strings
  String saved = ""; //and the final map title
  PrintWriter output; // the bit that writes to file
  boolean lol = false; //checks if you've titled your level
  int circle = 1; //tracks which circle is the most recent to draw
  color pink = color(255, 192, 203); //osu!clone pink
  void setup() {
    surface.setTitle("osu!clone editor: " + splashtext[int(random(10))]); //sets the funny splash text !!
    background(200); //poggers gray
    surface.setResizable(true); //makes the tiny baby sketch scalable
    noStroke(); //removes borders
    fill(255); //adds a white fill? (why?)
  }
  void draw() {  //mostly just filling stuff, totally normal
    noFill();
    stroke(0);
    strokeWeight(5);
    rect(0, 0, 800, 600);
    noStroke();
    fill(0);
    textSize(25);
    text("Click in this window and type. \nHit '2' to save. ", 25, 40);
    text("Input: " + typing, 25, 190);
    text("Saved text: " + saved, 25, 230);
    text("Once you are done, press '1' to exit and save the notes", 25, 270);
  }
  void mouseClicked() { 
    if (lol) {
      redraw();
      if (mouseX <= 800-75 && mouseY <= 600-75) {
        stroke(0);
        fill(pink);
        output.print(mouseX+","+mouseY+","); //saves circle coordinates
        ellipse(mouseX, mouseY, 75, 75); //tells the mouse to redraw screen with new circle, each click
        fill(0);
        text(circle, mouseX-10, mouseY+10); //adds the number
        circle++;
      }
    }
  }
  void keyPressed() {
    if (key == '2') { //finishes the typing phase
      saved = typing;
      output = createWriter(saved+".level");
      lol = true;
      typing = "";
    } else if (key == '1') { //finishes the note phase
      output.flush();
      output.close();
      int tracker = millis();    
      background(200);
      text("Check Your Processing Directory, if you can't find the .level", 25, 40);
      if (tracker + 3000 > millis()) {
        exit();
      }
    } 
    //the rest is just a simple input reader 
    else if ( key == BACKSPACE) {
      if (typing.length() > 0) {
        background(200);
        typing = typing.substring(0, max(0, typing.length() - 1));
      }
    } else {
      typing = typing + key;
    }
  }
} 
