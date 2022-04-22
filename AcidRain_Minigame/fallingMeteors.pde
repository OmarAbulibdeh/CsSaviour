class Meteor{

  public int xCor; // public is the new variable command leanrt
  public int yCor;     // all fields and methods are public unless otherwise specified by the private keyword.
  public int w;
  public int h;

  Meteor(int xVal, int yVal, int wVal, int hVal){
    xCor = xVal;
    yCor = yVal;
    w = wVal;
    h = hVal;
    
  } 
  
  public void drop(float speed){  // the speed of thefalling Meteor
    yCor += speed;
  }
  
  public void display(){
    fill(0, 100, 0);
    rect(xCor, yCor,w,h,5);
  }
}
