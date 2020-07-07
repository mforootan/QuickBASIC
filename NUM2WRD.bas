10 DATA ,one,two,three,four,five,six,seven,eight,nine
20 DATA ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen,seventeen,eighteen,nineteen
30 DATA ,twenty,thirty,fourty,fifty,sixty,seventy,eighty,ninety,hundred
DIM prime$(9), zegond$(9), triers$(10), ragham%(2)
RESTORE 10
FOR i = 0 TO 9
   READ prime$(i)
NEXT
RESTORE 20
FOR i = 0 TO 9
   READ zegond$(i)
NEXT
RESTORE 30
FOR i = 1 TO 10
   READ triers$(i)
NEXT
CLS
DO
   INPUT "Enter your number up to 999 : ", adad%
LOOP UNTIL adad% < 1000
num = adad%
FOR i = 0 TO 2
   ragham%(i) = num - 10 * (num \ 10)
   num = num \ 10
   'PRINT ragham%(i)
NEXT
'END
reshte$ = ""
doragham% = 10 * ragham%(1) + ragham%(0)
SELECT CASE doragham%
   CASE 10 TO 19
      reshte$ = resthe$ + zegond$(ragham%(0))
   CASE ELSE
      reshte$ = reshte$ + triers$(ragham%(1)) + " " + prime$(ragham%(0))
END SELECT
IF ragham%(2) <> 0 THEN
   reshte$ = prime$(ragham%(2)) + " hundred " + reshte$
END IF

WRITE reshte$
      

