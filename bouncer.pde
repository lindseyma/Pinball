class Bouncer{
  private float x;
  private float y;
  float rad;
  
  //round bouncers
  
  public Bouncer(float a,float b, float rad){
    x=a;
    y=b;
    this.rad = rad;
}
/*
  void Collision(Ball b){
    
      float absX=Math.abs(b.getX() - x);
      float absY=Math.abs(b.getY() - y);
      double dist = absX*absX+absY*absY;
      if(dist<=(50*50)){
          b.changeSpeed();
          score+=1;
      } 
  }
*/

  boolean Collision(Ball b){
    float d = abs(rad-10);
    if(d > rad + 10){
      return false;
    }
    else{
        return true;
      }
    }
  
      
    
  public void display(){
    ellipse(x,y,50,50);
  }
}