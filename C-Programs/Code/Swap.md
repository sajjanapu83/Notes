```ruby
#include <stdio.h>
#include <conio.h>
#include <string.h>
int swap(void*, void*);


void main() {
 
 int a,b;
 a = 10;
 b = 20;
 
 printf("a = %d , b = %d\n", a, b);
 swap(&a,&b);
 printf("a = %d , b = %d\n", a, b);
 
 float a1,b1;
 a1 = 10.5;
 b1 = 20.5;
 
 printf("a1 = %.2f , b1 = %.2f\n", a1, b1);
 swap(&a1,&b1);
 printf("a1 = %.2f , b1 = %.2f\n", a1, b1);
 
 char a2[10] = "John";
 char b2[10] = "Adam";
 
 printf("a2 = %s , b2 = %s\n", a2, b2);
 swap(a2,b2);
 printf("a2 = %s , b2 = %s\n", a2, b2);
 
}

int swap(void *a, void *b)
{
    void *temp;
    if ((temp = malloc(sizeof(a))) == NULL )
       return -1;
    
    memcpy(temp, a, sizeof(a));
    memcpy(a,b,sizeof(a));
    memcpy(b,temp,sizeof(a));
    
    return 0;
}

```
