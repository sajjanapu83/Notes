class stack:
    def __init__(self):
        self.items=[]

    def push(self,item):
        self.items.append(item)
    
    def pop(self):
        self.items.pop()

    def peek(self):
        return self.items[len(self.items)-1]
    
    def isEmpty(self):
        self.items = []
    
    def size(self):
        return len(self.items)

s = stack()
s.push(10)
s.push(True)
s.push(1.5)
print(s.peek())
s.push('Apple')
s.push('pen')
s.pop()
print(s.items)