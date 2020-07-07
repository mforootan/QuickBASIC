DEF FNf (x) = INT(x) - 10 * INT(x / 10)
CLS
FOR b = 1 TO 9
FOR s = 1 TO 9
i = b
DO
t$ = t$ + STR$(i)
i = i + s
IF i >= 10 THEN i = FNf(i)
LOOP UNTIL i = b
PRINT VAL(t$);
t$ = "": NEXT
PRINT
NEXT
DO
LOCATE 10, 1: INPUT "Enter start and step: ", b, s
  b = FNf(b): s = FNf(s): i = b
  LOCATE 11, 8: PRINT b; : LOCATE 11, 17: PRINT s
  DO
      PRINT i;
      i = i + s
      IF i >= 10 THEN i = FNf(i)
  LOOP UNTIL i = b
  PRINT : PRINT "PRESS ANY KEY TO REDO"
  DO WHILE INKEY$ = "": LOOP
  LOCATE 10, 1: PRINT "                                                     ": LOCATE 11, 1: PRINT "                                   ": LOCATE 12, 1: PRINT "                                      ": LOCATE 13, 1: PRINT  _
"                                "
LOOP




