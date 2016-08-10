final float wind = 600;

void setup()
{
  size(600, 600);
  noFill();
  background(0);
  stroke(255);
  arc(300, 250, 300, 300, -0.23*PI, 0);
  arc(300, 250, 300, 300, -PI, -0.77*PI);
  
  bezier(150, 250, 150, 350, 175, 450, 300, 500);
  bezier(450, 250, 450, 350, 425, 450, 300, 500);
  
  bezier(250, 475, 250, 500, 250, 555, 200, 570);
  bezier(350, 475, 350, 500, 350, 555, 400, 570);
  
  bezier(200, 570, 170, 580, 140, 590, 120, 600);
  bezier(400, 570, 430, 580, 460, 590, 480, 600);
  
  arc(271, 210, 370, 360, -1.05*PI, -0.45*PI);
  arc(329, 210, 370, 360, -0.55*PI, 0.05*PI);
  
  bezier(88.5, 239, 95, 280, 100, 320, 100, 360);
  bezier(511.5, 239, 505, 280, 500, 320, 500, 360);
  
  bezier(100, 360, 100, 440, 70, 520, 70, 600);
  bezier(500, 360, 500, 440, 530, 520, 530, 600);
  
  arc(475, 200, 600, 350, -PI, -0.8*PI);
  arc(125, 200, 600, 350, -0.2*PI, 0);
  
  arc(425, 200, 400, 350, -PI, -0.8*PI);
  arc(175, 200, 400, 350, -0.2*PI, 0);
  
  arc(350, 200, 150, 350, -PI, -0.8*PI);
  arc(250, 200, 150, 350, -0.2*PI, 0);
}

void draw()
{
}