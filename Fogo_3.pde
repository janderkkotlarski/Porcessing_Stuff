
void setup()
{
  size(600, 600);
  stroke(255);
  noFill();
  background(0);
    
  arc(300, 400, 344, 344, 1*PI, 2*PI);
  arc(214, 252, 344, 344, -PI/3, 2*PI/3);
  arc(386, 252, 344, 344, PI/3, 2*PI*(1-1.0/3.0));
}

void draw()
{
}