```ruby


#include <stdio.h>
#include <stdlib.h>

int n = 3;
int sum = 7;
int calls = 0;
void diceSum(int *str,int dice, int desiredSum) {
    calls++;
    if (dice == 0) {
        if ( desiredSum == 0 ) {
            for(int i=0;i<n;i++)
               printf("%d ", str[i]);
            printf("\n");
        }
        // condition: min and max sum if we choose one dice
    } else if ((desiredSum>=dice*1) && (desiredSum<=6*dice)){
        
        for(int i=1;i<=6;i++) {
            // if the no of dices choosen is 3 then length of the str should 3
            str[n-dice]=i; // choose i
            diceSum(str, dice-1, desiredSum-i); // explore what could follow that
        }
    }
    
}

int main()
{
    int *input = (int*)calloc(n,sizeof(int));
    diceSum(input,n,sum);
    printf("\ntotal calls = %d", calls);
    return 0;
}


```
