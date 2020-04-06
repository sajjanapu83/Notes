```
#include <stdio.h>
#include <stdlib.h>
#define SIZE 4

void printSolution(int board[SIZE][SIZE]) {
    int i,j;
    printf("=======SOL========\n");
    for (i = 0; i < SIZE; i++)
    {
        for (j = 0; j < SIZE; j++)
           printf(" %d ", board[i][j]);
        printf("\n");
    }
    printf("=================\n");
}

int isSafe(int board[SIZE][SIZE],int row, int col) {
    /*
     \
      \
    ___\(i,j)
      /
    /
    
    */
    int i,j;
    for (j=0; j <col; j++) {
        if(board[row][j])
          return 0;
    }
    for (i=row, j=col; i>=0 && j>=0; i--,j--)
        if(board[i][j])
          return 0;
    for (i=row, j=col; j>=0 && i<SIZE; i++,j--)
        if(board[i][j])
          return 0;
    return 1;
} 

void solveNQueen(int board[SIZE][SIZE], int col) {
    
    // BASE CASE
    if (col >= SIZE) {
        printSolution(board);
        
    } else {
        
        for(int row=0;row<SIZE;row++) {
        
            if (isSafe(board,row,col)) {
                
                //CHOOSE
                board[row][col] = 1;
                
                //EXPLORE
                solveNQueen(board, col+1);
                
                //UNCHOOSE
                board[row][col] = 0;
            }
        }
        
    }
    
}

void main ()
{
    int board[SIZE][SIZE] = {0};

    solveNQueen(board,0);
}

```
