public class Wall{
  public String name;
  public int x;
  public int y;
  
  public wall(ax,ay,nm){
    x=ax;
    y=ay;
    name=nm;
  }
  
  void createWall(){
    if(name.equals("curve"){
      CreateCurveEdge();}
    if(name.equals("horizontal"){
      CreateHorizontalLine();
    }
    if(name.equals("vertical"){
      CreateVerticalLine();
    }
  }
  
  void CreateHorizontalLine(){
    
  
}