public class Flipper{
  
  float fixX;
  float fixY;
  float size;
  boolean flipped;
  boolean up;
  
  
  public Flipper(float x, float y, float size){
    this.size = size;
    fixX = x;
    fixY = y;
  }
  
  public void display(float x, float y, float size){
    //rect(fixX, fixY, size, 5);
    if(!up){
    rect(x, y, size, 5);
    }
    println(up);
  }
  
  //popmatrix
  public void flip(){
    if(!flipped){
      flipped = true;
      up = true;
      pushMatrix();
      translate(fixX,fixY);
      rotate(radians(330));
      //rect(fixX,fixY,size,25);
      rect(0,0,size,5);
      popMatrix();
      println("flipp");
    }
  }

  public void unflip(){
    if(flipped){
      flipped = false;
      up = false;
    }
  }
  //}
}