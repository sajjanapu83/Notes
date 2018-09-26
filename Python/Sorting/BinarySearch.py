def binarysearch(A,l_index,r_index,target):
    m_index=-1
    while l_index <= r_index:
        m_index = l_index + ( r_index-l_index)//2
        if A[m_index] == target:
            return m_index
        if A[m_index] < target:
            l_index = m_index+1
        else:
            r_index = m_index-1;
    return -1

print(binarysearch([1,2,5,7,9,25],0,5,25))
