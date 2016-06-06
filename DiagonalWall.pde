public class DiagonalWall{
  float ax;
  float ay;
  float bx;
  float by;
  boolean left;
  
  public DiagonalWall(float a,float b,float c,float d,boolean t){
    ax=a;
    ay=b;
    bx=c;
    by=d;
    left = t;
  }
  
  void display(){
    line(ax,ay,bx,by);}
    
  boolean collisionDiaH(Ball b){
    float a = dist(ax,ay,b.getX(),b.getY());
    //println ("a: " +a );
   float d = dist(bx,by,b.getX(),b.getY());
   //println("b: "+d);
   float c = dist(ax,ay,bx,by);
   float s = (a+d+c)/2;
   float Area = sqrt(s*(s-a)*(s-d)*(s-c));
   //println("area: "+ Area);
   float h = (2*Area)/c;
   //println("height: " + h);
   if(h<=10){
     if(left){
       if(ax<b.getX() && bx>b.getX()){
         return true;}}
     else{
       if(ax>b.getX() && bx<b.getX()){
         return true;}}
   }
    return false;
  }
  
  void collisionDia(Ball b){
    if(collisionDiaH(b)){

        b.changeSpeedDia(left);}

    }
  
  
}