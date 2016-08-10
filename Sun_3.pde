    final float wind_x = 600;
    final float wind_y = 600;
    
    final float wind_r = sqrt(wind_x*wind_x + wind_y*wind_y);
    final float wind_t = 100*wind_r;
    
    final float sun_r = 5;
    
    final float divisor = 10;
    
    final int max_amount = 50;
    
    int amount = round(random(1, max_amount));
    
    float cent_x[] = new float[max_amount];
    float cent_y[] = new float[max_amount];
    float rad_t[] = new float[max_amount];
    
    float pos_x[] = new float[max_amount];
    float pos_y[] = new float[max_amount];
    
    float neg_x[] = new float[max_amount];
    float neg_y[] = new float[max_amount];
    
    float top_x[] = new float[max_amount];
    float top_y[] = new float[max_amount];
    
    float bot_x[] = new float[max_amount];
    float bot_y[] = new float[max_amount];
    
    boolean clicked = false;
    
    void setup()
    {
      size(600, 600);
      noStroke();
      
      for (int count = 0; count < amount; ++count)
      {
        rad_t[count] = random(0, wind_r/divisor);
        cent_x[count] = random(rad_t[count], wind_x - rad_t[count]);
        cent_y[count] = random(rad_t[count], wind_y - rad_t[count]);
      }  
    }
    
    void draw()
    {
      background(255, 127, 127);
      
      if (mousePressed)
      {
        if (!clicked)
        {
          for (int count = 0; count < amount; ++count)
          {
            amount = round(random(1, max_amount));
            
            rad_t[count] = random(0, wind_r/divisor);
            cent_x[count] = random(rad_t[count], wind_x - rad_t[count]);
            cent_y[count] = random(rad_t[count], wind_y - rad_t[count]);
          }
          
          clicked = true;
        }
      }
      else
      {
        if (clicked)
        {
          clicked = false;
        }
      }
      
      final float sun_x = mouseX;
      final float sun_y = mouseY;
      
      boolean blackout = false;
      
      for (int count = 0; count < amount; ++count)
      {  
        final float dist_x = sun_x - cent_x[count];
        final float dist_x_2 = dist_x*dist_x;
        final float dist_y = sun_y - cent_y[count];
        final float dist_y_2 = dist_y*dist_y;
        final float dist_2 = dist_x_2 + dist_y_2;
        final float dist_r = sqrt(dist_2);
        
        if (dist_r <= rad_t[count])
        {
          blackout = true;
        }
        
        final float rad_2 = rad_t[count]*rad_t[count];
        
        final float disc = sqrt(rad_2*dist_x_2 + dist_2*(dist_y_2 - rad_2));
        
        final float plus_x = rad_t[count]*(rad_t[count]*dist_x + disc)/(dist_2);
        final float plus_y = (rad_2 - dist_x*plus_x)/dist_y;
        
        final float minus_x = rad_t[count]*(rad_t[count]*dist_x - disc)/(dist_2);
        final float minus_y = (rad_2 - dist_x*minus_x)/dist_y;
        
        pos_x[count] = plus_x + cent_x[count];
        pos_y[count] = plus_y + cent_y[count];
        
        neg_x[count] = minus_x + cent_x[count];
        neg_y[count] = minus_y + cent_y[count];
        
        final float rhop_x = pos_x[count] - sun_x;
        final float rhop_y = pos_y[count] - sun_y;
        final float rhop_r = sqrt(rhop_x*rhop_x + rhop_y*rhop_y);
        
        final float rhon_x = neg_x[count] - sun_x;
        final float rhon_y = neg_y[count] - sun_y;  
        final float rhon_r = sqrt(rhon_x*rhon_x + rhon_y*rhon_y);
        
        top_x[count] = sun_x + rhop_x*wind_t/rhop_r;
        top_y[count] = sun_y + rhop_y*wind_t/rhop_r;
        
        bot_x[count] = sun_x + rhon_x*wind_t/rhon_r;
        bot_y[count] = sun_y + rhon_y*wind_t/rhon_r;
      }
      
      if (blackout)
      {
        background(0);
      }
      else
      {
        for (int count = 0; count < amount; ++count)
        {
          fill(0);
          triangle(sun_x, sun_y, top_x[count], top_y[count], bot_x[count], bot_y[count]);
        }
        
        for (int count = 0; count < amount; ++count)
        {
          fill(255, 255, 127);
          triangle(sun_x, sun_y, pos_x[count], pos_y[count], neg_x[count], neg_y[count]);
        }
        
        fill(255);
        ellipse(sun_x, sun_y, 2*sun_r, 2*sun_r);
      }
      
      for (int count = 0; count < amount; ++count)
      {
        fill(63, 63, 127);
        ellipse(cent_x[count], cent_y[count], 2*rad_t[count], 2*rad_t[count]);
      }  
    }