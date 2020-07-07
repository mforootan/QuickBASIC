DECLARE FUNCTION dec2bin$ (dah)
CLS
COLOR 2
PRINT "Number of questions";
COLOR 10
INPUT kol
DIM soal(kol), daste(kol)
FOR i = 1 TO kol
   daste(i) = 0
   COLOR 3
   PRINT "Probability of question number"; i;
   COLOR 11
   DO
      INPUT soal(i)
      IF soal(i) < 0 OR soal(i) > 100 THEN PRINT "Probability must be between 0 and 100"
   LOOP WHILE soal(i) < 0 OR soal(i) > 100
NEXT
FOR i = 0 TO 2 ^ kol - 1
   movaghat = i
   tarkib$ = dec2bin$(i)
   i = movaghat
   jam = 0
   zarb = 1
   FOR j = 1 TO kol
      jam = jam + VAL(MID$(tarkib$, j, 1))
      SELECT CASE VAL(MID$(tarkib$, j, 1))
         CASE 0
            zarb = zarb * (100 - soal(j)) / 100
         CASE ELSE
            zarb = zarb * soal(j) / 100
      END SELECT
   NEXT
   daste(jam) = daste(jam) + zarb
NEXT
jamkol = 0
FOR i = 0 TO kol
jamkol = jamkol + daste(i)
   COLOR 4
   PRINT "Probability of"; i; " correct answer(s) is:";
   COLOR 12
   PRINT USING " ##.##%"; daste(i) * 100;
   PRINT USING " #.####"; jamkol
NEXT
DO UNTIL INKEY$ <> "": LOOP
SYSTEM

FUNCTION dec2bin$ (dah)

SHARED kol
javab$ = ""
DO
   bakhshi = dah \ 2
   mande = dah MOD 2
   javab$ = LTRIM$(STR$(mande)) + javab$
   dah = bakhshi
LOOP UNTIL dah < 2
javab$ = LTRIM$(STR$(bakhshi)) + javab$
dec2bin$ = STRING$(kol - LEN(javab$), "0") + javab$

END FUNCTION

