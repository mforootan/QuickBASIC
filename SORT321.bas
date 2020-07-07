
OPTION BASE 1
CLS
INPUT "How many numbers"; n
DIM x(n)
FOR i = 1 TO n
CLS
INPUT "Give a number: ", x(i)
NEXT
FOR i = 1 TO n
FOR j = i + 1 TO n
IF x(i) < x(j) THEN SWAP x(i), x(j)
NEXT
NEXT
CLS
FOR i = 1 TO n
PRINT x(i)
NEXT

