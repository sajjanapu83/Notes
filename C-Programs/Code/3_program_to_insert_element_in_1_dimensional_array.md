

```javascript
/* 
Program : To show array operation
Purpose : Program to insert element in 1-dimensional array
online-Compiler : https://www.onlinegdb.com/online_c_compiler
*/

#include <stdio.h>
#include <conio.h>
#define SIZE 20

/*++++ Function Declaration begins ++++*/

void traverse(int[], int);
int insert(int[], int, int);

/*++++ Function Declaration ends ++++*/

void main() {
  int i=0, A[SIZE], n, pos, item;
  
  printf("\n No of elements to store in an array: " );
  scanf("%d", &n);
  
  while(i<n) {
    printf(" value of A[%d]: ", i);
    scanf("%d", &A[i]);
    i++; 
  }
  
  traverse(A,n);
  
  printf("Enter index to insert element in an Array: ");
  scanf("%d", &pos);
  printf("Enter the value: ");
  scanf("%d", &item);
  
  n = insert(A,n,pos,item);
  
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

int insert(int A[], int n, int pos, int item) {
  int i;
  for(i=n; i>=pos; i--) {
    A[i+1] = A[i];
  }
  A[pos] = item;
  n = n + 1;
  return n;
}

/*++++ Function Definition ends ++++*/

```
