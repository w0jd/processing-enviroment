class Body {
  PVector position, velocity, acceleration,angle, angleVelocity, amplitude;
  float mass, r, maxspeed, maxforce;
  
  Body(float x, float y, float m) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.mass=m;
        this.angle = new PVector();
      this.angleVelocity = new PVector(random(-0.03, 0.03), random(-0.03, 0.03));
    this.amplitude = new PVector(
     random(0.1,mass*0.08),random(0.15,mass*0.09));
      //random(20, height / 2)
    this.maxspeed=4;
     this.maxforce= 0.1;

    
    println( this.angleVelocity);
    this.r = sqrt(this.mass) * 3;
  }
    void bounce(){
        this.velocity.add(this.acceleration);
        //PVector x,y;
        //PVector vecx= new PVector(1,0);
        //PVector vecy= new PVector(0,1);
        ////float pos_x=vecx.cross(1,0);

        if (position.x < 0) {
          position.x = 0;
          velocity.x *= -0.5;
        } else if (position.x > width) {
           position.x = width;
            velocity.x *= -0.5;
        }

  // Odbicie od góry/dołu
         if (position.y < 0) {
            position.y = 0;
            velocity.y *= -0.5;
          } else if (position.y > height) {
              position.y = height;
            velocity.y *= -0.5;
          }
        //float pos_y=vecx.cross(0,1);
    //this.velocity.rotate(PI*3);    


    this.position.add(this.velocity);
    
    this.acceleration.set(0, 0);
  
  }
  void attract(Prey body) {
  
    PVector force = PVector.sub(this.position, body.position);
    float d = constrain(force.mag(), 5, 25);
    float G = 0.09;
    float strength = -(G * (this.mass * body.mass)) / (d * d);
    force.setMag(strength);
    body.applyForce(force);
  }
 void findNearestPrey(Prey[] preys){
   float minDist;
   for(int i=0;i<10;i++){
       float dst=PVector.dist(preys[i].position,this.position);
       
   }
 }
  void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  void trace(PVector target){
    PVector desired = PVector.sub(target, this.position); // A vector pointing from the location to the target
    float d = desired.mag();
    if (d < 100) {
      float m = map(d, 0, 100, 0, this.maxspeed);
      desired.setMag(m);
    } else {
      desired.setMag(this.maxspeed);
    }
  PVector steer = PVector.sub(desired, this.velocity);
  this.acceleration.add(steer);
  }

  void update() {
         this.angle.add(this.angleVelocity);

    float x = sin(this.angle.x) * this.amplitude.x;
    float y = sin(this.angle.y) * this.amplitude.y;
    PVector oscilation;
    oscilation = new PVector (x,y);
    
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxspeed);
    this.position.add(this.velocity);
    //this.position.add(oscilation);
    this.acceleration.set(0, 0);
  }
 
  void show() {
    stroke(0);
    strokeWeight(2);
    fill(227, 100,100);
    circle(this.position.x, this.position.y, this.r * 4);
  }
}
