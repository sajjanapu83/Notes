
```ruby

/* 

Program : To show array operation
Purpose : Program to traverse elements from 2-dimensional array
online-Compiler : https://www.onlinegdb.com/online_c_compiler 

*/

#include <stdio.h>
#include <conio.h>
#define R 10
#define C 15

/*++++ Function Declaration begins ++++*/

void traverse(char[][C], int);

/*++++ Function Declaration ends ++++*/

void main() {
  int i=0, n;
  char A[R][C];
  
  printf("\n No of elements to store in an 2D array: " );
  scanf("%d", &n);
  
  while(i<n) {
    printf(" value of A[%d]: ", i);
    scanf("%s", &A[i]);
    i++; 
  }
  
  traverse(A,n);
  getch();
  
}

/*++++ Function Definition begins ++++*/

void traverse(char A[][C], int n) {
  int i=0;
  while(i<n) {
    printf("A[%d] = ",i);
    printf("%s\n", A[i]);
    i++;
  }
  printf("\n");
}

/*++++ Function Definition ends ++++*/

```
