```ruby

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void findlength(char *s)
{
  int i;
  for (i = 0; s[i] != '\0'; i++);

  printf ("length of %s is %d", s, i);
}

void strUpper(char *s)
{
  int i;
  for (i = 0; s[i] != '\0' && (s[i] >= 97 && s[i] <= 122); i++)
    {
      // if( s[i] >= 97 && s[i] <=122) {
      s[i] = s[i] - 32;
      //  }
    }
  printf ("\nUpper = %s", s);
}

void strLower(char *s)
{
  int i;
  for (i = 0; s[i] != '\0'; i++)
    {
      if (s[i] >= 65 && s[i] <= 90)
	{
	  s[i] = s[i] + 32;
	}
    }
  printf ("\nLower = %s ", s);
}

void main()
{

  char str1[] = "weLcome";

  findlength (str1);
  strUpper (str1);
  strLower (str1);


}


```
