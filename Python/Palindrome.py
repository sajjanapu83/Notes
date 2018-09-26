from Dequeue import Dequeue

def palindrome(astring):
    c = Dequeue()
    for ch in astring:
        c.addRear(ch)

    stillEqual = True
    while c.size()>1 and stillEqual:
        first = c.removeFront()
        last = c.removeRear()
        if last != first:
            stillEqual = False
    return stillEqual

print(palindrome("radar"))
print(palindrome("welcome"))
print(palindrome("MadaM"))

