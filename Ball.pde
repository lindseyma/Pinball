class Ball{

    private int x;
    private int y;
    private int ax;
    private int ay;
    private int weight;
    public Ball(){
      x=250;
      y=680;
      ax=5;
      ay=-5;
      weight=0.25;
    }
    
    int getX(){
        return x;}
    int getY(){
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
      }
      void changeSpeed(){
         ax=-ax;
         ay=-ay;
         ay+=weight;
      }
        
    public void display(){
      ellipse(x, y, 20, 20);    
}
    
}