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
      weight=10;
    }
    
    int getX(){
        return x;}
    int getY(){
        return y;}

    void BounceWall(){
      if(x+ax>480||x+ax<20){
        ax=-ax;}
      if(y+ay>680||y+ay<20){
        ay=-ay;}
        y+=ay;
        x+=ax;
    }
        
    public void display(){
      ellipse(x, y, 20, 20);    
}
    
}