###### BST Tree

Create | Insert | BST_SIZE | MinKey | MaxKey |
--- | --- | --- | --- | --- | 
struct node { 
int data; struct node *left; struct node *right; }; | struct node { int data; struct node *left; struct node *right; };  | struct node { int data; struct node *left; struct node *right; }; | struct node { int data; struct node *left; struct node *right; }; | struct node { int data; struct node *left; struct node *right; }; |

```
"typedef struct BSTNode {
    int data;
    struct BSTNode *ltree;
    struct BSTNode *rtree;
    
}Node;"	"Node *createNode(int item) {
    Node *temp;
    temp = (Node *)malloc(sizeof(Node));
    temp->data = item;
    temp->ltree = temp->rtree = NULL;

 return temp;
}
"	"Node *insertNode(Node *root, int key) {
    if(!root) {
        return createNode(key);
    }
    if (key < root->data)
       root->ltree = insertNode(root->ltree,key);
    if (key > root->data)
       root->rtree = insertNode(root->rtree, key);
    return root;
}
"
	BST_SIZE	
	return root?(1+(BST_SIZE(root->ltree) + BST_SIZE(root->rtree))):0;	
	MIN KEY	MAX KEY
	"int minkey(Node *root) {
    while(root->ltree)
        root = root->ltree;
    return root->data;
}"	"int maxkey(Node *root) {
    while(root->rtree)
        root = root->rtree;
    return root->data;
}"
```		
		
		
