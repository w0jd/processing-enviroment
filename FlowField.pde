
class FlowField {
  int resolution;
  int rows, cols;
  PVector [][]field;
  int riverStart;
  int riverEnd;
  int hillStart, hillEnd, hillHeight, hillHeightEnd;
  
  FlowField(int r) {
    this.resolution = r;
    //{!2} Determine the number of columns and rows.
    this.cols = width / this.resolution;
    this.rows = height / this.resolution;
    //{!4} A flow field is a two-dimensional array of vectors. The example includes as separate function to create that array
    riverStart= int(random(0,int(cols)-5));
    riverEnd=riverStart+10;
              //print(riverStart);
    //hillStart
    this.field = new PVector[cols][rows];
     hillHeight=int(random(0,rows-10));
        if(riverEnd<=19){
        hillStart=int(random(riverEnd-5,int(cols)));
        
        }else if(riverEnd>=cols-10){
        hillStart=int(random(0,riverStart));
        }
        hillEnd=hillStart+10;
    this.init();
  }

  void init() {
    // Reseed noise for a new flow field each time
    noiseSeed((long)(random(10000)));
    float xoff = 0;
    for (int i = 0; i < this.cols; i++) {
      float yoff = 0;
      for (int j = 0; j < this.rows; j++) {
        //{.code-wide} In this example, use Perlin noise to create the vectors.
        float angle = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        if(i>=riverStart && i<=riverEnd)
        {
          angle=map(noise(xoff, yoff), 0, 1, 0, PI);
          //print(riverStart);
          
        }
        this.field[i][j] = PVector.fromAngle(angle);
       
        //print("\n");
        //print(hillStart);
        //print("\n");
        //       print(hillHeight);     
        //       print("\n");

        if(i>=hillStart && i<=hillEnd&& j>=hillHeight && j<=hillHeight+10)
        {
          //print(riverStart);
//var x = i * width / cols;

//var y = j * height / rows;

//field[i][j] = new PVector(hillStart+5-x, hillHeight+5 - y);

//field[i][j].rotate(PI / 2);

          
        }
        
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  // Draw every vector
  void show() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        float w = width / this.cols;
        float h = height / this.rows;
        PVector v = this.field[i][j].copy();
        v.setMag(w * 0.5);
        float x = i * w + w / 2;
        float  y = j * h + h / 2;
        strokeWeight(1);
        line(x, y, x + v.x, y + v.y);
      }
    }
  }

  PVector lookup(PVector position) {
    int column = constrain(floor(position.x / this.resolution), 0, this.cols - 1);
    int row = constrain(floor(position.y / this.resolution), 0, this.rows - 1);
    return this.field[column][row].copy();
  }
}
