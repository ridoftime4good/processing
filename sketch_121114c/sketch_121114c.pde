float SPEED = 0.01; //global speed
float counter = 0.0; //keep global for all planets to use
//Planet testPlanet = new Planet(400, 400, 80,50, 10); //originx, originy, size, radius, speed
//Satellite satellite = new Satellite(testPlanet, 30, 200, -5); //target, size, radius, speed
Planet sun = new Planet(450, 450, 90, 0, 0);
Planet mercury = new Planet(450, 450, 20, 50, 4);
Planet venus = new Planet(450, 450, 40, 125, 1);
Planet earth = new Planet(450, 450, 30, 150, -3);
Planet mars = new Planet(450, 450, 20, 237, 5);
Planet jupiter = new Planet(450, 450, 100, 250, -1);
Planet saturn = new Planet(450, 450, 100, 350, 1);
Planet uranus = new Planet(450, 450, 10, 400, 7);
Planet neptune = new Planet(450, 450, 10, 425, 5);
Satellite moon = new Satellite(earth, 4, 10, 1);

void setup(){
  size(900, 900);
  sun.setColor(255, 255, 0);
  mercury.setColor(170, 170, 170);
  venus.setColor(171,229,0);
  earth.setColor(0, 159, 255);
  mars.setColor(255, 0, 0);
  jupiter.setColor(255, 153, 0);
  saturn.setColor(178, 0, 255);
  uranus.setColor(0, 255, 240);
  neptune.setColor(0,6,255);
  
}

void draw(){
  //background(0);
  fill(0, 0, 0, 10);
  rect(0, 0, 900, 900);
  
  //update each planet
  sun.update();
  mercury.update();
  venus.update();
  earth.update();
  mars.update();
  jupiter.update();
  saturn.update();
  uranus.update();
  neptune.update();
  
  //display each planet
  sun.display();
  mercury.display();
  venus.display();
  earth.display();
  mars.display();
  jupiter.display();
  saturn.display();
  uranus.display();
  neptune.display();
  
  counter += SPEED;
}

/* Planet Class */
class Planet{
  int x; //current position
  int y;
  int originx; //origin
  int originy;
  int size;
  int radius;
  float speed;
  color pColor;
  
  Planet(){
    //default constructor. It seems like this is necessary to extend the class
  }
  
  Planet(int _originx, int _originy, int _size, int _radius, float _speed){
    originx = _originx;
    originy = _originy;
    radius = _radius;
    size = _size;
    speed = _speed;
    pColor = getRandomColor();   
  } 
  
  void display(){
    fill(pColor);
    ellipse(x,y, size, size);
  }
  
  void update(){
    //rotate around the origin
    x = int(originx + cos(counter * speed) * radius);
    y = int(originy + sin(counter * speed) * radius);
    
    //this is where a local counter should be updated with the local speed
  }

  int[] getPosition(){//use this function so the planets can get their positions
    int[] pos = new int[2];
    pos[0] = x;
    pos[1] = y;
    return pos; //return x, y in an array
  }
  void setColor(int r, int g, int b) {
    pColor = color(r, g, b);
  }  
}


/* Satellite class */
class Satellite extends Planet{
  Planet target;
 
 Satellite(Planet _target, int _size, int _radius, float _speed){
    radius = _radius;
    size = _size;
    speed = _speed;
    target= _target;   
    pColor = getRandomColor();
  }  
 
 void update(){
   originx = target.getPosition()[0];
   originy = target.getPosition()[1];
   
    x = int(originx + cos(counter * speed) * radius);
    y = int(originy + sin(counter * speed) * radius);
 } 
}

color getRandomColor(){
    int r = int(random(0, 255));
    int g = int(random(0, 255));
    int b = int(random(0, 255));    
    return color(r, g, b);
}
