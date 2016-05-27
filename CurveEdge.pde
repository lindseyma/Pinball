public class Wall{
  public int a;
  public int b;
  public int x;
  public int y;
  public String direction;
  
  public CurveEdge(ax,ay,aa,ab,dir){
    x=ax;
    y=ay;
    a=aa;
    b=ab;
    direction=dir;
  }
  
  void bounce(Ball b){
          int absX=Math.abs(b.getX() - x);
      int absY=Math.abs(b.getY() - y);
      double dist = absX*absX+absY*absY;
      if(dist<=(50*50)){
          b.changeSpeed();
      }
  }
  
  void display(){
    if(direction.equals("LeftDown")){
      arc(x,y,a,b,-PI,-PI/2);
    }
  }
    
    
}