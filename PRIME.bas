RANDOMIZE TIMER
kolor = 1 + INT(RND * 7)
COLOR kolor + 8: CLS
com$ = COMMAND$
SELECT CASE com$
   CASE ""
      INPUT "Enter down and up limit :", downlimit%, uplimit%
   CASE ELSE
      IF INSTR(com$, ",") = 0 THEN
         PRINT "Syntax: PRIME num1 , num2"
         END
      END IF
      comma = INSTR(com$, ",")
      downlimit% = VAL(MID$(com$, 1, comma - 1)): uplimit% = VAL(MID$(com$, comma + 1))
END SELECT
IF SGN(downlimit%) = -1 OR SGN(uplimit%) = -1 THEN dis = 1 ELSE dis = 0
downlimit% = ABS(downlimit%): uplimit% = ABS(uplimit%)
IF uplimit% = 0 THEN uplimit% = 1
IF downlimit% = 0 THEN downlimit% = 1
IF downlimit% > uplimit% THEN SWAP uplimit%, downlimit%
CLS : PRINT
FOR i = downlimit% TO uplimit%
   product = 1
   FOR j = 2 TO INT(SQR(i))
      product = product * (i MOD j): IF product > 1000 THEN product = 1
   NEXT
   IF product <> 0 THEN colour = kolor + 8 ELSE colour = kolor
   SELECT CASE dis
      CASE 0
       IF product <> 0 THEN COLOR kolor: PRINT i; " ";
      CASE 1
       COLOR colour: PRINT i; " ";
   END SELECT
NEXT


