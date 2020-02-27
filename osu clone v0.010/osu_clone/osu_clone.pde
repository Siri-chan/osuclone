/*import processing.sound.*;
 SoundFile song;*/
int circle = 0;
int piece = 0;
int splash = int(random(2));
String[] splashtext = {"better than ppy!", "Electric Boogaloo"};
int start; //Not Sure What this is for
boolean[] keys = {false, false}; //User Input Bool
boolean die = false; //Loading thingy
int index = 0; //loading thing
PrintWriter output; // used in editor ~~ obsolete
String[] lines; //loading thingy
int[] circlex = new int[21474836]; // circle positions
int[] circley = new int[21474836]; // more circle positions
int cs = 75; //circle size
int clicked = 0;
String[] pieces;
PImage cursor ;
boolean loli = false;
PImage bg;
boolean[] slider;
String mapname = "";
String mapplaying = "default.level";
PImage menubg;
int timer;
int timer2;
int hp = 10;
boolean loli2 = true;
void setup() {
  size(800, 600);
  background(128);
    cursor = loadImage("osucursor.png");
  cursor(cursor);
  surface.setTitle("osu!clone: " + splashtext[splash]);
  /*
  !!IMPORTANT DEV NOTE!!
   This line being uncommented resets the default level
   */
  /*output = createWriter("default.level");
   output.print("300,200,444,222,200,300,600,400,599,100,291,429,200,200,200,488,488,292,725,13l,020,202,743,544,744,494,328,382,292,484,1000,1000");
   */  start = millis();
  menubg = loadImage("menu.jpg");
}
void draw() {
  println(hp);
  timer = millis()-start - 4000;
  timer2 = timer / 1000;
  if (loli == false) {
    if (loli2 == true) {
      background(menubg);
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(50);
      text(mapname, 400, 500);
      text(mapplaying, 400, 550);
      fill(255, 192, 203);
      textSize(100);
      if (mouseX > 250 && mouseX < 550 && mouseY > 82.5 && mouseY < 467.5) {
        ellipse(400, 275, 300, 385);
        fill(255);
        text("PLAY", 400, 275);
        if (mousePressed && mouseButton == LEFT) {
          start = millis();
          loli = true;
        }
      }
    }
else {
      background(255);
      fill(0);
      text("Failure. M to return to Menu",50,50,750,550);
}
  }
    if (loli == true) {
      textAlign(LEFT, BOTTOM);
      try {
        lines = loadStrings(mapplaying);
        if (index < lines.length) {
          pieces = split(lines[index], ',');
          if (die == false) {
            cs = 75;
            try {
              circlex[circle] = int(pieces[piece]);
              piece++;
              circley[circle] = int(pieces[piece]);
              piece++;
              circle++;
            } 
            catch(Exception e) {
              die=true;
            }
          }
        }
      }
      catch (Exception e) {
        println("Failed to load level: Check Game Directory and if filename entered correctly");
        loli = false;
        mapname = "";
        die = false;
        cs = 75; //circle size
        clicked = 0;
      }
      try {
        bg = loadImage(mapplaying+".jpg");
      } 
      catch(Exception e) {
        bg = loadImage("bg.jpg");
      }

      fill(255);
      textSize(25);
      try {
        background(bg);
      } 
      catch(Exception e) {
        bg = loadImage("bg.jpg");
        background(bg);
      }
      if (hp <= 0) {
        loli = false;
        loli2 = false;
        mapname = "";
        die = false;
        cs = 75; //circle size
        clicked = 0;
        circle = 0;
        piece = 0;
        hp = 20;
      }
      if (clicked == 0) {
        if (timer < ((clicked*1000) + 700) * 2) {
          hp = 20;
          ellipse(circlex[0], circley[0], cs, cs);
          fill(0);
          text(clicked+1, circlex[0]-10, circley[0]+10);
        }
        textSize(100);

        if (timer2 >= 0) {
          if (mouseX > circlex[0] - cs && mouseX < circlex[0] + cs && mouseY > circley[0] - cs && mouseY < circley[0] + cs) {
            if (keys[0]==true) {
              clicked++;
              hp++;
            } else if (timer > ((clicked*1000) + 700) * 2) {
              hp-=1;
              clicked++;
            }
          } else if (timer > ((clicked*1000) + 700) * 2) {
            hp-=1;
            clicked++;
          }
        } else {
          text(timer2, 20, 100);
        }
      }
      if (clicked > 0) {

        try {
          if (timer > (clicked *1000) + 700 && timer < ((clicked*1000) + 700) * 2) {
            fill(255);
            ellipse(circlex[clicked], circley[clicked], cs, cs);
            fill(0);
            text(clicked+1, circlex[clicked]-10, circley[clicked]+10);
            if (mouseX > circlex[clicked] - cs && mouseX < circlex[clicked] + cs && mouseY > circley[clicked] - cs && mouseY < circley[clicked] + cs) {
              if (keys[0]==true) {
                clicked++;
                hp++;
              }
            }
          } else if (timer > ((clicked*1000) + 700) * 2) {
            hp-=2;
            clicked++;
          }
        }
        catch (Exception e) {
          loli = false;
          mapname = "";
          die = false;
          cs = 75; //circle size
          clicked = 0;
          circle = 0;
          piece = 0;
        }
      }
    }
  }

void keyPressed() {
  if (loli == true)
  {
    if (key == 'z' || key == 'Z') {
      keys[0] = true;
    }
    if (key == 'x' || key == 'X') {
      keys[0] = true;
    }
    if (keyCode == DOWN) {
      keys[1] = true;
    }
  } else {
    if (key == '5') {
      mapplaying = mapname+".level";
    } else {
      if (key == '0') {
        mapname = "";
      } else {
        if ( key == BACKSPACE) {
          if (mapname.length() > 0) {
            mapname = mapname.substring(0, max(0, mapname.length() - 1));
          }
        } else {
          mapname = mapname+key;
        }
      }
    }
  }
}
void keyReleased()
{
  if (key == 'z' || key == 'Z') {
    keys[0] = false;
  }
  if (key == 'x' || key == 'X') {
    keys[0] = false;
  }
  if (keyCode == DOWN) {
    if (keys[1]==true) {
      saveFrame("screenshot-"+millis()+"-###.jpg");
    }
    keys[1]=false;
  }
  if (key=='q' || key == 'Q') {
    exit();
  }
  if (key == 'm' || key == 'M') {
    loli = false;
    mapname = "";
    die = false;
    cs = 75; //circle size
    clicked = 0;
    circle = 0;
    piece = 0;
    hp = 20;
    loli2 = true;
  } if(key=='p'){
  OtherSketch otherSketch = new OtherSketch();
  runSketch(new String[]{"OtherSketch"}, otherSketch);
  }
} 
class OtherSketch extends PApplet {
// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

PrintWriter output;
boolean lol = false;
int circle = 1;
void setup() {
  background(200);
  surface.setResizable(true);
  noStroke();
  fill(255);
}

void draw() {  
  // Set the font and fill for text
  noFill();
  stroke(0);
  strokeWeight(5);
  rect(0,0,800,600);
  noStroke();
  fill(0);
  textSize(25);
  // Display everything
  text("Click in this window and type. \nHit '2' to save. ", 25, 40);
  text("Input: " + typing,25,190);
  text("Saved text: " + saved,25,230);
  text("Once you are done, press '1' to exit and save the notes",25,270);
  //this will save to your processing directory
}
void mouseClicked() {
  if (lol==true) {
    redraw();
    if (mouseX <= 800-75 && mouseY <= 600-75) {
      stroke(0);
      fill(255);
      output.print(mouseX+","+mouseY+",");
      ellipse(mouseX, mouseY, 75, 75);
      fill(0);
      stroke(0);
      text(circle, mouseX-10, mouseY+10);
      circle++;
    }
  }
}
void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '2' ) {
    saved = typing;
    output = createWriter(saved+".level");
    lol = true;
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  } else if (key == '1'){
    output.flush();
    output.close();
    exit();
  }  else if ( key == BACKSPACE) {
    if (typing.length() > 0) {
      background(200);
      typing = typing.substring(0, max(0, typing.length() - 1));
    }
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key;
  }
}
} 
