float SPEED = 0.04; //global speed
float counter = 0.0; //keep global for all planets to use
Planet testPlanet = new Planet(400, 400, 80, 30);
//Satellite satellite = new Satellite(testPlanet, 5, 10.0);


void setup(){
  size(800, 800);
}

void draw(){
  background(211);
  
  //update each planet
  testPlanet.update();
  testPlanet.display();
  
  //satellite.update();
  //satellite.display();
  counter += SPEED;
}

class Planet{
  int x;
  int y;
  int size;
  int radius;
  float speed;
  Planet target;  
  
  Planet(){
    //placeholder
  }
  
  Planet(int _x, int _y, int _size, float _speed){
    x = _x; //origin if no planet available
    y = _y; //same as above
    size = _size;
    speed = _speed;   
  } 
  
  void display(){
    ellipse(x + cos(counter) * size,y + sin(counter) * size, size, size);
  }
  
  void update(){
    //rotate around the origin
    //check if planet is set, and if so, set X to target.getPosition()[0], y to target.getPosition()[1]
  }

  int[] getPosition(){//use this function so the planets can get their positions
    println("fired");
    int[] pos = new int[2];
    pos[0] = x;
    pos[1] = y;
    return pos; //return x, y in an array
  }  
}

class Satellite extends Planet{
  Satellite(Planet target, int _size, float _speed){
     x = target.getPosition()[0];
     y = target.getPosition()[1];
     size = _size;
     speed = _speed;
  }  
  
  void display(){
    println("target x = " + target.getPosition()[0] + ", target y = " + target.getPosition()[1]);
      x = target.getPosition()[0];
      y = target.getPosition()[1];
  }
}
