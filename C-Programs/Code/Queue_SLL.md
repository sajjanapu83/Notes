
```ruby

#include <stdio.h>
#include <stdlib.h>

typedef struct Node_Block {
    int data;
    struct Node_Block *link;
} node;

node *FRONT, *REAR = NULL;

void Enqueue(int item) {
    
    node *temp = (node *)malloc(sizeof(node));
    temp->data = item;
    temp->link=NULL;
    
    if( REAR == NULL) {
        FRONT = REAR = temp; 
        return;
    }
    REAR->link=temp;
    REAR = temp;
    return;
}

void Dequeue(){
    if( (FRONT==NULL) && (REAR==NULL) ) {
        printf("Queue is empty...");
    } else 
    if ( FRONT==REAR ) {
        free(FRONT);
        FRONT=REAR=NULL;
    } else {
        node *temp = FRONT;
        FRONT=FRONT->link;
        free(temp);
    }
    
}

void Display(){
    node *seeknode = FRONT;
    printf("[ FRONT ] => ");
    while(seeknode) {
        printf("[ %d ] => ", seeknode->data);
        seeknode = seeknode->link;
    }
    printf("[ REAR ] => ");
}

void Is_Empty(){
    
}

void main(){
    
    int ch, item;
    node *temp;
    printf("\n\t MENU 1) Enqueue 2) Dequeue 3) Is_Empty 4) Display 5) Exit... ");
    do {
        printf("\n Enter choice ");
        scanf("%d", &ch);
        switch(ch) {
            case 1:
                printf("\nEnter item ");
                scanf("%d", &item);
                Enqueue(item);
                break;
            case 2:
                Dequeue();
                break;
            case 3:
                Is_Empty();
                break;
            case 4:
                Display();
                break;
            case 5:
                // Free All nodes ( clear heap memory)
                
                while(FRONT) {
                    temp = FRONT;
                    FRONT = FRONT->link;
                    free(temp);
                    printf("Memory-Cleared\n");
                }
                exit(0);
            
        }
    
    } while(ch != 5);
    
}

```
