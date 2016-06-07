public class Platform{
  float ax;
  float ay;
  float bx;
  float by;
  float h;
  boolean back=false;
  
  void display(){
    line(ax,ay,bx,by);
  }
    
  void moveTo(){
    if(!back&&ax>125&&bx<385){
      ax++;
      bx++;}
    if(bx==380){
      back=true;}
  }
  
  void moveBack(){
    if(back&&ax>125&&bx<385){
      ax--;
      bx--;
    }
    if(ax==130){
      back=false;}
  }
  public Platform(float a,float b,float c,float d){
    ax=a;
    ay=b;
    bx=c;
    by=d;
  }
  
  boolean CollisionPH(Ball b){
    
    float a = dist(ax,ay,b.getX(),b.getY());
    //println ("a: " +a );
   float d = dist(bx,by,b.getX(),b.getY());
   //println("b: "+d);
   float c = dist(ax,ay,bx,by);
   float s = (a+d+c)/2;
   float Area = sqrt(s*(s-a)*(s-d)*(s-c));
   //println("area: "+ Area);
   h = (2*Area)/c;
   //println("height: " + h);
   if(h<=15){
     if(ax<b.getX() && bx>b.getX()){
         return true;}}
     return false;}
     
    void CollisionP(Ball b){
    if(CollisionPH(b) == true){
      b.Move();
      score+=1;
      if(h>20){
        b.changeSpeed();}
    }
  }
  
}