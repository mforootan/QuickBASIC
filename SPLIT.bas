CLS
INPUT n$
FOR i = LEN(n$) TO 1 STEP -1
c$ = MID$(n$, i, 1)
SELECT CASE c$
CASE "."
FOR j = LEN(n$) TO i STEP -1: IF MID$(n$, j, 1) = "\" THEN cn = cn + 1
NEXT
IF cn = 0 THEN
e$ = MID$(n$, i + 1)
n$ = MID$(n$, 1, i)
END IF
cn = cn + 1
CASE "\"
IF ct = 0 THEN
f$ = MID$(n$, i + 1)
n$ = MID$(n$, 1, i)
END IF
ct = ct + 1
CASE ":"
p$ = MID$(n$, i + 1)
n$ = MID$(n$, 1, i)
CASE ELSE
END SELECT
NEXT
d$ = MID$(n$, 1): IF p$ = "" THEN SWAP d$, p$: IF f$ = "" THEN SWAP p$, f$
PRINT "DRV: "; d$
PRINT "PTH: "; p$
PRINT "FLN: "; f$
PRINT "EXT: "; e$

