CLS
INPUT reshte$
tedad% = LEN(reshte$) - 1
DIM harf(tedad%) AS STRING * 1
FOR i = 0 TO tedad%
   harf(i) = MID$(reshte$, i + 1, 1)
NEXT
tah% = 0
sar% = 0
FOR i = 0 TO tedad%
   tah% = tah% + i * (tedad% + 1) ^ i
   sar% = sar% + i * (tedad% + 1) ^ (tedad% - i)
NEXT
FOR i = sar% TO tah%
   mag% = i
   DO
      bag% = mag% MOD (tedad% + 1)
      kha% = mag% \ (tedad% + 1)
      tartib$ = harf(bag%) + tartib$
   LOOP WHILE kha% >= tedad% + 1
   tekrar% = 0
   FOR k = 1 TO tedad%
      yek$ = MID$(tartib$, k, 1)
      FOR j = k + 1 TO tedad% + 1
         dow$ = MID$(tartib$, j, 1)
         IF yek$ = dow$ THEN
            tekrar% = 1
            EXIT FOR
         END IF
      NEXT
      IF tekrar% = 1 THEN EXIT FOR
   NEXT
   IF tekrar = 0 THEN
      PRINT tartib$
   END IF
NEXT

END

