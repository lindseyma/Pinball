void setup(){
    size(500, 700);  
    Ball b = new Ball();
    b.display();
}

int mode;
int score = 0;
int lives = 3;
//int screen = 0;

void gameSetup(){
    score = 0;
   // b = new Ball();
}

//Ball b;
  Ball b = new Ball();
  Bouncer bc = new Bouncer(200,150);
  Bouncer bc2 = new Bouncer(260,200);
void draw(){
    /*
    if(screen == 0){
        menu();
    }
    if(screen == 1){
        gameScreen();
    }*/
    background(209,209,209);
    rect(100,100,300,500);

    b.display();
    bc.display();
    bc2.display();
    bc.Collision(b);
    bc2.Collision(b);
    b.BounceWall();
    b.bounce();
}


//key pressed -- count time -- stop when key release -- restart counterwhen ball is back
//time count corresponds to force used to launch ball
  void keyPressed(){
      if(key == ' '){
         countTime();
      }
  }
  
  void keyReleased(){
      if(key == ' '){
          stopLTime();
      }
  }
  
  float startLaunch;
  float endLaunch;
  float launchPower;
  
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
/*
void menu(){
    
}

void gameScreen(){
 
}*/