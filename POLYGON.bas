CONST dopi = 6.2831852#
RANDOMIZE TIMER
SCREEN 12
yek% = 3
dow% = 20
jahat% = 1
rang% = 10 + INT(RND * 5)
DO
   FOR zel% = yek% TO dow% STEP jahat%
      CLS
      LOCATE 15, 38
      PRINT USING "###"; zel%
      qows = dopi / zel%
      avval = (.5 * dopi + qows) / 2
      x0 = 320 + 200 * COS(avval)
      y0 = 240 + 200 * SIN(avval)
      PSET (x0, y0)
      FOR zavie = avval TO dopi + avval STEP qows
         x = 320 + 200 * COS(zavie)
         y = 240 + 200 * SIN(zavie)
         LINE -(x, y), rang%
      NEXT
      LINE -(x0, y0), rang%
      SLEEP 1
   NEXT
   SWAP yek%, dow%
   jahat% = jahat% * -1
LOOP


