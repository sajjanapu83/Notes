```ruby

#include <stdio.h>
#include <malloc.h>
#include <process.h>

typedef struct list_tag {
  int data;
  struct list_tag *link;
} node;

/*+++++ Function Declarations Begin +++++*/

node *SLcreation(node *);
node *SLinsertion(node *);
node *SLdeletion(node *);
void SLdisplay(node *);

/*+++++ Function Declarations End +++++*/

void main() {
  node *START = NULL;
  int choice;
  do {
    printf("\n\t\t Program for  singly linked list \n");
    printf("\n\t\t\t Menu: \n");
    printf("\n\t\t1.Create");
    printf("\n\t\t2.Insert");
    printf("\n\t\t3.Delete");
    printf("\n\t\t4.Display");
    printf("\n\t\t5.Exit");
    printf("\n\t\t Enter choice : ");
    scanf("%d", &choice);
    switch(choice) {
      case 1:
        START = SLcreation(START);
        break;
      case 2:
        START = SLinsertion(START);
        break;
      case 3:
        START = SLdeletion(START);
        break;
      case 4:
        printf("\n+++++++++ Linked List +++++++++\n");
        SLdisplay(START);
        break;
      case 5:
        exit(0);
      default :
        printf("\nwrong choice:");
    }
  }
  while (choice !=5);
  printf("\n");
  
}

node *SLcreation(node *START) {
  node *temp, *prev;
  int item;
  prev = START = NULL;
  printf("\nEnter data:");
  scanf("%d", &item);
  temp = (node*)malloc(sizeof(node));
  temp->data = item;
  temp->link = NULL;
  if (START == NULL)
    START = temp;
  else
    prev->link=temp;
  prev =temp;
  
  return START;
}


```
