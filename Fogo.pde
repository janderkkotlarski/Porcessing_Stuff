

























void setup()
{
  size(600, 600);
  stroke(255);
  noFill();
  background(0);
  
  line(225, 150, 225, 450);
  line(375, 150, 375, 450);
  line(150, 225, 450, 225);
  line(150, 375, 450, 375);
  
  arc(150, 150, 150, 150, 0.5*PI, 2.0*PI);
  arc(450, 150, 150, 150, 1.0*PI, 2.5*PI);
  arc(450, 450, 150, 150, 1.5*PI, 3.0*PI);
  arc(150, 450, 150, 150, 2.0*PI, 3.5*PI);
}

void draw()
{
}