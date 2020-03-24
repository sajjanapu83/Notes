##### Stack: ` Insertion and deletion can be performed only from one end ( i.e Through TOP ). `
##### Operation: 
- Push
- Pop
- Top
- Is_Empty

```ruby

#include <stdio.h>
#include <stdlib.h>
#define MAX_SIZE 100


int A[MAX_SIZE];
int top = -1;
void push(int item) {
    if ( top == MAX_SIZE-1 ) {
        printf("Stack is Full");
    } else {
       
        A[++top] = item;
    }
    
}

void pop() {
    if ( top == -1 ) {
        printf(" Stack is empty \n");
    } else {
        top--;
    }
}

void display() {
    for(int i=top; i>=0; i--){
        printf("%d ", A[i]);
    }
}

void print_top() {
    printf("%d", A[top]);
}

int main()
{
    printf("\n\t MENU: 1) PUSH 2) POP 3) TOP 4) Display 5) Exit \n");
    int ch;
    int item;
   
    do {
        printf("enter your choice(1-5): ");
        scanf("%d",&ch);
        
        switch(ch) {
            case 1:
                printf("\n Enter data : ");
                scanf("%d", &item);
                push(item);
                break;
            case 2:
                pop();
                break;
            case 3:
                print_top();
                break;
            case 4:
                display();
                break;
            case 5:
                exit(0);
            default:
                printf(" Wrong choice ;\n");
                break;
            
        }
          
    } while( ch != 5);

    return 0;
}


```
