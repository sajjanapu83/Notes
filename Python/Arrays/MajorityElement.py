

# Moore Voting Algorithm 
# if element occurs more than half of list size then it is called Majority item

def getMajorityElement(A,size):
    majorityIndex = 0
    count = 1
    i=1
    
    for i in range(1,len(A)):
        if(A[majorityIndex]==A[i]):
            count = count + 1
        else:
            count = count - 1
        if count == 0:
            majorityIndex = i
            count = 1
    return A[majorityIndex]

def IsMajorityElement(A,size,majorityElement):
    count =0
    for i in range(size):
        if A[majorityElement] == A[i]:
            count = count + 1
    if count > size//2:
        return True
    else:
        return False

A=[2,1,3,3,4,3,3,3,2,3]
element = getMajorityElement(A,10)
if IsMajorityElement(A,10,element):
    print(element)
else:
    print('none')


    
