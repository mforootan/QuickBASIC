CONST iter = 50
CLS
COLOR 0, 3: LOCATE 1, 13
PRINT " Newton`s method for finding roots of polynomials "
COLOR 2, 0: LOCATE 3, 2
PRINT "Enter the order of the polynomial: "
COLOR 15: LOCATE 3, 37
INPUT "", order%: order% = ABS(order%)
DIM coef(order%)
equstring$ = ""
FOR i = order% TO 0 STEP -1
   COLOR 12: LOCATE 6, 2
   PRINT "Enter coefficient for x^"; LTRIM$(STR$(i))
   COLOR 15: LOCATE 7, 2
   INPUT "", coef(i)
   IF i <> 1 THEN power$ = "^" + LTRIM$(STR$(i)) ELSE power$ = ""
' ******* In this block, we will build the equation as a string
   SELECT CASE SGN(coef(i))
      CASE 1
         SELECT CASE coef(i)
            CASE 1
               IF i <> 0 THEN
                  coefstring$ = "+x" + power$
                 ELSE
                  coefstring$ = "+1"
               END IF
            CASE ELSE
               coefstring$ = "+" + LTRIM$(STR$(coef(i)))
               IF i <> 0 THEN coefstring$ = coefstring$ + "*x" + power$
         END SELECT
      CASE -1
         SELECT CASE coef(i)
            CASE -1
               IF i <> 0 THEN
                  coefstring$ = "-x" + power$
                 ELSE
                  coefstring$ = "-1"
               END IF
            CASE ELSE
               coefstring$ = LTRIM$(STR$(coef(i)))
               IF i <> 0 THEN coefstring$ = coefstring$ + "*x" + power$
            END SELECT
      CASE 0
         coefstring$ = ""
   END SELECT
   IF LEN(equstring$) > 60 THEN
      equstring$ = "Equation out of screen" + SPACE$(40)
   END IF
   equstring$ = equstring$ + coefstring$
   LOCATE 6, 2
   PRINT SPACE$(30)
   LOCATE 7, 2
   PRINT SPACE$(30)
NEXT
IF LEFT$(equstring$, 1) = "+" THEN equstring$ = MID$(equstring$, 2)
equstring$ = "f(x): " + equstring$ + "=0"
' ******** End of equation string
COLOR 12: LOCATE 6, 2
PRINT equstring$
DO WHILE check# < 9999
   COLOR 14: LOCATE 9, 2
   PRINT "Input the initial value for x (9999 or more to exit):"
   COLOR 15: LOCATE 9, 58
   PRINT SPACE$(5)
   LOCATE 9, 58
   INPUT "", init#: check# = init#
   LOCATE 22, 2
   PRINT SPACE$(65)
   LOCATE 13, 2
   PRINT SPACE$(50)
   LOCATE 12, 2
   PRINT SPACE$(50)
   FOR cnt = 1 TO iter
' *** Here we will calculate the amount of f(x)
      func = 0
      FOR i = 0 TO order%
         func = func + init# ^ i * coef(i)
      NEXT
      IF func = 0 THEN EXIT FOR
' *** Here we will calculate f`(x)
      deriv = 0
      FOR i = 1 TO order%
         deriv = deriv + coef(i) * i * init# ^ (i - 1)
      NEXT
      IF deriv = 0 THEN
         fail = 1
         EXIT DO
      END IF
      IF ABS(func / deriv) > 10 THEN
         COLOR 20: LOCATE 22, 2
         PRINT "Warning! x is varying appreciably. It may not approach a root."
      END IF
' NOTE: X = x - [ f(x) / f`(x) ]
      init# = init# - func / deriv
      COLOR 13: LOCATE 12, 2
      PRINT "x= "; init#
   NEXT
' *** Here we will calculate the amount of f(x)
   funct# = 0
   FOR i = 0 TO order%
      funct# = funct# + init# ^ i * coef(i)
   NEXT
   COLOR 9: LOCATE 13, 2
   PRINT funct#
LOOP
IF fail = 1 THEN
   LOCATE 22, 2: COLOR 20
   PRINT "Method Failed."
END IF
COLOR 15
SYSTEM

