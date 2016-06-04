void setup(){
    size(500, 700); 
}

int score = 0;
int lives = 3;
boolean launched = false;
int launchNum=0;
boolean gameBegin = false;
//int screen = 0;


//Ball b;
Ball b = new Ball();
//Wall t = new Wall(120, 120, 390, 120);
Wall l = new Wall(120, 120, 120, 590);
Wall r = new Wall(120, 590, 390, 590);
Wall d = new Wall(390, 120, 390, 590);
CurveWall t = new CurveWall(120, 500, 120, 120, 390, 120, 500, 500);
//120, 120, 205, 150, 285, 150, 390, 120
  
Bouncer bc = new Bouncer(200,150, 25);
//Bouncer bc2 = new Bouncer(260,200);
  
Flipper rightF = new Flipper(175, 550, 215, 580,false);
Flipper leftF = new Flipper(330, 550, 220, 580,true);
  
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
    //rect(100,100,300,500);

    b.display();
    
    //wall stuff
    t.display();
    d.display();
    r.display();
    l.display();
    
    //t.walling(b);
    d.walling(b);
    r.walling(b);
    l.walling(b);
    bc.display();
    bc.CollisionH(b);

    if(gameBegin){
      b.bounce();}
    if(launched && launchNum==0){
      b.launchUp(time);
      endTime();
    }
    rightF.display();
    leftF.display();
    rightF.flip();
    leftF.flip();
    if(rightF.getFlipped()){
      rightF.decreaseT();}
     if(leftF.getFlipped()){
       leftF.decreaseT();}
    display();
}


//key pressed -- count time -- stop when key release -- restart counterwhen ball is back
//time count corresponds to force used to launch ball
  float time=0;
  void keyPressed(){
     if(key == ' '){
         if(time<25){
         time++;}
         println("time:" +time);
      }
      if(key == 'f'){
        rightF.increaseT();
      
      }
      if(key == 'j'){
        leftF.increaseT();
      
      }
   }
  
  void keyReleased(){
      if(key == ' '){
          launched=true;
          startTime();
      }
      if(key == 'f'){
        rightF.setFlipped(true);
      }
      if(key == 'j'){
        leftF.setFlipped(true);
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
       gameBegin=true;
       launched=false;
       launchNum++;
       println("endTime:" + launchTime);
     }
   }
  
  void display(){
    text(score, 20, 30);
    fill(0);
  }
  
  
  
  