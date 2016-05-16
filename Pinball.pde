void setup(){
    size(500, 700);
}

int score;

void gameSetup(){
    score = 0;
   // b = new Ball();
}

//Ball b;

void draw(){
    /*
    if(screen == 0){
        menu();
    }
    if(screen == 1){
        gameScreen();
    }*/
    Ball b = new Ball();  
    b.display();
    b.BounceWall();
    b.ChangeXY();
}

void menu(){
    
}

void gameScreen(){
  
};