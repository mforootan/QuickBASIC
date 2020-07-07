REM chi-squared distribution
SCREEN 9
DEF FNf (x) = .39894228# * EXP(-.5 * x ^ 2)
PSET (445, 215)
FOR z = -.75 TO 3 STEP .1
LINE -((100 * z / 3 + 500), -110 * FNf(z) + 200)
NEXT
PSET (445, 215): LINE -STEP(200, 0): PSET (445, 215): LINE -STEP(0, -75)
LOCATE 17, 55: PRINT 0: LOCATE 17, 69: PRINT "xý"
FOR z = -.75 TO 1.5 STEP .15
LINE ((100 * z / 3 + 500), 215)-STEP(0, -110 * FNf(z) - 15)
NEXT
FOR i = -1.45 TO -.8 STEP .15
LINE ((100 * i / 3 + 500), 215)-STEP(0, -2 * (100 * i / 3 + 51))
NEXT
LOCATE 14, 62: PRINT "P(xý)": LOCATE 15, 77: PRINT "df"
INPUT "Enter xýò0 and 1<dfó141: ", x, v
a = v / 2: b = a - 1: c = x / 2
d = x ^ b / (2 ^ a * EXP(c))
IF INT(a) = a THEN 5
a = b: GOTO 10
5 p = 1: FOR i = 2 TO b: p = p * i: NEXT i
d = d / p: GOTO 30
15 b = b - 1: a = a * b
10 IF b = .5 THEN 35
GOTO 15
35 d = d / a / 1.772453851#
30 g = 1: h = 0: f = v: z = 1
20 e = e + 1: f = f + 2
g = g / f
z = z + x ^ e * g
IF z = h THEN 25
h = z: GOTO 20
25 PRINT "P("; x; ")="; (z) * 2 * x / v * d



