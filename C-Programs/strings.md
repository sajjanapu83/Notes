```ruby

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void swap(char *a, char *b) {
// with out temp variable using bitwise XOR operation.
    *a = *a^*b;
    *b = *a^*b;
    *a = *a^*b;
}

void swapUsingTemp(char *a, char *b) {
    char t;
    t = *a;
    *a = *b;
    *b = t;
}

void strReverse( char *s) {
    int i=0, j=strlen(s)-1;
    
    while(i < j) {
        swap(&s[i], &s[j]);
        //swapUsingTemp(&s[i], &s[j]);
        i++;
        j--;
    }
    printf("\nReverse = %s ", s);
}

void strReverse01( char *s) {
    for(int i=0, j=strlen(s)-1;i < j; i++,j--) 
       swap(&s[i], &s[j]);
    
    printf("\nReverse01 = %s ", s);
}

void findlength (char *s)
{
  int i;
  for (i = 0; s[i] != '\0'; i++);

  printf ("length of %s is %d", s, i);
}

void strUpper (char *s)
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

void strLower (char *s)
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

void main ()
{

  char str1[] = "weLcome";

  findlength (str1);
  strUpper (str1);
  strLower (str1);
  strReverse(str1);

}


```
