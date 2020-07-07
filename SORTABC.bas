OPTION BASE 1
CLS
INPUT "How many words"; n: CLS
DIM x$(n), s$(n)
FOR i = 1 TO n
d1 = i - 10 * INT(i / 10): d2 = i - 100 * INT(i / 100): t$ = "th"
SELECT CASE d1
CASE 1
IF d2 <> 11 THEN t$ = "st"
CASE 2
IF d2 <> 12 THEN t$ = "nd"
CASE 3
IF d2 <> 13 THEN t$ = "rd"
CASE ELSE
END SELECT
LOCATE 1, 25: PRINT "Enter your"; STR$(i) + t$; " word."
LOCATE 2, 1: INPUT x$(i): CLS
e$ = "": FOR j = 1 TO LEN(x$(i))
c = ASC(MID$(x$(i), j, 1))
SELECT CASE c
CASE 32
e$ = e$
CASE 65 TO 90
e$ = e$ + CHR$(c)
CASE 97 TO 122
e$ = e$ + CHR$(c - 32)
CASE ELSE
END SELECT
NEXT
s$(i) = e$
LOCATE 3, 1: PRINT x$(i): NEXT
FOR i = 1 TO n
FOR j = i + 1 TO n
IF s$(i) > s$(j) THEN SWAP s$(i), s$(j): SWAP x$(i), x$(j)
NEXT
NEXT
CLS
FOR i = 1 TO n
PRINT x$(i)
NEXT
                        

