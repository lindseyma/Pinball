public class Flipper{
  
  float fixX;
  float fixY;
  float size;
  boolean flipped;
  boolean up;
  boolean left;
  
  
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
  //}
}