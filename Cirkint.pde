void setup()
{
 size(600, 600);
 noStroke();
}

int mult = 60;
int mult_2 = 0;

void draw()
{
  background(0);
  
 for (int count = 1; count != 10; ++count)
 {
   fill(63 + count*mult_2, 127, 191);
   ellipse(count*mult, count*mult, 0.8*mult, 0.8*mult);
 }
}