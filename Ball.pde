class Ball{ //<>//

    private float x;
    private float y;
    private float ax;
    private float ay;
    private float  weight;
    public Ball(){
      x=380;
      y=580;
      ax=1;
      ay=-1;
      weight=0.20;
    }
    
    float getX(){
        return x;}
    float getY(){
        return y;}

    /*void BounceWall(){
      if(x+ax>390||x+ax<120){
        ax=-ax;}
      if(y+ay>590||y+ay<120){
        ay=-ay;}
    }*/
      void bounce(){
        y+=ay;
        x+=ax; //<>//
        ay+=weight;
      }
       
      void changeSpeed(){
        ax=-ax;
        ay=-ay;
      }
      
      
      void launchUp(float power){
        power=power/50;
        ay-=power;
        y+=ay;
        x-=0.15;
        ay+=weight;
      }

      void display(){
      ellipse(x, y, 20, 20);    
}
    
}