void setup()
{
 size(1000, 700);
 stroke(0);  
}

float win_x = 1000;
float win_y = 700;

float grass_level = 600;
float grass_height = win_y - grass_level;

float pla_t = 25;
float pla_u = 2*pla_t;
float pla_x = 0.5*win_x;
float pla_y = grass_level - pla_t;

final float placc_x = 0;
final float placc_y = 0.5;

float plavv_x = 0;
float plavv_y = 0;

float velo_x = 5;
float velo_y = -11;

boolean key_p = false;

int jumps = 2;

float uno_x = 2.5;
float uno_y = 2;

float tert_x = 5;
float tert_y = 8;

float quint_x = 3;
float quint_y = 3;

void draw()
{
  background(63, 63, 191);
  
  fill(63, 191, 63);  
  rect(0, grass_level, win_x, grass_height);
  
  fill(191, 191, 63);
  for (int count_x = 0; count_x < tert_x; ++count_x)
  {
    for (int count_y = 0; count_y < tert_y; ++count_y)
    {
      rect(pla_u*(uno_x + quint_x*count_x + count_y),
           pla_u*(uno_y + quint_y*count_y), pla_u, pla_u);
    }
  }
  
  fill(191, 63, 63);
  rect(pla_x - pla_t, pla_y - pla_t, pla_u, pla_u);
  
  plavv_y += placc_y;
  pla_y += plavv_y;
  
  
  
  if (keyPressed)
  { 
    if ((key == 'd') || (key == 'e'))
    {
      pla_x += velo_x;
    }
    
    if ((key == 'a') || (key == 'q'))
    {
      pla_x -= velo_x;
    }
      
    if ((jumps > 0) && !key_p &&
        ((key == 'w') || (key == 'e') || (key == 'q')))
    {
      key_p = true;
      pla_y -= 1;
      plavv_y = velo_y;
      --jumps;
    }
    
    if (key == 's')
    {
      if (plavv_y < 0)
      {
        plavv_y = 0;
      }
      
      jumps = 0;
    }
  }
  
  

  if (!keyPressed && key_p)
  {
    key_p = false;
  }
  
  
  while (pla_x < 0)
  {
   pla_x += win_x; 
  }
  
  while (pla_x > win_x)
  {
   pla_x -= win_x; 
  }
  
  if (pla_y + pla_t > grass_level)
  {
    pla_y = grass_level - pla_t;
    plavv_y = 0;
    jumps = 2;
  }
  
  for (int count_x = 0; count_x < tert_x; ++count_x)
  {
    for (int count_y = 0; count_y < tert_y; ++count_y)
    {
      final float cru_x = pla_u*(0.5 + uno_x + quint_x*count_x + count_y);
      final float cru_y = pla_u*(uno_y + quint_y*count_y);
      
      
      if (((pla_y + pla_t) > cru_y) &&
         (pla_y <= (cru_y - cru_x + pla_t + pla_x)) &&
         (pla_y <= (cru_y + cru_x + pla_t - pla_x)))
         {
           pla_y = cru_y - pla_t;
           plavv_y = 0;
           jumps = 2;
         }         
      else if (((pla_y - pla_t) < cru_y + pla_u) &&
         (pla_y > (cru_y - cru_x + pla_t + pla_x)) &&
         (pla_y > (cru_y + cru_x + pla_t - pla_x)))
         {
           pla_y = cru_y + pla_u + pla_t;
           plavv_y = 0;
           // jumps = 0;
         }
      else if (((pla_x + pla_u) > cru_x) &&
         (pla_y > (cru_y - cru_x + pla_t + pla_x)) &&
         (pla_y <= (cru_y + cru_x + pla_t - pla_x)))
         {
           pla_x = cru_x - pla_u;
           plavv_x = 0;           
         }
      else if (((pla_x - pla_u) < cru_x) &&
         (pla_y <= (cru_y - cru_x + pla_t + pla_x)) &&
         (pla_y > (cru_y + cru_x + pla_t - pla_x)))
         {
           pla_x = cru_x + pla_u;
           plavv_x = 0;           
         }
     
    }
  }
  
}