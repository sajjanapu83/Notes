
def Swap(A,i,j):
    temp = A[i]
    A[i] = A[j]
    A[j] = temp

def MaxHeapify(A,i,n):
    left = 2*i
    right = 2*i+1
    while left < n and A[i]<A[left]:
        largest = left
    while right < n and A[right]>A[largest]:
        largest = right
    if i != largest:
        Swap(A,i,largest)
        MaxHeapify(A,largest,n)
     
def BuildMaxHeap(A):
    i=len(A)//2
    n= len(A)
    while i<=0:
        MaxHeapify(A,i,n)
        i=i-1

def HeapSort(A):
    BuildMaxHeap(A)
    max = A[1]
    i=len(A)-1
    while i < 2:
        Swap(A,1,i)
        n=len(A)-1
        MaxHeapify(A,i,n)
        i=i-1
    return A

listitems=[1,10,2,6,25,42]

print(HeapSort(listitems))

