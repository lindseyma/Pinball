class Ball{ //<>// //<>//

    //public int lives;
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
        y+=ay; //<>//
        x+=ax; //<>//
        ay+=weight;
      }
       
      void Move(){
        ay=-ay;
        ax=-ax;
        
      }
      
      void changeSpeed(){
        ay=0.95*-ay;
        ax=0.95*-ax;
      }
      
      void changeSpeedDia(boolean left){
        if(left){
          ax=-1;
          ay=-ay;}
        else{
          ax=1;
          ay=-ay;}
      }
      
     void roll(){
       ax=-ax;
       ay=-(ay/1.20);
     }
      
      void launchUp(float power){
        power=power/50;
        ay-=power;
        y+=ay;
        x-=0.15;
        ay+=weight;
        playing = true;
        
       // println("working");
      }

      void display(){
      fill(255,255,255);
      ellipse(x, y, 20, 20);    
}
    
}