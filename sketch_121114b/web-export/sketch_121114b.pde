float counter = 0.0;
float SPEED = 0.05;

void setup(){
size(400, 400);
noStroke();
}

void draw(){
  background(0);
fill(255, 255, 0);
arc(200, 200, 250, 250, PI/3 - cos((PI * counter)/3), PI * 5/3 + cos((PI * counter)/3)); //x, y, width, height, start radians, end radians
fill(0);
ellipse(175, 150, 20, 20);
println("cos() counter  = " + cos(counter));
counter += SPEED;

}

