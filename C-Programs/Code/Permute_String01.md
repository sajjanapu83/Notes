```
#include <stdio.h>
#include <stdlib.h>

int count=0;
char letters[] = "abc";
int *visited;
void permuatations(char *str, int start, int end)
{
    if(start == end)
    {
        printf("%s\n", str);
        count++;
        i=0;
    }
    else
    {
        for(int i=0;i<strlen(letters); i++)
        {
            if(visited[i]==0) {
                str[start] = letters[i];
                visited[i] = 1;
                permuatations(str, start+1, end);
                visited[i] = 0;
            }
        }
    }
}

void main()
{
    int n=sizeof(letters);
    char *input = (char*)calloc(n,sizeof(char));
    visited = (int *)calloc(n,sizeof(int));
    //n=3;
    permuatations(input,0,n-1);
    printf("Total permuatations = %d", count);
   
}
```
