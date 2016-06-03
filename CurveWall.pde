public class CurveWall{
  
  int ax;
  int ay;
  int bx;
  int by;
  int cx;
  int cy;
  int dx;
  int dy;
  
 public CurveWall(int ax, int ay, int bx, int by, int cx, int cy, int dx, int dy){
   this.ax = ax;
   this.ay = ay;
   this.bx = bx;
   this.by = by;
   this.cx = cx;
   this.cy = cy;
   this.dx = dx;
   this.dy = dy;
 }
 
  public void display(){
    curve(ax, ay, bx, by, cx, cy, dx, dy);
  }
  
  //public void cWalling(Ball b){
    
  
}