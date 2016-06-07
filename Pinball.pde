    void setup(){
    size(500, 700); 
    score = 0;
    menu();
    //initGame();
}

int hiscore = 0;
int score = 0;
boolean launched = false;
//int launchNum=0;
boolean gameBegin = false;
int screen = 0;

int lives;

public void initGame(){
  score = 0;
  lives = 3;
  playing = false;
  screen = 1;
}

//Ball b;
Ball b = new Ball();
Wall l = new Wall(120, 150, 120, 590);
DiagonalWall bottomLeft = new DiagonalWall(120, 590, 210, 640, false);
DiagonalWall bottomRight = new DiagonalWall(390, 590, 295, 640, true);
DiagonalWall topLeft = new DiagonalWall(150,120,120,150,false);
DiagonalWall topRight = new DiagonalWall(360,120,390,150,true);
Platform moving = new Platform(130,360,180,360);
Wall r = new Wall(390, 150, 390, 590);
Wall t = new Wall(150, 120,360,120);  
Bouncer red1= new Bouncer(160,200,25,color(225,51,0));
Bouncer green2= new Bouncer(355,200,25,color(153,204,0));
Bouncer yellow3=new Bouncer(255,180,25,color(255,204,0));

Flipper smRight = new Flipper(155,300,50,false);
Flipper smLeft = new Flipper(360,300,50,true);
Flipper rightF = new Flipper(165, 500,60,false);
Flipper leftF = new Flipper(340, 500,60,true);
  
void draw(){
  //println(lives);
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
  textSize(30);
  String hiDisp = "High Score: " + hiscore;
  text(hiDisp, 30, 50);
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
    

    t.display();
    r.display();
    l.display();
    bottomLeft.display();
    bottomRight.display();
    topLeft.display();
    topRight.display();
    moving.display();
    
    bottomLeft.collisionDia(b);
    bottomRight.collisionDia(b);
    moving.CollisionP(b);
    moving.moveTo();
    moving.moveBack();
    r.walling(b);
    l.walling(b);
    t.walling(b);
    
    red1.display();
    red1.CollisionH(b);
    green2.display();
    green2.CollisionH(b);
    yellow3.display();
    yellow3.CollisionH(b);
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
      
    smRight.display();
    smLeft.display();
    smRight.flip();
    smLeft.flip();
    smRight.collisionF(b);
    smLeft.collisionF(b);
    
    if(rightF.getFlipped()){
      rightF.decreaseT();}
     if(leftF.getFlipped()){
       leftF.decreaseT();}
       
    if(smRight.getFlipped()){
      smRight.decreaseT();}
    if(smLeft.getFlipped()){
      smLeft.decreaseT();}
      
      
    display();
    //println("debug" + lives);
    if( lives == 0){
      if(score>hiscore){
        hiscore = score;
      }
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
         if(time<32 && !playing){
           //println("working?");
         time++;}
         //println("time:" +time);
      }
      if(key == 'f'){
        rightF.increaseT();
        rightF.setUpF(true);
        smRight.increaseT();
        smLeft.setUpF(true);
      
      }
      if(key == 'j'){
        leftF.increaseT();
        leftF.setUpF(true);
        smLeft.increaseT();
        smLeft.setUpF(true);      
      }
      if(key == 'r'){
        playing = false;
        screen = 2;
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
        smRight.setFlipped(true);
        smRight.setUpF(false);
      }
      if(key == 'j'){
        leftF.setFlipped(true);
        leftF.setUpF(false);
        smLeft.setFlipped(true);
        smLeft.setUpF(false);
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
    fill(0);
    textSize(20);     
    String scoreDisp = "score:" + score;
    text(scoreDisp, 20, 30);
    String lifeDisp = "lives:" + lives;
    text(lifeDisp, 20, 50);
    text("Press \'R\' to restart the game", 20, 70);
    fill(0);
  }
  
  
  
  