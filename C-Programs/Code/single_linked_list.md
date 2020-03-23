```ruby

#include <stdio.h>
#include <malloc.h>

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
  printf("\n\t\t Program for  singly linked list \n");
  printf("\n\tMenu \n\t 1)Create \n\t 2)Insert \n\t 3)Delete \n\t 4)Display \n\t 5)Exit: ");
  do {
    printf("\n\tEnter choice : ");
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
  node *temp, *inode;
  int item;
  inode = START;
  printf("\n\tEnter data:");
  scanf("%d", &item);
  temp = (node*)malloc(sizeof(node));
  temp->data = item;
  temp->link = NULL;
  if (inode == NULL) {
    // ### Check if linkedlist is EMPTY
    inode=START=temp;
  } else {
      while (inode->link != NULL) {
          inode = inode->link;
      }
      inode->link=temp;
      inode = temp;
  }
  
  return START;
}

node *SLinsertion(node *START) {

    return START;
}

node *SLdeletion(node *START) {

    return START;
}

void SLdisplay(node *START) {
  printf("[ START ] => ");
  while (START != NULL) {
    printf("[ %d ] =>", START->data);
    START = START->link;
  }
  printf(" [ NULL ]");
    
}


```
