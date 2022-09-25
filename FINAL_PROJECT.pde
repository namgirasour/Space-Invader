////Alex Nguyen <an3698@bard.edu>
//05/23/2022
//CMSC 141
//Final Project
//Comments/Reflections:
//Collaboration Statement: I worked alone  on this assignment [with assistance from 
//https://processing.org/tutorials/typography
//https://processing.org/tutorials/objects
//https://processing.org/reference/loadImage_.html
//https://stackoverflow.com/questions/70208656/space-invader-project
//https://www.youtube.com/watch?v=4t5sBQcndDQ&list=PLB43ED284773BCE4D&index=7]

int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player player;
ArrayList aliens = new ArrayList();
ArrayList bullets = new ArrayList();
int direction = 1;
boolean incy = false;
int score = 0;
PFont f;
int state;

Timer timer;

void setup() {
  timer = new Timer();
  state = 1;


    background(0);
    noStroke();
    size(800, 550);
    player = new Player();
    
    createaliens();
    f = createFont("Arial", 36, true);
}

void draw() {
 
if (state == 1){
  textAlign(CENTER);
  text("SPACE INVADER", 390,250);
  text ("PRESS ANY KEY TO START", 390, 290);
  text ("Press Up Key to shoot", 390, 270);
}
if (keyPressed == true){
    state=2;
}else if (score == 360){
  state=4;
} else if (timer.time == 0){
  state =3;
}

 
 if (state == 3){
  background(0);
  text("Game Over", 390, 170);
} else if (state == 4){
  background(0);
  text("You Win", 390, 170);
}

  if (state == 2){
    background(0);
    timer.draw();
    drawScore();
    
    player.draw();
    
    for (int i = 0; i < bullets.size(); i++) {
        Bullet bullet = (Bullet) bullets.get(i);
        bullet.draw();
    }

    for (int i = 0; i < aliens.size(); i++) {
        Alien Alien = (Alien) aliens.get(i);
        if (Alien.outside() == true) {
            direction *= (-1);
            incy = true;
            break;
        }
    }

    for (int i = 0; i < aliens.size(); i++) {
        Alien Alien = (Alien) aliens.get(i);
        if (!Alien.alive()) {
            aliens.remove(i);
        } else {
            Alien.draw();
        }
    }

    incy = false;
  }
}
  

void drawScore() {
    textFont(f);
    text("Score: " + String.valueOf(score), 300, 50);
}

void createaliens() {
    for (int i = 0; i < width/gridsize/3; i++) {
        for (int j = 0; j <= 5; j++) {
            aliens.add(new Alien(i*gridsize, j*gridsize + 70));
        }
    }
 
}
