float SPEED = 0.04; //global speed
float counter = 0.0; //keep global for all planets to use
Planet testPlanet = new Planet(400, 400, 80,50, 10); //originx, originy, size, radius, speed
Satellite satellite = new Satellite(testPlanet, 30, 100, 10); //target, size, radius, speed

void setup(){
  size(800, 800);
}

void draw(){
  background(211);
  
  //update each planet
  testPlanet.update();
  testPlanet.display();
  
  satellite.update();
  satellite.display();
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
  Planet target;  
  
  Planet(){
    //default constructor. It seems like this is necessary to extend the class
  }
  
  Planet(int _originx, int _originy, int _size, int _radius, float _speed){
    originx = _originx;
    originy = _originy;
    radius = _radius;
    size = _size;
    speed = _speed;   
  } 
  
  void display(){
    ellipse(x,y, size, size);
  }
  
  void update(){
    //rotate around the origin
    x = int(originx + cos(counter) * radius);
    y = int(originy + sin(counter) * radius);
    
    //this is where a local counter should be updated with the local speed
  }

  int[] getPosition(){//use this function so the planets can get their positions
    int[] pos = new int[2];
    pos[0] = x;
    pos[1] = y;
    return pos; //return x, y in an array
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
  }  
 
 void update(){
   originx = target.getPosition()[0];
   originy = target.getPosition()[1];
   
    x = int(originx + cos(counter) * radius);
    y = int(originy + sin(counter) * radius);
 } 
}