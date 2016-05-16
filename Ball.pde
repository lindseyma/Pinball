class Ball{
    private int PositionX;
    private int PositionY;
    private int SpeedX;
    private int SpeedY;
    public Ball(){
     PositionX=250;
     PositionY=680;
    }
    
    public void ChangeXY(){
        PositionX+=SpeedX;
        PositionY+=SpeedY;
    }
    public void BounceWall(){
        if(PositionX<25){
           SpeedX=5;
           SpeedY=5;
        }else if(PositionY<25){
           SpeedY=5;}
         else if(PositionX>475){
           SpeedX=-5;
           SpeedY=5;}
         else if(PositionY>675){
           SpeedY=-5;}
    }
         
    public void display(){
      ellipse(PositionX, PositionY, 30, 30);    
    }
    
}