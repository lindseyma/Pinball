class Bouncer{
  private float x;
  private float y;
  float rad;
  color c;
  
  //round bouncers
  
  public Bouncer(float a,float b, float rad, color co){
    x=a;
    y=b;
    this.rad = rad;
    c=co;
  }


  boolean Collision(Ball b){
    float d = dist(x,y,b.getX(),b.getY());
    if(d > rad + 10){
      return false;
    }
    else{
      return true;
    }
  }
  
  void CollisionH(Ball b){
    if(Collision(b) == true){
      b.Move();
      score+=1;
      if(dist(x,y,b.getX(),b.getY())>rad+30){
        b.changeSpeed();}
    }
  }
    
  public void display(){
    
    fill(c);
    ellipse(x,y,rad*2, rad*2);
  }
}