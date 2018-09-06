# print squares of a given list
print([x*x for x in [1,2,3,4,5]])

print("hi"*3)
print(["10.0.1."+ str(i) for i in range(0,5)])
# print cubes in reverse from the list
print([x**3 for x in range(6,0,-1)])

# sum of distinct elements in a list

a =[1,3,4,1,3]
b= set()
for x in a:
    b.add(x)
print(b)
c = 0
for i in b:
    c = c + i
print(c)

# repeat characters count times in a given string
def print_double(str, count):
    res = ""
    for x in str:
        res = res + x*count
    return res

print(print_double("kar",5))

# create a plot series graph

from matplotlib import pyplot as plt
plt.plot([1,2,3],[2,1,5])
plt.plot([3,4,5],[2,1,5])
plt.legend(['set1','set2'])
plt.xlabel('x-axis')
plt.ylabel('y-axis')
plt.title('first sample - plot series')
plt.show()

# create histogram series graph

from matplotlib import pyplot as plt
import pandas as pd

plt.hist([1,2,3])
plt.hist([3,4,5])
plt.legend(['set1','set2'])
plt.xlabel('x-axis')
plt.ylabel('y-axis')
plt.title('first sample - plot series')
plt.show()