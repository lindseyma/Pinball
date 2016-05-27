class Bouncer{
  private int x;
  private int y;
  
  public Bouncer(int a,int b){
    x=a;
    y=b;
}

  void Collision(Ball b){
    
      float absX=Math.abs(b.getX() - x);
      float absY=Math.abs(b.getY() - y);
      double dist = absX*absX+absY*absY;
      if(dist<=(50*50)){
          b.changeSpeed();
          score+=1;
      } 
  }

  public void display(){
    ellipse(x,y,50,50);
  }
}