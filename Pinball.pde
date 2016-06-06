    void setup(){
    size(500, 700); 
    score = 0;
    menu();
    //initGame();
}

int score = 0;
boolean launched = false;
//int launchNum=0;
boolean gameBegin = false;
int screen = 0;

int lives;

public void initGame(){
  lives = 3;
  playing = false;
  screen = 1;
}

//Ball b;
Ball b = new Ball();
//Wall t = new Wall(120, 120, 390, 120);
Wall l = new Wall(120, 120, 120, 590);
DiagonalWall bottomLeft = new DiagonalWall(120, 590, 235, 640, true);
//DiagonalWall bottomRight = new DiagonalWall(270, 640, 390, 590, false);
DiagonalWall bottomRight = new DiagonalWall(390, 590, 270, 640, false);
Wall r = new Wall(390, 120, 390, 590);
//testttt
//Wall diagTest = new Wall(200, 200, 300, 300);
CurveWall t = new CurveWall(120, 500, 120, 120, 390, 120, 500, 500);
//120, 120, 205, 150, 285, 150, 390, 120
  
Bouncer bc = new Bouncer(200,260, 25);
Bouncer bc2= new Bouncer(270,300,25);
//Bouncer bc2 = new Bouncer(260,200);
  
Flipper rightF = new Flipper(175, 550, 215, 575,false);
Flipper leftF = new Flipper(330, 550, 265, 575,true);
  
void draw(){
  println(playing);
  //System.out.println(screen);
//text(score, 20, 10);
//fill(50);
    if(screen == 0){
        menu();
    }
    if(screen == 1){
        gameScreen();
    }
    if(screen == 2){
        endScreen();
    }
    //background(209,209,209);
    noFill();
    //System.out.println(mouseY);
    //rect(100,100,300,500);
}

void endScreen(){
  background(209,209,209);
  textSize(100);
  fill(0, 102, 153);
  text("GAME", 110, 300);
  text("OVER", 120, 400);
  fill(10, 102, 0);
  textSize(50);
  text("Play Again", 200, 650);
  //System.out.println(mouseX + ", " + mouseY);
}
void menu(){
  textSize(100);
  fill(0, 102, 153);
  text("PINBALL", 60, 300);
  fill(10, 102, 0);
  textSize(50);
  text("Play", 185, 400);
  
}

void mousePressed(){
  if(screen == 0 &&
     mouseX > 190 &&
     mouseY > 364 &&
     mouseX < 283 &&
     mouseY < 412){
       //playing = true;
       lives = 3;
       screen = 1;
     }
     if(screen == 2 &&
      mouseX > 205 &&
     mouseY > 617 &&
     mouseX < 447 &&
     mouseY < 652){
       initGame();
     }
}
     
     void initLife(){
       playing = false;
       b.x = 380;
       b.y = 580;
       b.ax=1;
       b.ay=-1;
       time = 0;
       //println("init");
     }
       
boolean playing;

void gameScreen(){
  background(209,209,209);
    b.display();
    
    //wall stuff
    t.display();
    //d.display();
    r.display();
    l.display();
    bottomLeft.display();
    bottomRight.display();
   // diagTest.display();
   // diagTest.walling(b);
    
    //t.walling(b);
    bottomLeft.collisionDia(b);
    bottomRight.collisionDia(b);
    r.walling(b);
    l.walling(b);
    //bc.display();
   // bc.CollisionH(b);
    //bc2.display();
    //bc2.CollisionH(b);
    if(playing){
      b.bounce();
    }
    //if(launched && launchNum==0){
      if(launched){
      b.launchUp(time);
      endTime();
    }
    rightF.display();
    leftF.display();
    rightF.flip();
    leftF.flip();
    leftF.collisionF(b);
    rightF.collisionF(b);
    if(rightF.getFlipped()){
      rightF.decreaseT();}
     if(leftF.getFlipped()){
       leftF.decreaseT();}
    display();
    if( lives == 0){
      screen = 2;
    }
    if(b.y > 700){
      lives--;
      playing = false;
      initLife();
    }
}


//key pressed -- count time -- stop when key release -- restart counterwhen ball is back
//time count corresponds to force used to launch ball
  float time=0;
  void keyPressed(){
     if(key == ' '){
         if(time<25 && !playing){
           //println("working?");
         time++;}
         //println("time:" +time);
      }
      if(key == 'f'){
        rightF.increaseT();
        rightF.setUpF(true);
      
      }
      if(key == 'j'){
        leftF.increaseT();
        leftF.setUpF(true);
      
      }
   }
  
  void keyReleased(){
      if(key == ' '){
          //println("space");
          launched=true;
          startTime();
      }
      if(key == 'f'){
        rightF.setFlipped(true);
        rightF.setUpF(false);
      }
      if(key == 'j'){
        leftF.setFlipped(true);
        leftF.setUpF(false);
      }
  }
  
 /// unflip
   void unflip(Flipper f){
     for(int i=0;i<10;i++){
       f.decreaseT();
     }
   }
 
 ///after keyReleased
 float launchTime;
   void startTime(){
      launchTime=millis();
   }
   
   void endTime(){
     if(millis()-launchTime >500){
       //gameBegin=true;
       launched=false;
       //launchNum++;
       //println("endTime:" + launchTime);
     }
   }
  
  void display(){
    text(score, 20, 30);
    text(lives, 20, 50);
    fill(0);
  }
  
  
  
  