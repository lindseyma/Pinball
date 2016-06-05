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
    else{
      float heroA = distance(ax, ay, bx, by);
      float heroB = distance (ax, ay, b.x, b.y);
      float heroC = distance(bx, by, b.x, b.y);
      
      float s = (heroA + heroB + heroC)/2;
      float area = sqrt(s*(s-heroA)*(s-heroB)*(s-heroC));
      float height = (2*area)/heroA;
      if(height == 10){
        b.changeSpeed();
      }
      
      //System.out.println("height" + height);
     // System.out.println("heroA" + heroA);
    }
  }
  
  float testdist(){
    return distance(3, 0, 0, 4);
  }
  
  float distance(float a, float b, float x, float y){
    return sqrt(sq(a-x)+(sq(b-y)));
  }
  
    
  
}