// Mutual Attract// The Nature of Code
// Gravitational Attraction
// The Nature of Code
// The Coding Train / Daniel Shiffman
// https://youtu.be/EpgB3cNhKPM
// https://thecodingtrain.com/learning/nature-of-code/2.5-gravitational-attraction.html
// https://editor.p5js.org/codingtrain/sketches/MkLraatd


// Gravitational Attraction
// The Nature of Code
// The Coding Train / Daniel Shiffman
// https://youtu.be/EpgB3cNhKPM
// https://thecodingtrain.com/learning/nature-of-code/2.5-gravitational-attraction.html
// https://editor.p5js.org/codingtrain/sketches/MkLraatd

Body[] hunters = new Body[10];
Prey[] preys = new Prey[10];
Food[] foods = new Food[10];

float G = 1;


void setup() {
  size(640, 360);
  //bodyA = new Body(320, 60);
  //bodyB = new Prey(320, 300);
  //food = new Food(floor(random(640)),floor(random(260)));
  //food.velocity=new PVector(1,0);
  //bodyA.velocity = new PVector(1, 0);
  //bodyB.velocity = new PVector(-1, 0);
  for (int i = 0; i < 10; i++) {
    
    hunters[i] = new Body(random(width), random(height), random(2, 3));
      preys[i] = new Prey(random(width), random(height), random(1.5, 2.5));
        foods[i] = new Food(random(width), random(height), random(1.1, 2.0));

      }
}

void draw() {
  background(255);
  for (int i = 0; i <10; i++) {
    for (int j = 0; j < 10; j++) {
    //PVector force = preys[j].attract(hunters[i]);
  
    hunters[i].findNearestPrey(preys);
    hunters[i].attract(preys[i]);
        preys[i].attract(hunters[i]);
        foods[i].attract(preys[i]);
    if(j!=i){
    
      hunters[i].separate(hunters[j]);
    }
    //PVector force = hunters[j].attract(preys[i]); 
    //preys[i].applyForce(force); 
    //PVector force = foods[i].attract(preys[i]); 
    //preys[i].applyForce(force);
    hunters[i].update();
    hunters[i].show();

    preys[i].update();
    preys[i].show();

    //foods[i].update();
    foods[i].show();
      if (preys[i].position.x<0){
    //preys[i].velocity.mult(0);
  //preys[i].position.x=640;
        //preys[i].velocity.mult(0.5);
    preys[i]=null;
        preys[i] = new Prey(random(width), random(height), random(1.5, 2.5));

  }
   if (preys[i].position.x>640){
    //preys[i].position.x=0;
    preys[i]=null;
        preys[i] = new Prey(random(width), random(height), random(1.5, 2.5));

        //preys[i].velocity.mult(0.5);

     //preys[i].position.x=640;
  }
  if (preys[i].position.y<0){
        //preys[i].velocity.mult(0.5);

  //preys[i].position.y=360;
   preys[i]=null;
        preys[i] = new Prey(random(width), random(height), random(1.5, 2.5));
  }
   if (preys[i].position.y>360){
  //preys[i].position.y=0;

      //preys[i].velocity.mult(0.5);
       preys[i]=null;
        preys[i] = new Prey(random(width), random(height), random(1.5, 2.5));
      
    }
      if((hunters[i].position.y >370) || (hunters[i].position.y <-10) ||(hunters[i].position.x>650)||(hunters[i].position.x<-10)){
   //bodyB=null;
   //bodyB = new Prey(floor(random(640)), floor(random(360)));
      hunters[i].bounce();
  }
  }
}
}


//  }

//  bodyB.attract(bodyA);
//  bodyA.attract(bodyB);
//  food.attract(bodyB);
//  food.show();
//  bodyB.update();
//  bodyB.show();
//  bodyA.update();
//  bodyA.show();
//  bodyB.update();
//  bodyB.show();
