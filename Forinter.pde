void setup()
{
 size(600, 600);
 noStroke();
}

void draw()
{  
  background(0); 
  int mult = 15;
  
  for (int count_2 = 2; count_2 <= 20; ++count_2)
  {
    for (int count = 2; count <= 20; ++count)
    {
      fill(mouseX%256, mouseY%256, count_2*count_2%256);
      ellipse(count*count_2*3, 300 + (count - count_2)*mult, 1, (count + count_2));
    }
  }
}