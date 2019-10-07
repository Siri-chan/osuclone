/*import processing.sound.*;
 SoundFile song;*/
int start; //Not Sure What this is for
boolean[] keys = {false, false}; //User Input Bool
boolean die = false; //Loading thingy
int index = 0; //loading thing
PrintWriter output; // used in editor ~~ obsolete
String[] lines; //loading thingy
int[] circlex = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; // circle positions
int[] circley = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; // more circle positions
int cs = 75; //circle size
int clicked = 0;
String[] pieces;
boolean loli = false;
PImage bg;
boolean[] slider;
String mapname = "";
String mapplaying = "default.level";
PImage menubg;
void setup() {
  size(800, 600);
  background(128);
  /*
  !!IMPORTANT DEV NOTE!!
   This line being uncommented resets the default level
   */
  /*output = createWriter("default.level");
   output.print("300,200,444,222,200,300,600,400,599,100,291,429,200,200,200,488,488,292,725,13l,020,202,743,544,744,494,328,382,292,484");
   */  start = millis();
  bg = loadImage("bg.jpg");
    menubg = loadImage("menu.jpg");
}
void draw() {

  if(loli == false){
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
  if (loli == true) {
    textAlign(LEFT, BOTTOM);
    lines = loadStrings(mapplaying);
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
        //
        circlex[6] = int(pieces[12]);
        circley[6] = int(pieces[13]);
        circlex[7] = int(pieces[14]);      
        circley[7] = int(pieces[15]);
        circlex[8] = int(pieces[16]);
        circley[8] = int(pieces[17]);
        circlex[9] = int(pieces[18]);
        circley[9] = int(pieces[19]);
        circlex[10] = int(pieces[20]);      
        circley[10] = int(pieces[21]);
        circlex[11] = int(pieces[22]);
        circley[11] = int(pieces[23]);
        die=true;
      }
    }
    fill(255);
    textSize(25);
    background(bg);
    if (clicked == 0) {
      ellipse(circlex[0], circley[0], cs, cs);
      fill(0);
      text(clicked+1, circlex[0]-10, circley[0]+10);
      int timer = millis()-start - 4000;
      int timer2 = timer / 1000;
      textSize(100);

      if (timer2 >= 0) {
        if (mouseX > circlex[0] - cs && mouseX < circlex[0] + cs && mouseY > circley[0] - cs && mouseY < circley[0] + cs) {
          if (keys[0]==true) {
            clicked++;
          }
        }
      } else {
        text(timer2, 20, 100);
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
      if (mouseX > circlex[5] - cs && mouseX < circlex[5] + cs && mouseY > circley[5] - cs && mouseY < circley[5] + cs) {
        if (keys[0]==true) {
          clicked++;
        }
      }
    }
    //
    if (clicked == 6) {
      ellipse(circlex[6], circley[6], cs, cs);
      fill(0);
      text(clicked+1, circlex[6]-10, circley[6]+10);
      textSize(100);
      if (mouseX > circlex[6] - cs && mouseX < circlex[6] + cs && mouseY > circley[6] - cs && mouseY < circley[6] + cs) {
        if (keys[0]==true) {
          clicked++;
        }
      }
    }
  }
  if (clicked == 7) {
    ellipse(circlex[7], circley[7], cs, cs);
    fill(0);
    text(clicked+1, circlex[7]-10, circley[7]+10);
    if (mouseX > circlex[7] - cs && mouseX < circlex[7] + cs && mouseY > circley[7] - cs && mouseY < circley[7] + cs) {
      if (keys[0]==true) {
        clicked++;
      }
    }
  }
  if (clicked == 8) {
    ellipse(circlex[8], circley[8], cs, cs);
    fill(0);
    text(clicked+1, circlex[8]-10, circley[8]+10);
    if (mouseX > circlex[8] - cs && mouseX < circlex[8] + cs && mouseY > circley[8] - cs && mouseY < circley[8] + cs) {
      if (keys[0]==true) {
        clicked++;
      }
    }
  }
  if (clicked == 9) {
    ellipse(circlex[9], circley[9], cs, cs);
    fill(0);
    text(clicked+1, circlex[9]-10, circley[9]+10);
    if (mouseX > circlex[9] - cs && mouseX < circlex[9] + cs && mouseY > circley[9] - cs && mouseY < circley[9] + cs) {
      if (keys[0]==true) {
        clicked++;
      }
    }
  }
  if (clicked == 10) {
    ellipse(circlex[10], circley[10], cs, cs);
    fill(0);
    text(clicked+1, circlex[10]-10, circley[10]+10);
    if (mouseX > circlex[10] - cs && mouseX < circlex[10] + cs && mouseY > circley[10] - cs && mouseY < circley[10] + cs) {
      if (keys[0]==true) {
        clicked++;
      }
    }
  }
  if (clicked == 11) {
    ellipse(circlex[11], circley[11], cs, cs);
    fill(0);
    text(clicked+1, circlex[11]-10, circley[11]+10);
    if (mouseX > circlex[11] - cs && mouseX < circlex[11] + cs && mouseY > circley[11] - cs && mouseY < circley[11] + cs) {
      if (keys[0]==true) {
        clicked++;
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
      if( key == BACKSPACE) {
        if (mapname.length() > 0) {
        mapname = mapname.substring(0, max(0, mapname.length() - 1));
      }
      }else{
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
  }
} 
