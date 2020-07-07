REM normal distribution
SCREEN 9
DEF FNf (x) = .39894228# * EXP(-.5 * x ^ 2)
PSET (400, 200)
FOR z = -3 TO 3 STEP .1
LINE -((100 * z / 3 + 500), -150 * FNf(z) + 200)
NEXT
PSET (400, 205): LINE -STEP(200, 0)
LOCATE 16, 62: PRINT 0: LOCATE 16, 67: PRINT "z"
FOR z = -3 TO 1 STEP .15
LINE ((100 * z / 3 + 500), 205)-STEP(0, -150 * FNf(z) - 5)
NEXT
LOCATE 13, 61: PRINT "P(z)"
INPUT "Enter z ", x: x1 = ABS(x)
t = 1 / (1 + .2316419 * x1)
q = .3989422803# * EXP(-x1 ^ 2 / 2)
a = .31938153#: b = -.356563782#
c = 1.78147937#: d = -1.821255978#
e = 1.330274429#
IF x > 0 THEN ttl = 1 ELSE ttl = 0
PRINT "P("; x; ")="; ttl - SGN(x) * q * (a * t + b * t ^ 2 + c * t ^ 3 + d * t ^ 4 + e * t ^ 5)

