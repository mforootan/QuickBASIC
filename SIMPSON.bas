CONST masir$ = "c:\massih\quick\"
COMMON x(), y(), inter%, ctrl, upper, lower, yupper, ylower, formula$, h#
'**** This part of program only draws the starting graph
DEF fnc (x) = .39894228# * EXP(-.5 * x ^ 2)     'Function of the curve

IF ctrl = 0 THEN

SCREEN 9

PSET (153, 82)
' Drawing the curve
COLOR 4
FOR z = -2.9 TO 1.3 STEP .1
   LINE -((200 * z / 3 + 324), -150 * fnc(z) + 85)
NEXT
'drawing the lines under the curve
COLOR 1
FOR z = -2.68 TO 1.2 STEP .63
   LINE ((200 * z / 3 + 323), 122)-STEP(0, -150 * fnc(z) - 35)
NEXT
COLOR 2
LINE (105, 122)-STEP(340, 0)
'******* Texts around the graph
LOCATE 4, 23: COLOR 12
PRINT "y=f(x)"
LOCATE 10, 18: COLOR 10
PRINT "X0   X1  .   .   .   .   .   .  Xn        (n=2k)"
LOCATE 5, 35: COLOR 9
PRINT CHR$(27) + " h " + CHR$(26)
LOCATE 5, 60: COLOR 9
PRINT "h=(Xn-X0)/n"
COLOR 5
LOCATE 11, 9
PRINT "ô xn"
LOCATE 12, 5
PRINT "S = ³  f(x)dx = (h/3)*[f(x0)+4*f(x1)+2*f(x2)+4*f(x3)+2*f(x4)+...+f(xn)]"
LOCATE 13, 9
PRINT "õ x0"
LOCATE 1, 15: COLOR 11
PRINT "Simpson`s rule for calculating area under a curve"
VIEW (1, 185)-(638, 334)
' asking for function (it will be pasted in another program named FORMULA.BAS
COLOR 4: LOCATE 15, 2
PRINT "Enter funtion f(x) where y-f(x)=0 : "
LOCATE 23, 2
PRINT "NOTE: Use ONLY syntax which is LEGAL in QuickBASIC."
COLOR 12: LOCATE 17, 2
INPUT "f(x)=", formula$
OPEN masir$ + "formula.bas" FOR OUTPUT AS #1
PRINT #1, "common x(),y(),inter%,ctrl,upper,lower,yupper,ylower,formula$,h#"
PRINT #1, "def fny(x)=" + formula$
PRINT #1, "select case ctrl"
PRINT #1, "case 1"
PRINT #1, "ylower=fny(lower):yupper=fny(upper)"
PRINT #1, "chain " + CHR$(34) + masir$ + "simpson.bas" + CHR$(34)
PRINT #1, "case 2"
PRINT #1, "for i=1 to inter%"
PRINT #1, "y(i)=fny(x(i))"
PRINT #1, "next"
PRINT #1, "chain " + CHR$(34) + masir$ + "simpson.bas" + CHR$(34)
PRINT #1, "end select"
CLOSE #1

END IF

DO

   IF ctrl = 0 THEN

   CLS
   COLOR 4: LOCATE 15, 2
   PRINT "f(x)=" + formula$
   COLOR 2: LOCATE 16, 2
   PRINT "Enter your upper & lower bounds (X0 , Xn)"
   LOCATE 17, 2: COLOR 10
   INPUT "", upper, lower
   IF upper < lower THEN SWAP upper, lower
   COLOR 2
   ctrl = 1
   CHAIN masir$ + "formula.bas"

   END IF

   IF SGN(yupper) * SGN(ylower) = -1 THEN
      CLS
      ctrl = 0
      COLOR 10: LOCATE 16, 2
      PRINT "Upper and lower points of curve must be in ONE side of the axis."
      COLOR 2
      LOCATE 19, 2
      PRINT "Press any key to redo"
      k$ = INPUT$(1)
    ELSE
      EXIT DO
   END IF
LOOP
DO
   IF ctrl <> 2 THEN

   DO
      LOCATE 16, 1: PRINT SPACE$(50)
      COLOR 4: LOCATE 15, 2
      PRINT "f(x)=" + formula$
      COLOR 2: LOCATE 16, 2
      PRINT "X0="; lower; ";  Xn="; upper
      COLOR 9: LOCATE 17, 2
      PRINT "Enter an EVEN number for number of subintervals (n):         (Give 0 to quit)"
      LOCATE 17, 55
      INPUT "", inter%: inter% = ABS(inter%)  'change to a positive number
      IF inter% = 0 THEN COLOR 15: KILL masir$ + "formula.bas": SYSTEM
      IF inter% MOD 2 = 0 AND inter% > 1 THEN EXIT DO
   LOOP
   h# = (upper - lower) / inter%
   LOCATE 17, 2: PRINT SPACE$(78)
   LOCATE 17, 2
   PRINT "h ="; h#
'*** NOW! calculating is going to be started.
   REDIM x(inter%), y(inter%)
   FOR i = 0 TO inter%
      x(i) = lower + i * h#
   NEXT
      ctrl = 2
      CHAIN masir$ + "formula.bas"
   'y(i) = fny(x(i))

   END IF

   simsum# = 0
   FOR i = 1 TO inter% - 1
      simsum# = simsum# + 2 * (i MOD 2 + 1) * y(i)
   NEXT
   simsum# = simsum# + y(0) + y(inter%)
   simsum# = simsum# * h# / 3
   COLOR 13: LOCATE 19, 2
   PRINT "S ÷"; simsum#
   ctrl = 0
   COLOR 3: LOCATE 22, 2
   PRINT "Press any key to change subinterval width."
   k = ASC(INPUT$(1))
LOOP



