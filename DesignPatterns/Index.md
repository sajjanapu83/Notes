- https://www.dotnettricks.com/learn/designpatterns
- https://channel9.msdn.com/Shows/Visual-Studio-Toolbox/Design-Patterns-Decorator
- https://github.com/skimedic/presentations/tree/master/Patterns/Current/Structural/Decorator

Bad Code:
- Rigidity
- Fragility
- Coupling/Dependency ( re-use other's code )

OO is about mannaging dependencies, by selectively re-inverting certain key dependencies in the architecture, so that you can prevent RIGIDITY, FRAGILITY, Non Reusability -@Uncle Bob

## Creational Design Patterns
- Builder:

```diff
+ Creation of object is done piece by piece...
$         or
+ Object construction is done piece by piece...

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
 //! logic 1
 }
 constructor1(int,int) {
  //! logic 2
 }

Solution: FACTORY PATTERN
#### Factory Method:
a) Uses static methods with in a class, which internally calls private constructor for object creation..

A factory can be external ( use friend keyword ). or internal ( as an inner-class ).

#### Inner Factory: 
a) Uses inner classes technique for factory class construction...

Abstract Factory:
Technique - Create family of factories, use reflection/map to return required object..

```




