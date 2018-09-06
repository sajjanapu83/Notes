class Fraction:
    def __init__(self,num,den):
        self.num = num
        self.den = den

    def __str__(self):
        return str(self.num) + "/" + str(self.den)
        
    def show(self):
        print("%s/%s " %(self.num,self.den))

    def __add__(self,otherfraction):
        newnum = self.num * otherfraction.den + otherfraction.num * self.den
        newden = self.den * otherfraction.den
        return Fraction(newnum,newden)
    
    def __eq__(self,otherfraction):
        return self.num*otherfraction.den == self.den*otherfraction.num

f = Fraction(3,5)
f.show()

print(Fraction(3,5) + Fraction(1,2))
print(Fraction(3,5) == Fraction(6,10))