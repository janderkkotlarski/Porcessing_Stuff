float dimens, dimints;

float pos_x = 0, pos_y = 0, pos_z = 0;
float delpos;
float phi_x = 0, phi_y = 0, phi_z = 0;
final float delphi = 0.01*PI;

final int col_max = 250;

int col_nu = 0;

void setup()
{
  size(600, 600, P3D);
  
  colorMode(HSB, col_max);
  
  dimens = 0.25*(width + height);
  pos_x = dimens;
  pos_y = dimens;
  pos_z = dimens;
  delpos = 0.1*dimens;
  
  noStroke();
 }

void keying()
{
  if (keyPressed)
  {
    if (key == 'a' || key == 'A')
    { pos_x += delpos; }
    
    if (key == 'd' || key == 'D')
    { pos_x -= delpos; }
    
    if (key == 'e' || key == 'E')
    { pos_y += delpos; }
    
    if (key == 'q' || key == 'Q')
    { pos_y -= delpos; }
    
    if (key == 'w' || key == 'W')
    { pos_z += delpos; }
    
    if (key == 's' || key == 'S')
    { pos_z -= delpos; }
    
    if (key == 'i' || key == 'I')
    { phi_x += delphi; }
    
    if (key == 'k' || key == 'K')
    { phi_x -= delphi; }
    
    if (key == 'l' || key == 'L')
    { phi_y += delphi; }
    
    if (key == 'j' || key == 'J')
    { phi_y -= delphi; }
    
    if (key == 'o' || key == 'O')
    { phi_z += delphi; }
    
    if (key == 'u' || key == 'U')
    { phi_z -= delphi; }
  }
  
  
}

void draw()
{  
  translate(pos_x, pos_y, pos_z);
  
  rotateX(phi_x);
  rotateY(phi_y);
  rotateZ(phi_z);
  
  background(0);
  
  for (int count_x = 0; count_x < 3; ++count_x)
  {
    for (int count_y = 0; count_y < 3; ++count_y)
    {
      for (int count_z = 0; count_z < 3; ++count_z)
      {
        if (count_x != 1 || count_y != 1 || count_z != 1)
        {
          cuboid(0.5*dimens,
                (2*(count_x - 1))*dimens,
                (2*(count_y - 1))*dimens,
                (2*(count_z - 1))*dimens,
                color(col_nu, col_max, col_max));
        }
      }
    }
  }
  
  ++col_nu;
  
  col_nu %= col_max;
  
  keying();
}

void cuboid(final float dimenz, final float pos_x,
            final float pos_y, final float pos_z,
            final color chroma)
      {
        fill(chroma);
        pushMatrix();
        translate(pos_x, pos_y, pos_z);
        box(dimenz);
        popMatrix();        
      }