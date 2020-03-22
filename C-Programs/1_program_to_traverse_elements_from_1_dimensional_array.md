```
/* 
Program: To show array operation
Purpose: Program to traverse elements from 1-dimensional array
*/

#include <stdio.h>
#include <conio.h>
#define SIZE 20

/*++++ Function Declaration begins ++++*/

void traverse(int[], int);

/*++++ Function Declaration ends ++++*/

void main() {
  int i=0, A[SIZE], n;
  
  printf("\n No of elements to store in an array: " );
  scanf("%d", &n);
  
  while(i<n) {
    printf(" value of A[%d]: ", i);
    scanf("%d", &A[i]);
    i++; 
  }
  
  traverse(A,n);
  getch();
  
}

/*++++ Function Definition begins ++++*/

void traverse(int A[], int  n) {
  int i=0;
  while(i<n) {
    printf("A[%d] = ",i);
    printf("%d\n", A[i]);
    i++;
  }
  printf("\n");
}

/*++++ Function Definition ends ++++*/

```


