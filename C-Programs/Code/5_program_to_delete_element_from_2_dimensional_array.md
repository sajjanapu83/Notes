
```ruby
/* 

Program : To show array operation
Purpose : Program to delete element from 2-dimensional array
online-Compiler : https://www.onlinegdb.com/online_c_compiler 

*/

#include <stdio.h>
#include <conio.h>
#include <string.h>
#define R 10
#define C 15

/*++++ Function Declaration begins ++++*/

void traverse(char[][C], int);
int delete(char[][C], int, int);

/*++++ Function Declaration ends ++++*/

void main() {
  int i=0, n, pos;
  char A[R][C];
  
  printf("\n No of elements to store in an 2D array: " );
  scanf("%d", &n);
  
  while(i<n) {
    printf(" value of A[%d]: ", i);
    scanf("%s", &A[i]);
    i++; 
  }
  
  traverse(A,n);
  printf(" Enter the index of an element to delete from an Array");
  scanf("%d",&pos);
  n=delete(A,n,pos)
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

int delete(char A[][C], int n, int pos) {
  char item[C];
  strcpy(item,A[pos]);
  printf(" Deleting element at index %d is %s \n",pos,item);
  while(pos<=n) {
    strcpy(A[pos],A[pos+1])
    pos++;
  }
  n = n - 1;
  return n

}

/*++++ Function Definition ends ++++*/

```
