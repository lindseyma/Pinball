public class Wall{
  float ax;
  float ay;
  float bx;
  float by;
  
  public Wall(float a, float b, float c, float d){
    ax = a;
    ay = b;
    bx = c;
    by = d;
  }
  
  void display(){
    line(ax, ay, bx, by);
  }
  
  void walling(Ball b){
    if(ax == bx){ //vert lines
        if(b.x - 10 <= ax && b.x + 10 >= ax && b.y > ay && b.y < by){
          b.ax = -b.ax;
        }
    }
    if(ay == by){
        if(b.y - 10 <= ay && b.y + 10 >= ay && b.x < bx && b.x > ax){
          b.ay = -b.ay;
        }
    }
  }
  
}