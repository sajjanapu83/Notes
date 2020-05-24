
## Greedy Method

```diff

#| Scenario 1: 
#|  Coin Change Problem - Minimum coins
#|  Denominations: { 1,5,6,9 }
#|  Rupees: 11
--------------------------------------------------------------------
!| Greedy method always aim to pick the highest denomination coin.
--------------------------------------------------------------------
+| Solution: [ 9, 1, 1 ]
-| ISSUE: This is not the optimal solution, because we can acheive with just 2 coins.
#| Correct Answer: [ 5, 6 ]

#|--------------------------------------------------------------
#|--------------------------------------------------------------
#| Scenario 2: 
#|  Coin Change Problem - Minimum coins
#|  Denominations: { 4, 10, 25 }
#|  Rupees: 41
---------------------------------------------------------------
!| Solution: We cannot make it with this approach ... [ 25, 10, 4, ? ]
!| ISSUE: It is not always guaranteed, that greedy method provides correct solution.

+| Solution Using Dynamic Programming: [ 25, 4, 4, 4, 4 ]
+| If a problem has an optimal solution, then we can always guarantee, that DYNAMIC PROGRAMMING approach finds the solution



```
