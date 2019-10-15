# Notes

## Todos

Add more short cut options to the format:

```
  en |  Bayern Munich  | FC Bayern Munich
           =>
     |  Bayern Munich [en] | FC Bayern Munich [en]
```

allow language code before `|`  results in `Bayern Munich [en]` and ``FC Bayern Munich [en]` etc.

```
  2001-2012 |  Stahl Linz | FC Stahl Linz   
                  =>
            |  Stahl Linz (2001-2012) | FC Stahl Linz (2001-2012)
```

allow year before `|` results in `Stahl Linz (2001-2012)` and `FC Stahl Linz (2001-2012)` etc.


## Team B or Team II

How to mark the parent/child relation of B teams?

```
FC Barcelona

FC Barcelona B › FC Barcelona
-or-
ii) FC Barcelona B
-or-
b)  FC Barcelona B
-or-
2)  FC Barcelona B  
?????
```

```
FK Austria Wien,   Wien (Favoriten)
  | Austria Wien
  | Austria Vienna [en]
  
  (2) Young Violets Austria Wien
       | Young Violets A.W.
  -or-
  (ii) Young Violets Austria Wien
       | Young Violets A.W.
  -or-
  (b) Young Violets Austria Wien
       | Young Violets A.W.
  -or-
  Young Violets Austria Wien  ›  FK Austria Wien
       | Young Violets A.W.
  -or-
  ????
```