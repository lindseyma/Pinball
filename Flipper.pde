public class Flipper{
  
  float fixX;
  float fixY;
  float size;
  boolean flipped;
  boolean up;
  boolean left;
  int lflip=-25, rflip=25;
  
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
        rotate(-radians(lflip));
        if(up && lflip<50){
          lflip+=5;
        }
        else if(lflip ==50){
          up=false;}
        if(!up&&lflip>-25){
          lflip-=5;}
        rect(0,0,size,5);
      }
      else{
        translate(fixX + size+25, fixY+5);
        rotate(-radians(rflip));
        if(up && rflip>-50){
          rflip-=5;
        }
        else if(rflip == -50){
          up=false;}
        if(!up &&rflip<25){
          rflip+=5;}
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