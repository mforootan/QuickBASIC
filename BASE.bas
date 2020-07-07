'DEFLNG A-Z
DECLARE FUNCTION digit (num)
DATA 0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
DIM ragham$(35)
FOR i = 0 TO 35
   READ ragham$(i)
NEXT
CLS
LOCATE 1, 32: COLOR 0, 4
PRINT " Base Convertor "

LOCATE 2, 1: COLOR 2, 0
PRINT "Enter 1st base:"
DO
   LOCATE 3, 1: PRINT SPACE$(5)
   LOCATE 3, 1: COLOR 7
   INPUT "", mabna1: mabna1 = ABS(mabna1)
LOOP UNTIL mabna1 > 1 AND mabna1 <= 36
LOCATE 3, 1: PRINT SPACE$(5)
LOCATE 3, 1: COLOR 7
PRINT mabna1

COLOR 12, 0
LOCATE 20, 1
PRINT "Legal Digits"
FOR i = 1 TO mabna1
   LOCATE 20, 13 + i
   PRINT UCASE$(ragham$(i - 1))
NEXT
LOCATE 5, 1: COLOR 10
PRINT "Enter an INTEGER, POSITIVE number:"
DO
   LOCATE 6, 1: PRINT SPACE$(60)
   LOCATE 6, 1: COLOR 15
   INPUT "", adad$
   adad$ = UCASE$((LTRIM$(RTRIM$(adad$))))
   zarb = 1
   FOR i = 1 TO LEN(adad$)
      harf = ASC(MID$(adad$, i, 1))
      IF (harf >= 65 AND harf <= 90) OR (harf >= 48 AND harf <= 57) THEN amel = 1 ELSE amel = 0
      IF digit(harf) >= mabna1 THEN amel = 0
      zarb = zarb * amel
   NEXT
   IF zarb <> 0 AND LEN(adad$) <> 0 THEN EXIT DO
LOOP
LOCATE 6, 1: PRINT SPACE$(60): COLOR 15
LOCATE 6, 2: PRINT adad$
LOCATE 8, 1: COLOR 3
PRINT "Enter 2nd base:"
DO
   LOCATE 9, 1: PRINT SPACE$(5)
   LOCATE 9, 1: COLOR 7
   INPUT "", mabna2: mabna2 = ABS(mabna2)
LOOP UNTIL mabna2 > 1 AND mabna2 <= 36
LOCATE 9, 1: PRINT SPACE$(5)
LOCATE 9, 1: COLOR 7
PRINT mabna2
dah = 0
FOR i = 1 TO LEN(adad$)
   yekan = digit(ASC(MID$(adad$, i, 1)))
   dah = dah + yekan * mabna1 ^ (LEN(adad$) - i)
NEXT
javab$ = ""
DO
   bakhshi = dah \ mabna2
   mande = dah MOD mabna2
   javab$ = ragham$(mande) + javab$
   dah = bakhshi
LOOP UNTIL dah < mabna2
javab$ = ragham$(bakhshi) + javab$
LOCATE 11, 1: COLOR 11
PRINT "The equivalent number is:"
LOCATE 12, 1: COLOR 15
PRINT UCASE$(javab$)
x$ = INPUT$(1)
SYSTEM

FUNCTION digit (num)

SELECT CASE num
   CASE 48 TO 57
      digit = num - 48
   CASE 65 TO 90
      digit = num - 55
END SELECT

END FUNCTION

