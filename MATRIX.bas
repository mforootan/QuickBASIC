DO
   CLS
   COLOR 2: LOCATE 1, 1
   PRINT "Enter n for an n by n matrix: "
   COLOR 10: LOCATE 2, 2
   INPUT "", n: n = INT(ABS(n))
LOOP UNTIL n > 1
OPTION BASE 1
DIM element(n, n)
FOR i = 1 TO n
   FOR j = 1 TO n
      COLOR 4: LOCATE 4, 1
      PRINT "Give element ("; i; ","; j; "):"
      LOCATE 5, 2: PRINT SPACE$(30)
      LOCATE 5, 2: COLOR 12
      INPUT "", element(i, j)
   NEXT
NEXT
LOCATE 4, 1: PRINT SPACE$(30)
LOCATE 5, 1: PRINT SPACE$(30)
LOCATE 6, 4: PRINT CHR$(218): LOCATE 6, n * 4 + 4: PRINT CHR$(191)
LOCATE n + 7, 4: PRINT CHR$(192): LOCATE n + 7, n * 4 + 4: PRINT CHR$(217)
FOR i = 1 TO n
   LOCATE i + 6, 4: PRINT CHR$(179)
   FOR j = 1 TO n
      LOCATE i + 6, 4 * j + 1: PRINT element(i, j)
   NEXT
   LOCATE i + 6, 4 * j: PRINT CHR$(179)
NEXT
sign = 1:zero=1
IF element(1, 1) = 0 THEN
   c = 2
   DO
      IF element(c, 1) <> 0 THEN
         FOR j = 1 TO n
            SWAP element(1, j), element(c, j)
         NEXT
         sign = -sign
         EXIT DO
      END IF
      c = c + 1
   LOOP WHILE c <= n
   IF sign = 1 THEN zero = 0 ELSE zero = 1
END IF
multi = 1
FOR k = 1 TO n - 1
   multi = multi * element(k, k)
   FOR j = k + 1 TO n
      FOR i = n TO k STEP -1
         IF element(k, j) <> 0 THEN element(i, j) = element(i, j) - element(i, k) * element(k, j) / element(k, k)
NEXT i, j, k
det = sign * multi * element(k, k)
LOCATE n + 10, 3: COLOR 9
PRINT "determinant="; det
LOCATE 22, 20: COLOR 30
PRINT "See also DETERMINANT for WINDOWS !!!"
COLOR 15
k$ = INPUT$(1)
SYSTEM

