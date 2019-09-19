/*import processing.sound.*;
 SoundFile song;*/
int start;
boolean[] keys = {false, false};
boolean die = false;
int index = 0;
PrintWriter output;
String[] lines;
int[] circlex = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int[] circley = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int cs = 75;
int clicked = 0;
String[] pieces;
boolean loli = false;
PImage bg;
void setup() {
  size(800, 600);
  background(128);
  lines = loadStrings("default.level");

  /*
  !!IMPORTANT DEV NOTE!!
   This line being uncommented resets things
   */
  //output = createWriter("default.level");
  start = millis();
  bg = loadImage("bg.jpg");
}
void draw() {
  if (index < lines.length) {
    pieces = split(lines[index], ',');
    if (die == false) {
      circlex[0] = int(pieces[0]);
      circley[0] = int(pieces[1]);
      circlex[1] = int(pieces[2]);      
      circley[1] = int(pieces[3]);
      circlex[2] = int(pieces[4]);
      circley[2] = int(pieces[5]);
      circlex[3] = int(pieces[6]);
      circley[3] = int(pieces[7]);
      circlex[4] = int(pieces[8]);      
      circley[4] = int(pieces[9]);
      circlex[5] = int(pieces[10]);
      circley[5] = int(pieces[11]);
      die=true;
    }
  } 
  if (loli == false) {
    fill(255, 0, 0);
    rect(0, 0, 400, 200);
    fill(0, 255, 0);
    textSize(100);
    text("PLAY", 50, 150);
    if (mousePressed && mouseButton == LEFT && mouseX >0 && mouseX <400 && mouseY >0 && mouseY <200) {
      loli = true;
    }
  }
  if (loli == true) {
    fill(255);
    textSize(25);
    background(bg);
    if (clicked == 0) {
      ellipse(circlex[0], circley[0], cs, cs);
      fill(0);
      text(clicked+1, circlex[0]-10, circley[0]+10);
      int timer = millis()-start;
      textSize(100);
      text(timer, 20, 100);
      if (timer >= 3000) {
        if (mouseX > circlex[0] - cs && mouseX < circlex[0] + cs && mouseY > circley[0] - cs && mouseY < circley[0] + cs) {
          if (keys[0]==true) {
            clicked++;
          }
        }
      }
    }
    if (clicked == 1) {
      ellipse(circlex[1], circley[1], cs, cs);
      fill(0);
      text(clicked+1, circlex[1]-10, circley[1]+10);
      if (mouseX > circlex[1] - cs && mouseX < circlex[1] + cs && mouseY > circley[1] - cs && mouseY < circley[1] + cs) {
        if (keys[0]==true) {
          clicked++;
        }
      }
    }
    if (clicked == 2) {
      ellipse(circlex[2], circley[2], cs, cs);
      fill(0);
      text(clicked+1, circlex[2]-10, circley[2]+10);
      if (mouseX > circlex[2] - cs && mouseX < circlex[2] + cs && mouseY > circley[2] - cs && mouseY < circley[2] + cs) {
        if (keys[0]==true) {
          clicked++;
        }
      }
    }
    if (clicked == 3) {
      ellipse(circlex[3], circley[3], cs, cs);
      fill(0);
      text(clicked+1, circlex[3]-10, circley[3]+10);
      if (mouseX > circlex[3] - cs && mouseX < circlex[3] + cs && mouseY > circley[3] - cs && mouseY < circley[3] + cs) {
        if (keys[0]==true) {
          clicked++;
        }
      }
    }
    if (clicked == 4) {
      ellipse(circlex[4], circley[4], cs, cs);
      fill(0);
      text(clicked+1, circlex[4]-10, circley[4]+10);
      if (mouseX > circlex[4] - cs && mouseX < circlex[4] + cs && mouseY > circley[4] - cs && mouseY < circley[4] + cs) {
        if (keys[0]==true) {
          clicked++;
        }
      }
    }
    if (clicked == 5) {
      ellipse(circlex[5], circley[5], cs, cs);
      fill(0);
      text(clicked+1, circlex[5]-10, circley[5]+10);
      if (mouseX > circlex[2] - cs && mouseX < circlex[2] + cs && mouseY > circley[2] - cs && mouseY < circley[2] + cs) {
        if (keys[0]==true) {
          clicked++;
        }
      }
    }
  }
}
void keyPressed()
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
  if(key=='p' || key == 'P'){
  if(loli == false){
  OtherSketch otherSketch = new OtherSketch();
  runSketch(new String[]{"OtherSketch"}, otherSketch);
  } else {
  println("just fucking play");
  }

  }
} 
class OtherSketch extends PApplet {
  // Variable to store text currently being typed
  String typing = "";

  // Variable to store saved text when return is hit
  String saved = "";
  boolean man = true;
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
    if (keyPressed && keyCode == SHIFT) {
      man=false;
    } else if (keyPressed && keyCode == CONTROL) {
      man=true;
    }
    // Set the font and fill for text
    noFill();
    stroke(0);
    strokeWeight(5);
    rect(0, 0, 800, 600);
    noStroke();
    fill(0);
    textSize(25);
    // Display everything
    text("Click in this window and type. \nHit '2' to save. ", 25, 40);
    text("Input: " + typing, 25, 190);
    text("Saved text: " + saved, 25, 230);
    text("Once you are done, press '1' to exit and save the notes", 25, 270);
  }
  void mouseClicked() {

    if (man==true) {
      if (lol==true) {
        if (mouseButton == LEFT) {
          if (mouseX <= 800-75 && mouseY <= 600-75) {
            stroke(0);
            fill(255);
            output.println(mouseX);
            output.println(mouseY);
            ellipse(mouseX, mouseY, 75, 75);
            fill(0);
            stroke(0);
            text(circle, mouseX-10, mouseY+10);
            circle++;
          }
        }
        if (mouseButton == RIGHT) {
          output = createWriter(saved+".level");
          background(200);
          circle=1;
        }
      }
    }
    if (man==false) {
      if (mouseButton == LEFT) {
        fill(255, 0, 0);
        stroke(0);
        ellipse(mouseX, mouseY, 200, 75);
      }
    }
  }

  void mouseDragged() {
    if (man==false) {
      if (mouseButton == LEFT) {
        fill(255, 0, 0);
        stroke(0);
        ellipse(mouseX, mouseY, 75, 75);
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
    } else if (key == '1') {
    if (saved != ""){
      output.flush();
      output.close();
      exit();
      }
    } else {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      typing = typing + key;
    }
  }
}

