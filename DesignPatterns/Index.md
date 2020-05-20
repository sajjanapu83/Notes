
## Creational Design Patterns
- Builder:

```
Creation of object is done piece by piece...
         or
Object construction is done piece by piece...

Example:
a) HtmlBuilder
b) XmlBuilder
c) TreeBuilder
d) String Builder

```
- Factory:

```
Scenario: Two contructors with same defination is not allowed in a class..
 constructor1(int,int) {
 //! locgic 1
 }
 constructor1(int,int) {
  //! logic 2
 }

Solution: FACTORY PATTERN
Factory Method:
a) Uses static methods with in a class, which internally calls private constructors..

Factory:
a) Uses inner classes technique for factory class construction...

```




