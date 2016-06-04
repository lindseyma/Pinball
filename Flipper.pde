public class Flipper{
  
  float fixX;
  float fixY;
  float moveX;
  float moveY;
  float t;
  boolean left;
  boolean flipped;
  
  public Flipper(float a, float b,float c,float d,boolean l){
    fixX=a;
    fixY=b;
    moveX=c;
    moveY=d;
    t=-0.35;
    left = l;
    flipped = false;
  }
  
  boolean getFlipped(){
    return flipped;
  }
  
  void setFlipped(boolean j){
    flipped = j;
  }
  
  void display(){
    line(fixX,fixY,moveX,moveY);
  }
  

  
  void increaseT(){
    if(t<0.50){
      t+=0.10;}
  }
  
  void decreaseT(){
     if(t>-0.25){
       t-=0.10;
     }
     else{
      flipped = false;}
  }
  void flip(){
   if(left){
      moveX = -70*cos(-t)+fixX;
      moveY = 70*sin(-t)+fixY;}
    else{
      moveX = 70*cos(-t)+fixX;
      moveY = 70*sin(-t)+fixY;}
  }

 boolean collisionFH(Ball b){
   float P1X=fixX-b.getX();
   float P1Y=fixY-b.getY();
   float P2X=moveX-b.getX();
   float P2Y=moveY-b.getY();
   float MinusX=P2X-P1X;
   float MinusY=P2Y-P1Y;
   float a = MinusX*MinusX+MinusY*MinusY;
   float d = 2*(MinusX*P1X+MinusY*P1Y);
   float c = P1X*P1X+P1Y*P1Y-100;
   float delta = d*d - (4*a*c);
   if(delta ==0){
     return true;}
     return false;
 }
   
 
  void collisionF(Ball b){
    if(collisionFH(b)){
      b.changeSpeed();
    }
  }
    
 
}