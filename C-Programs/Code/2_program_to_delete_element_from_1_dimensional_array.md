
```ruby
/* 
Program: To show array operation
Purpose: Program to delete element from 1-dimensional array
*/

#include <stdio.h>
#include <conio.h>
#define SIZE 20

/*++++ Function Declaration begins ++++*/

void traverse(int[], int);
int delete(int[], int, int);

/*++++ Function Declaration ends ++++*/

void main() {
  int i=0, A[SIZE], n, pos;
  
  printf("\n No of elements to store in an array: " );
  scanf("%d", &n);
  
  while(i<n) {
    printf(" value of A[%d]: ", i);
    scanf("%d", &A[i]);
    i++; 
  }
  
  traverse(A,n);
  
  printf("Enter index/position for deleting the element in an Array: ");
  scanf("%d", &pos);
  
  n = delete(A,n,pos);
  
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

int delete(int A[], int n, int pos) {
  
  printf("Deleted item from index %d value is %d\n", pos, A[pos]);
  while(pos <= n) {
    A[pos] = A[pos+1];
    pos++;
  }
  n = n - 1;
  return n;
}

/*++++ Function Definition ends ++++*/

```
