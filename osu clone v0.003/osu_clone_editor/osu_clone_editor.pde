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
  size(800,600);
  noStroke();
  fill(255);
}

void draw() {  
 if(keyPressed && keyCode == SHIFT){
    man=false;
  } else if(keyPressed && keyCode == CONTROL){
    man=true;
  }
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
}
void mouseClicked(){
   
  if(man==true){
  if(lol==true){
  if(mouseButton == LEFT){

    if(mouseX <= 800-75 && mouseY <= 600-75){
    stroke(0);
    fill(255);
  output.println(mouseX);
  output.println(mouseY);
  ellipse(mouseX,mouseY,75,75);
    fill(0);
  stroke(0);
  text(circle, mouseX-10, mouseY+10);
 circle++;
 }
 if(mouseButton == RIGHT){
 //Deletion code goes here
 }
    }
  }
    if(mouseButton == RIGHT){
    output = createWriter(saved+".level");
    background(200);
    circle=1;
  }
    }
  }
 if(man==false){
    if(mouseButton == LEFT){
    fill(255,0,0);
    stroke(0);
    ellipse(mouseX,mouseY,200,75);
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
  }  else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key; 
  }
}
}
