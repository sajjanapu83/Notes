


def removeDuplicateChar(str):
    # Create a Hashtable of 256 cells
    temp = [0]*256 
    newstr = ''
    for ch in str:
        if temp[ord(ch)] == 0:
            newstr = newstr + ch
        temp[ord(ch)] = temp[ord(ch)]+1
    return newstr

#print(removeDuplicateChar("karrrthikkk"))

def checkRotations(str1,str2):
    result = 0
    if len(str1) != len(str2):
        result = 0
    else:
        temp = str1*2 # string concat to itself
        if str2 in temp: # check substring.
            result = 1
        else:
            result = 0
    return result

# print(checkRotations("kar","rak"))


def reverseString(str):
    # alternaitive way is str[::-1]
    start=0
    end=len(str)-1
    newstr = list(str)
    while start < end:
        temp = newstr[start]
        newstr[start] = newstr[end]
        newstr[end] = temp
        start = start + 1
        end = end - 1
    return ''.join(newstr)

print(reverseString("Karthik"))
print("Karthik"[::-1])

def reverseWordInSentence(sentence):
    words = sentence.split(" ")
    newwords = [ word[::-1] for word in words ]
    return ' '.join(newwords)[::-1]

print(reverseWordInSentence("This is Kar!!"))

print(' '.join([ word[::-1] for word in "This is Kar!!".split(" ") ])[::-1])






