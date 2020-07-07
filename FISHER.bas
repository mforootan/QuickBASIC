REM f-distribution
SCREEN 9
DEF FNf (x) = .39894228# * EXP(-.5 * x ^ 2)
PSET (445, 215)
FOR z = -.75 TO 3 STEP .1
LINE -((100 * z / 3 + 500), -110 * FNf(z) + 200)
NEXT
PSET (445, 215): LINE -STEP(200, 0): PSET (445, 215): LINE -STEP(0, -75)
LOCATE 17, 55: PRINT 0: LOCATE 17, 67: PRINT "F"
FOR z = 1 TO 3 STEP .15
LINE ((100 * z / 3 + 500), 215)-STEP(0, -100 * FNf(z) - 15)
NEXT
LOCATE 24, 1: PRINT "NOTE: This program will NOT work when BOTH degrees of freedom are ODD": LOCATE 14, 68: PRINT "Q(F)"
INPUT "Enter Fò0,df1,and df2: ", x, b, c: x1 = x
g = c / (c + x * b): a = 1: j = 1: k = 1
f = c / 2: IF INT(b / 2) = b / 2 THEN 10
IF INT(f) = f THEN 20
z = 0: GOTO 30
10 IF INT(f) = f THEN 40
GOTO 50
40 IF b >= c THEN 20
50 x = 0: f = 0: e = c: h = 1 - g
IF (b - 2) / 2 = k THEN 60
k = (b - 2) / 2: GOTO 70
20 x = 1: f = 0: e = b: h = g
IF (c - 2) / 2 = k THEN 60
k = (c - 2) / 2
70 i = i + 1: IF i = k THEN 60
f = f + 2: j = j * e / f * h: a = a + j
e = e + 2: GOTO 70
60 a = a + j * e / (f + 2) * h
IF x = 0 THEN 80
h = 1 - g: z = 1 - a * h ^ (b / 2): GOTO 30
80 z = a * g ^ (c / 2)
30 PRINT "Q("; x1; ")="; z: END





