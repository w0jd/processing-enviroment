class Prey {
  PVector position, velocity, acceleration,angle, angleVelocity, amplitude;
  float mass, r;
  
  Prey(float x, float y, float m) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.mass = m;
    this.r = sqrt(this.mass) * 2.5;
    this.angle = new PVector();
      this.angleVelocity = new PVector(random(-0.03, 0.03), random(-0.03, 0.03));
    this.amplitude = new PVector(
     random(0.1,mass*0.2),random(0.15,mass*0.3)  );
  }
  
  void attract(Body body) {
    PVector force = PVector.sub(this.position, body.position);
    float d = constrain(force.mag(), 5, 25);
    float G = 0.2;
    float strength = (G * (this.mass * body.mass)) / (d * d);
    force.setMag(strength);
    body.applyForce(force);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }



  void update() {
      this.angle.add(this.angleVelocity);

    float x = sin(this.angle.x) * this.amplitude.x;
    float y = sin(this.angle.y) * this.amplitude.y;
    PVector oscilation;
    oscilation = new PVector (x,y);
    this.velocity.add(this.acceleration);
        this.position.add(oscilation);
    this.position.add(this.velocity);
    this.acceleration.set(0, 0);
    
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
  void show() {
    stroke(0);
    strokeWeight(2);
    fill(127, 100);
    circle(this.position.x, this.position.y, this.r * 4);
  }
}
