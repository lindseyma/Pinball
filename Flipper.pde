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

 /* 
  public Flipper(float x, float y, float size, boolean left){
    this.size = size;
    fixX = x;
    fixY = y;
    this.left = left;
  }
  
  public void display(float x, float y, float size){
    //rect(fixX, fixY, size, 5);
    if(!up){
      if(left == true){
         rect(x, y, size, 5);
      }
      else{
        rect(x, y, size, 5);
      }
    }
  //  println(up);
  }
  
  //popmatrix
  public void flip(){
    if(!flipped){
      flipped = true;
      up = true;
      pushMatrix();
      if(left == true){
        translate(fixX,fixY);
        rotate(radians(330));
        rect(0,0,size,5);
      }
      else{
        translate(fixX + size+25, fixY+5);
        rotate(radians(200));
        rect(0,0,size,5);
      }
      //rect(fixX,fixY,size,25);
      popMatrix();
    //  println("flipp");
    }
  }

  public void unflip(){
    if(flipped){
      flipped = false;
      up = false;
    }
  }
  //}*/
}