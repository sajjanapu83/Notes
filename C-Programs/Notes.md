### Sort
- Quick Sort ( example: students standing in line based on their height on their own )
  - Follows Divde & Conquer strategy
  - Choose Pivot as 
    - Starting element:  Not good idea, time complexity leads to n*n
    - Median: Time Complexity improved to nlogn, but my lead to n*n for few cases
    - Random: same as above
- Merge Sort
  - Follows Divde & Conquer strategy 
  - Suitable for millions of records & linked list, but not for small list of array elements
  - Its not an inplace sort algorithm, it needs an extra array to store the sorted elements.
  - its stable, it wont effect the position of  duplicate records after sort.
- Heap Sort
- Insertion Sort
### Strings
- Pattern Matching
  - KMP
### Arrays 
- Different ways to think and solve array problems
  - Sort (Heap)
  - Search (Binary Search)
  - Hashing Technique
  - Left & Right Index Technique
    - All 0's at begining and All 1's at the end.
    - All eveb No's at Begining & All Odd No's at the end.
    - a + b = x
    - a + B + c = X
  - Majority element ( Moore Voting )
  - Sliding Window
    - list of anagrams in a string
    - Max sum in a subset of k size. 
### Linked List
- SLL
  - Merge two sorted SLL : No need of extra space like in arrays, instead take 2 pointers third & last. 
    and use the same logic as in Arrays
  - Reverse Links: Take 3 pointers p,q,r. ``` r->q->p ``` where p points to head and q=r=null
    ``` r=q , q=p , p=p->next q->next=r ```

  - Detect Loop : Take 2 pointers p & q, move p by one and q by 2 nodes. if they both meet then its a loop.
  - Merge Sort & Insertion Sort are suitable for Linked List


  

