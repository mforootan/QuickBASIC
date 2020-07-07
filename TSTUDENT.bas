REM t-distribution
SCREEN 9
DEF FNf (x) = .39894228# * EXP(-.5 * x ^ 2)
PSET (400, 200)
FOR z = -3 TO 3 STEP .1
LINE -((100 * z / 3 + 500), -150 * FNf(z) + 200)
NEXT
PSET (400, 205): LINE -STEP(200, 0)
LOCATE 16, 62: PRINT 0: LOCATE 16, 69: PRINT "+t": LOCATE 16, 56: PRINT "-t": LOCATE 13, 54: PRINT "df"
FOR z = -1.6 TO 1.6 STEP .15
LINE ((100 * z / 3 + 500), 205)-STEP(0, -150 * FNf(z) - 5)
NEXT
LOCATE 13, 61: PRINT "P(t)"
INPUT "Enter tò0 and df<141: ", x, v
g = 1: f = 1: a = 1
t = ATN(x / (v ^ .5)): c = COS(t) ^ 2
IF INT(v / 2) = v / 2 THEN 10
b = x * .6366197724#: IF v = g THEN 20
g = v - 1: d = 3
40 e = e + 2: IF e = g THEN 30
f = f * e / d * c: a = a + f: d = d + 2: GOTO 40
10 g = v: d = 1
60 e = e + 2: IF e = g THEN 50
f = f * d / e * c
a = a + f: d = d + 2: GOTO 60
50 z = SIN(t) * a: GOTO 70
20 z = b: GOTO 70
30 z = .6366197724# * COS(t) * SIN(t) * a + b
70 PRINT "P("; x; ")="; z: END

