void setup(){
    size(500, 700); 
   // rightF.display(265, 580, 50);
}

int score = 0;
int lives = 3;
//int screen = 0;

void gameSetup(){
    score = 0;
   // b = new Ball();
}

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
    b.bounce();
    
    rightF.display(185, 580, 50);
    leftF.display(275, 580, 50);
    display();
}


//key pressed -- count time -- stop when key release -- restart counterwhen ball is back
//time count corresponds to force used to launch ball
  void keyPressed(){
      if(key == ' '){
         countTime();
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
          stopLTime();
      }
      if(key == 'f'){
          rightF.unflip();
      }
      if(key == 'j'){
          leftF.unflip();
      }
  }
  
  float startLaunch;
  float endLaunch;
  float launchPower;
  
  void display(){
    text(score, 20, 30);
    fill(0);
  }
  
  public float countTime(){
      startLaunch = millis();
      return startLaunch;
  }
  
  public float stopLTime(){
      endLaunch = millis();
      launchPower = endLaunch-startLaunch;
      return launchPower;
  }
  
  public void launch(){
    System.out.println("launching ayy");
  }