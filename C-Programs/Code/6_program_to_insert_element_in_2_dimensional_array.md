```ruby
/* 

Program : To show array operation
Purpose : Program to insert element in 2-dimensional array
online-Compiler : https://www.onlinegdb.com/online_c_compiler 

*/

#include <stdio.h>
#include <conio.h>
#include <string.h>
#define R 10
#define C 15

/*++++ Function Declaration begins ++++*/

void traverse(char[][C], int);
int insert(char[][C], int, int, char[]);

/*++++ Function Declaration ends ++++*/

void main() {
  int i=0, n, pos;
  char A[R][C];
  char item[C];
  
  printf("\n No of elements to store in an 2D array: " );
  scanf("%d", &n);
  
  while(i<n) {
    printf(" value of A[%d]: ", i);
    scanf("%s", &A[i]);
    i++; 
  }
  
  traverse(A,n);
  printf(" Enter the index of an element to insert from an Array");
  scanf("%d",&pos);
  printf(" Enter value: ");
  scanf("%s",&item);
  n=insert(A,n,pos,item);
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

int insert(char A[][C], int n, int pos, char[] item) {
  int i;
  printf(" insert element at index %d is %s \n",pos,item);
  
  for(i=n; i>=pos; i--) {
    strcpy(A[i+1],A[i]);
  }
  strcpy(A[pos],item);
  n = n + 1;
  return n;

}

/*++++ Function Definition ends ++++*/

```
