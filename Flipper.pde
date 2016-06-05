public class Flipper{
  
  float fixX;
  float fixY;
  float moveX;
  float moveY;
  float t;
  boolean left;
  boolean flipped;
  boolean up;
  
  public Flipper(float a, float b,float c,float d,boolean l){
    fixX=a;
    fixY=b;
    moveX=c;
    moveY=d;
    t=-0.35;
    left = l;
    flipped = false;
    up=false;
  }
  
  boolean getFlipped(){
    return flipped;
  }
  
  void setFlipped(boolean j){
    flipped = j;
  }
  void setUpF(boolean k){
    up=k;
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
   float a = dist(fixX,fixY,b.getX(),b.getY());
    println ("a: " +a );
   float d = dist(moveX,moveY,b.getX(),b.getY());
   println("b: "+d);
   float c = 70.0;
   float s = (a+d+c)/2;
   float Area = sqrt(s*(s-a)*(s-d)*(s-c));
   println("area: "+ Area);
   float h = (2*Area)/c;
   println("height: " + h);
   if(h<=10){
     if(left){
       if(fixX>b.getX() && moveX<b.getX()){
         return true;}}
     else{
       if(fixX<b.getX() && moveX>b.getX()){
         return true;}}
   }
    return false;
 }
   
 
  void collisionF(Ball b){
    if(collisionFH(b)){

        b.changeSpeed();}

    }
  
    
 
}