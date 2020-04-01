```

Disjoint sets datastructure is used to detect cycles in an graph.

This can be implemented in 
- Linked list
- Tree

# Linked List : Create-set, find-set, Union operations take CONSTANT time O(1)
# Tree: Create-set, Union operations take CONSTANT time, but find-set operation is dependent on depth of the tree O(d).
  This can be improved to Constant Amortized time using
  - Union by Rank : Connect small tree to root of the big tree, so that height of the tree is under the control.
  - Path Compression : When ever you do find-set operation, point all elements in the graph to root, so that helps find-set 
    operation next time to perform just Constant time.

```
