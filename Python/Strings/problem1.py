# Max occurance of a char in a given string.
# Time Complexity : O(n)
# Space Complexity : O(1)
# Comments: ord(ch) gives ASCII number

def maxOccuranceOfChar(str):
    temp =[0]*256
    maxChar = None
    maxCount = -1
    for ch in str:
        temp[ord(ch)]=temp[ord(ch)] + 1
        if maxCount < temp[ord(ch)]:
            maxCount = temp[ord(ch)]
            maxChar = ch
    return maxChar

print(maxOccuranceOfChar("Karthikaaa"))
