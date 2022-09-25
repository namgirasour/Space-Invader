class Timer{
int begin; 
int duration = 30;
int time = 30;

void setup() {
  size(600, 600); 
  begin = millis();   
}

void draw() {
  background(0); 
  if (time > 0){  
    time = duration - (millis() - begin)/1000;
    text(time, 80, 80);
}
}
}
