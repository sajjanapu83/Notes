class StringProblems:

    def Anagram(self, a , b):
        self.c1 = [0]*26
        self.c2 = [0]*26

        for i in a:
            pos = ord(i)-ord('a')
            self.c1[pos] = self.c1[pos] + 1
        
        for i in b:
            pos = ord(i)-ord('a')
            self.c2[pos] = self.c2[pos] + 1

        isMatch = True
        j=0

        while j<26 and isMatch:
            if(self.c1[j]==self.c2[j]):
                j=j+1
            else:
                isMatch = False
        
        return isMatch

s = StringProblems()
a = input("Enter word 1 => ")
b = input("Enter word 2 => ")
# a = earth , b = heart 
print(s.Anagram(a.lower() , b.lower()))