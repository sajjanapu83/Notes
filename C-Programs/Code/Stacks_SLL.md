
```ruby
#include <stdio.h>
#include <stdlib.h>

typedef struct Node_Block {
    int data;
    struct Node_Block *link;
} node;

node *TOP = NULL;

void push(int item) {
    // Create a new node
    node *temp = (node *)malloc(sizeof(node));
    temp->data = item;
    temp->link = NULL;
    
    if ( TOP == NULL ) {
       TOP = temp;
       return;
    } 
    temp->link = TOP;
    TOP = temp;
}

void pop() {
    node *temp;
    if ( TOP == NULL ) {
        printf(" Stack is empty \n");
        return;
    } 
    temp = TOP;
    TOP=TOP->link;
    free(temp);
}

void display() {
    node *inode = TOP;
    printf("[ TOP ] => ");
    while(inode) {
        printf("[ %d ] =>", inode->data);
        inode=inode->link;
    }
}

void print_top() {
    printf("%d", TOP->data);
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
