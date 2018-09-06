class LogicGate:
    def __init__(self, name):
        self.label = name
        self.output = None
    def getlabel(self):
        return self.label

    def performGateLogic(self):
        print("--TODO--")

    def getOutPut(self):
        self.output = self.performGateLogic()
        return self.output

class BinaryGate(LogicGate):
    def __init__(self,name):
        LogicGate.__init__(self,name)
        self.pinA = None
        self.pinB = None

    def getPinA(self):
        return int(input("Enter pinA inut for gate - " + self.getlabel() + " => "))

    def getPinB(self):
        return int(input("Enter pinB input fot gate - " + self.getlabel() + " => "))

class UnaryGate(LogicGate):
    def __init__(self,name):
        LogicGate.__init__(self,name)
        self.pinA = None

    def getPin(self):
        return int(input("Enter pin for gate - " + self.getlabel() + " => "))


class AndGate(BinaryGate):
    def __init__(self,name):
        BinaryGate.__init__(self,name)

    def performGateLogic(self):
        a = self.getPinA()
        b = self.getPinB()
        if a == 1 and b == 1 :
            return 1
        else:
            return 0

class NotGate(UnaryGate):
    def __init__(self,name):
        UnaryGate.__init__(self,name)
        
    def performGateLogic(self):
        if self.getPin():
            return 0
        else:
            return 1


g1 = AndGate("G1")
print(g1.getOutPut())

g1 = NotGate("G1")
print(g1.getOutPut())