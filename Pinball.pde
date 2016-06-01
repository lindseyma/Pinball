void setup(){
    size(500, 700); 
    
   // rightF.display(265, 580, 50);
}

int score = 0;
int lives = 3;
boolean launched = false;
boolean gameBegin = false;
//int screen = 0;


//Ball b;
  Ball b = new Ball();
  //Bouncer bc = new Bouncer(200,150);
  //Bouncer bc2 = new Bouncer(260,200);
  
  Flipper rightF = new Flipper(185, 580, 50, true);
  Flipper leftF = new Flipper(250, 580, 50, false);
  
void draw(){
    //text(score, 20, 10);
    //fill(50);
    /*
    if(screen == 0){
        menu();
    }
    if(screen == 1){
        gameScreen();
    }*/
    background(209,209,209);
    noFill();
    rect(100,100,300,500);

    b.display();
    // bc.display();
   // bc2.display();
    //bc.Collision(b);
    //bc2.Collision(b);
    b.BounceWall();
    if(gameBegin){
      b.bounce();}
    if(launched){
      b.launchUp(time);
    }
    rightF.display(185, 580, 50);
    leftF.display(275, 580, 50);
    display();
}


//key pressed -- count time -- stop when key release -- restart counterwhen ball is back
//time count corresponds to force used to launch ball
  float time=0;
  void keyPressed(){
     if(key == ' '){
         time++;
      }
      if(key == 'f'){
         rightF.flip();
      }
      if(key == 'j'){
        leftF.flip();
      }
   }
  
  void keyReleased(){
      if(key == ' '){
          launched=true;
          startTime();
          println(time);
      }
      if(key == 'f'){
          rightF.unflip();
      }
      if(key == 'j'){
          leftF.unflip();
      }
  }
 ///after keyReleased
 float launchTime;
   void startTime(){
      launchTime=second();
   }
   void endTime(){
     if(second()-launchTime >3){
       gameBegin=true;
       launched=false;
     }
   }
  
  void display(){
    text(score, 20, 30);
    fill(0);
  }
  
  
  