//Allen Wu, Sup 17, 2020
//Time: 12 hrs

int gap=0;
float circleX=random(width);
int circleY=20;
float xspeed;
float yspeed;
int score;
//paddle width
float rwidth=100;

final float x1 = 80;
final float y1 = 180;
final float w1 = 100;
final float h1 = 50;

float x2 = 265;
float y2 = 180;
float w2 = 100;
float h2 = 50;

float x3 = 450;
float y3 = 180;
float w3 = 100;
float h3 = 50;

float mul=1.1;

boolean startScreen = true;


void setup() {
  size(640, 360);
  frameRate(60);
  gap=height-30;
  reset();
  
}

//bring circle to top when game restarts
void reset() {
  circleX=width/2+random(-300,300); // The ball should start at a random location in the top of the window and with a random direction
  xspeed=random(-4, 4)*mul; // so ball goes left or right
  yspeed =random(5, 6)*mul; //so ball initate random-ish speed
  circleY=0;
  score=0;
  startScreen=true;
}


void draw() {
  
  if (startScreen == true){
  extraCredit();
  }
  else{//actual game code start here
  stroke(0);
  strokeWeight(2);

  //crazy rainbow ball
  if (mousePressed) {
    stroke(255);
  } else {
    background(50, 0);
  }

  //bouncing circle
  fill(random(255), random(255), random(255));
  circle(circleX, circleY, 20);
  circleX+=xspeed;
  circleY+=yspeed;
  
  // draw pedel
  //paddle
  if (mouseX<=(width-(rwidth/2))&&mouseX>=(rwidth/2)) {
    fill(255);
    rect(mouseX, gap, rwidth, 20);
  }

  //paddle stays in screen
  if (mouseX<(rwidth/2)) {
    fill(255);
    rect((rwidth/2), gap, rwidth, 20);
  }
  if (mouseX>(width-(rwidth/2))) {
    
    fill(255);
    rect((width-(rwidth/2)), gap, rwidth, 20);
  }
  
  rectMode(CENTER);
  //ball bounces when it hits paddle
  if (circleX<(mouseX+(rwidth/2))&&circleX>(mouseX-(rwidth/2))) {
    if (circleY>=(gap-10)) {
      yspeed=-(yspeed*1.2); // The speed of the ball should increase every time the player scores a point
      xspeed=(xspeed*1.2);
      score=score+1;
    }
  }

  //score shown
  textSize(40);
  text(("Points: "+score), width-210, 50);

  //ball bounces when it hits top of screen
  if (circleY<=0) {
    yspeed=(abs(yspeed));
  }

  //ball bounces off left wall
  if (circleX<=0) {
    xspeed=-xspeed;
  }

  //ball bounces off right wall
  if (circleX>=width) {
    xspeed=-xspeed;
  }

  //game over
  if (circleY>=height+20) { // +20 only because the checking is not perfect
  //game will be absolutly unplayable before ball penetrates checking area
    background(0);
    textSize(32);
    text("Game Over.", 80, (height/2));
    text("Press Any Key to Start Over.", 80, (height/2)+40);
    xspeed=0; // so ball stay when game ended
    yspeed =0; 
    
    if (keyPressed==true) {
      reset();
    }

  }
}
}


void extraCredit() {
rectMode(CORNER);
 background(30);
 strokeWeight(15);
  stroke(255,255,0);

 textSize(30);
  fill(0, 255, 255);
  text("Select three different sizes of paddles:", 30, 60);
  text("100, 200, & 300-pixel width.",100, 100);
  text("Ball speed varies!", 180, 140);
 fill(255);
 
  if(mouseX>x1 && mouseX <x1+w1 && mouseY>y1 && mouseY <y1+h1){
    text("Speed multiplyer = 0.8", 70, 300);
    if(mousePressed){
   println("The mouse is pressed and over the button");
   fill(0);
   //do stuff 
   rwidth=100;
   mul=0.8;
   startScreen = false;
  }
 } 
 rect(x1,y1,w1,h1);
 fill(200,150,0);
  text("100px", x1,y1+35);

  
 
 
 fill(255);

  if(mouseX>x2 && mouseX <x2+w2 && mouseY>y2 && mouseY <y2+h2){
      text("Speed multiplyer = 1.0", 70, 300);

    if(mousePressed){
   println("The mouse is pressed and over the button");
   fill(0);
   //do stuff 
      rwidth=200;
   mul=1.0;
   startScreen=false;
   
  }
 } 
  rect(x2,y2,w2,h2);
  fill(200,150,0);
  text("200px", x2,y2+35);
 

 fill(255);
  if(mouseX>x3 && mouseX <x3+w3 && mouseY>y3 && mouseY <y3+h3){
    text("Speed multiplyer = 1.8", 70, 300);
    if(mousePressed){
    println("The mouse is pressed and over the button");
   fill(0);
   //do stuff 
      rwidth=300;
   mul=1.8;
   startScreen = false;
  }
 } 
  rect(x3,y3,w3,h3);
  fill(200,150,0);
  text("300px", x3,y3+35);  
}
