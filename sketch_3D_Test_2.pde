float dimens, dimints;

void setup()
{
  size(600, 600, P3D);
  
  dimens = 0.25*(width + height);
  translate(1.0*dimens, 1.0*dimens, -3.0*dimens);
  
  dimens = 0.25*(width + height);
  
  fill(0, 63, 127);
  stroke(255, 0, 0);
  strokeWeight(0.05*dimens);
  
  
  rotateX(0.5);
  rotateY(0.7);
  rotateZ(0.5);
  
  
  
}

void draw()
{
  translate(1.0*dimens, 1.0*dimens, -3.0*dimens);
  
  background(0);
  
  for (int count_x = 0; count_x < 2; ++count_x)
  {
    for (int count_y = 0; count_y < 2; ++count_y)
    {
      for (int count_z = 0; count_z < 2; ++count_z)
      {
        cuboid(0.9*dimens, (2*count_x - 1)*dimens,
               (2*count_y - 1)*dimens, (2*count_z - 1)*dimens);
      }
    }
  }
}

void cuboid(final float dimenz, final float pos_x,
      final float pos_y, final float pos_z)
      {
        beginShape();
          vertex(pos_x - dimenz, pos_y - dimenz, pos_z - dimenz);
          vertex(pos_x + dimenz, pos_y - dimenz, pos_z - dimenz);
          vertex(pos_x + dimenz, pos_y + dimenz, pos_z - dimenz);    
          vertex(pos_x - dimenz, pos_y + dimenz, pos_z - dimenz);
        endShape();
        
        beginShape();
          vertex(pos_x - dimenz, pos_y - dimenz, pos_z + dimenz);
          vertex(pos_x + dimenz, pos_y - dimenz, pos_z + dimenz);
          vertex(pos_x + dimenz, pos_y + dimenz, pos_z + dimenz);    
          vertex(pos_x - dimenz, pos_y + dimenz, pos_z + dimenz);
        endShape();
        
        beginShape();
          vertex(pos_x - dimenz, pos_y - dimenz, pos_z + dimenz);
          vertex(pos_x + dimenz, pos_y - dimenz, pos_z + dimenz);
          vertex(pos_x + dimenz, pos_y - dimenz, pos_z - dimenz);    
          vertex(pos_x - dimenz, pos_y - dimenz, pos_z - dimenz);
        endShape();
        
        beginShape();
          vertex(pos_x + dimenz, pos_y - dimenz, pos_z + dimenz);
          vertex(pos_x + dimenz, pos_y + dimenz, pos_z + dimenz);
          vertex(pos_x + dimenz, pos_y + dimenz, pos_z - dimenz);    
          vertex(pos_x + dimenz, pos_y - dimenz, pos_z - dimenz);
        endShape();
        
        beginShape();
          vertex(pos_x + dimenz, pos_y + dimenz, pos_z + dimenz);
          vertex(pos_x - dimenz, pos_y + dimenz, pos_z + dimenz);
          vertex(pos_x - dimenz, pos_y + dimenz, pos_z - dimenz);    
          vertex(pos_x + dimenz, pos_y + dimenz, pos_z - dimenz);
        endShape();
        
        beginShape();
          vertex(pos_x - dimenz, pos_y + dimenz, pos_z + dimenz);
          vertex(pos_x - dimenz, pos_y - dimenz, pos_z + dimenz);
          vertex(pos_x - dimenz, pos_y - dimenz, pos_z - dimenz);    
          vertex(pos_x - dimenz, pos_y + dimenz, pos_z - dimenz);
        endShape();
        
      }