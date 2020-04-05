```ruby

#include <stdio.h>
#include <stdlib.h>

static int count=0;
char letters[] = "abc"; // "01"
void permuatations(char *str, int start, int end)
{
    if(start == end)
    {
        printf("%s\n", str);
        count++;
    }
    else
    {
        for(int i=0;i<strlen(letters); i++)
        {
         str[start] = letters[i];
         permuatations(str, start+1, end);
        }
    }
}

void main()
{
    int n=sizeof(letters);
    char *input = (char*)calloc(n,sizeof(char));
    
    permuatations(input,0,n-1);
    printf("Total permuatations = %d", count);
   
}

```
