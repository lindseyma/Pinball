class Ball{

    private float x;
    private float y;
    private float ax;
    private float ay;
    private float  weight;
    public Ball(){
      x=250;
      y=150;
      ax=2;
      ay=-2;
      weight=0.25;
    }
    
    float getX(){
        return x;}
    float getY(){
        return y;}

    void BounceWall(){
      if(x+ax>380||x+ax<120){
        ax=-ax;}
      if(y+ay>680||y+ay<120){
        ay=-ay;}
    }
      void bounce(){
        y+=ay;
        x+=ax;
        ay+=weight; //<>//
      }
       
      void changeSpeed(){
        ax=-ax;
        ay=-ay;
      }
    public void display(){
      ellipse(x, y, 20, 20);    
}
    
}