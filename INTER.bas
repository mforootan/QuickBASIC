DECLARE FUNCTION fact! (k, n)
CLS
INPUT "X(min),X(max),n ", xmin, xmax, n
h = (xmax - xmin) / (n - 1)
DIM x(n - 1), y(n - 1), del(n - 1, n - 1)
FOR i = 0 TO n - 1
   x(i) = i * h + xmin
   PRINT "x("; i; ")="; x(i); " y("; i; ")=";
   INPUT y(i)
NEXT
FOR i = 1 TO n - 1
   del(1, i) = y(i) - y(i - 1)
NEXT
FOR i = 2 TO n - 1
   FOR j = i TO n - 1
      del(i, j) = del(i - 1, j) - del(i - 1, j - 1)
   NEXT
NEXT
DO
   INPUT "x="; xs
   k = (xs - x(n - 1)) / h
   ys = y(n - 1)
   FOR i = 1 TO n - 1
      ys = ys + fact(k, n) * del(i, n - 1)
   NEXT
   PRINT "x="; xs; " ,y="; ys
LOOP UNTIL xs < xmin OR xs > xmax
END

FUNCTION fact (k, n)

p = 1
FOR i = k TO k + n - 1
p = p * i
NEXT
q = 1
FOR i = 2 TO n
q = q * i
NEXT
fact = p / q

END FUNCTION

