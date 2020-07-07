DATA I,X,C,M,V,L,D,
REM roman
CLS : DIM a$(1, 3), a(3)
FOR c = 0 TO 1: FOR p = 0 TO 3: READ a$(c, p): NEXT: NEXT
DO
INPUT "Number"; n: h = INT(ABS(n))
LOOP WHILE h >= 10000!
FOR i = 0 TO 3: a(i) = h - 10 * INT(h / 10): h = INT(h / 10): NEXT
r$ = STRING$(a(3), "M")
FOR i = 2 TO 0 STEP -1
SELECT CASE a(i)
CASE 1, 2, 3
FOR j = 1 TO a(i)
r$ = r$ + a$(0, i)
NEXT
CASE 4
r$ = r$ + a$(0, i) + a$(1, i)
CASE 5
r$ = r$ + a$(1, i)
CASE 6, 7, 8
r$ = r$ + a$(1, i)
FOR j = 6 TO a(i)
r$ = r$ + a$(0, i)
NEXT
CASE 9
r$ = r$ + a$(0, i) + a$(0, i + 1)
CASE ELSE
END SELECT
NEXT
PRINT INT(ABS(n)), r$

