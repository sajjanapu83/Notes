```ruby
#include <stdio.h>

int array[8];
int
max (int a, int b)
{
  return a > b ? a : b;
}

void
main ()
{ 
   // { −1, 2, 4, −3, 5, 2, −5, 2}
  array[0] = -1; array[1] = 2; array[2] = 4; array[3] = -3;
  array[4] = 5; array[5] = 2; array[6] = -5; array[7] = 2;
  int best = 0, sum = 0;
  for (int k = 0; k < 8; k++)
    {
      sum = max (array[k], sum + array[k]);
      best = max (best, sum);
    }
  printf ("best = %d", best);
}


```
