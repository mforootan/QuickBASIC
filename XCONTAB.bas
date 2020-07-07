REM contingency table
CLS : OPTION BASE 1
INPUT "Enter the number of lines and columns:", m, n
DIM o(m, n), e(m, n), sl(m), sc(n): df = (m - 1) * (n - 1)
FOR i = 1 TO m: FOR j = 1 TO n
PRINT "a("; i; ","; j; ")="; : INPUT o(i, j)
sl(i) = sl(i) + o(i, j): sc(j) = sc(j) + o(i, j): t = t + o(i, j)
NEXT: NEXT: IF df = 1 THEN ad = .5 ELSE ad = 0
FOR i = 1 TO m: FOR j = 1 TO n
e(i, j) = sl(i) * sc(j) / t
x = ABS((o(i, j) - e(i, j)) ^ 2 - ad) / e(i, j)
x2 = x2 + x
NEXT: NEXT
PRINT "xý="; x2, "df="; df,
a = df / 2: b = a - 1: c = x2 / 2
d = x2 ^ b / (2 ^ a * EXP(c))
IF INT(a) = a THEN 5
a = b: GOTO 10
5 p = 1: FOR i = 2 TO b: p = p * b: NEXT
d = d / p: GOTO 30
15 b = b - 1: a = a * b
10 IF b = .5 THEN 35
GOTO 15
35 d = d / a / 1.772453851#
30 g = 1: h = 0: f = df: z = 1
20 e = e + 1: f = f + 2
g = g * f
z = z + x2 ^ e / g
IF z = h THEN 25
h = z: GOTO 20
25 PRINT "P(xý)="; 1 - (z * 2 * x2 / df * d)


