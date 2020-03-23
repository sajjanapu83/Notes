```

inode: Assume this node as iteration node, just like we define i in while loop...

```

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
    // linkedlist is EMPTY
    inode=START=temp;
  } else {
      // traverse till last node using inode & link to new temp memory block
      while (inode->link != NULL) {
          inode = inode->link;
      }
      inode->link=temp;
      inode = temp; // store the address of new temp memory block to inode.
  }
  
  return START;
}

node *SLinsertion(node *START) {
    
    node *temp, *inode;
    int pos, i, item;
    printf("Enter position of insertion : ");
    scanf("%d", &pos);
    temp = (node*)malloc(sizeof(node));
    printf("\nEnter data to be inserted : ");
    scanf("%d", &item);
    temp->data = item;
    temp->link = NULL;
    inode = START;
    i=0;
    if ((pos == 1) || ( START == NULL)) {
        temp->link= START;
        START = temp;
    } else {
        inode = START;
        i=2;
        while((i<pos) && (inode->link != NULL) ) {
        inode = inode->link;
        ++i;
        }
    temp->link = inode->link;
    inode->link=temp;
        
    }
    
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
