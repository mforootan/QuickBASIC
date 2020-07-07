CLS
ebarat$ = " "
SHELL "f:\mystyle.com"
DO
zaban = 0
klid = ASC(INPUT$(1))
SELECT CASE klid
   CASE 9
      zaban = (zaban + 1) MOD 2
   CASE 13
      END
   CASE 65 TO 90, 97 TO 122, 48 TO 57, 32
      SELECT CASE zaban
         CASE 0
            SELECT CASE klid
               CASE 32
                  tah = ASC(LEFT$(ebarat$, 1))
                     SELECT CASE tah
                        CASE 146, 148, 150, 152, 154, 156, 158, 160, 167, 169, 171, 173, 233, 235, 237, 239, 244, 246
                           ebarat$ = MID$(ebarat$, 2)
                           ebarat$ = CHR$(tah + 1) + ebarat$
                        CASE 228, 232
                           ebarat$ = MID$(ebarat$, 2)
                           ebarat$ = CHR$(tah - 3) + ebarat$
                        CASE 243
                           ebarat$ = MID$(ebarat$, 2)
                           ebarat$ = CHR$(tah - 2) + ebarat$
                        CASE 250, 251
                           ebarat$ = MID$(ebarat$, 2)
                           ebarat$ = CHR$(249) + ebarat$
                        CASE 254
                           ebarat$ = MID$(ebarat$, 2)
                           tah2 = ASC(LEFT$(ebarat$, 1))
                           SELECT CASE tah2
                              CASE 141, 144, 145, 242, 162 TO 166, 248, 32
                                 ebarat$ = CHR$(253) + ebarat$
                              CASE ELSE
                                 ebarat$ = CHR$(252) + ebarat$
                           END SELECT
                     END SELECT
               CASE 48 TO 57

               CASE 65, 97
                  ebarat$ = CHR$(170) + ebarat$
               CASE 66, 98
                  ebarat$ = CHR$(163) + ebarat$
               CASE 67, 99
                  ebarat$ = CHR$(165) + ebarat$
               CASE 68, 100
                  ebarat$ = CHR$(254) + ebarat$
               CASE 69, 101
                  ebarat$ = CHR$(153) + ebarat$
               CASE 70, 102
                  ebarat$ = CHR$(147) + ebarat$
               CASE 71, 103
                  ebarat$ = CHR$(243) + ebarat$
               CASE 72, 104
                  SELECT CASE ASC(LEFT$(ebarat$, 1))
                     CASE 241, 243
                        ebarat$ = MID$(ebarat$, 2)
                        ebarat$ = CHR$(242) + ebarat$
                     CASE 242, 144, 145, 162 TO 166, 248, 32, 128 TO 137, 65 TO 90, 97 TO 122, 48 TO 57
                        ebarat$ = CHR$(144) + ebarat$
                     CASE ELSE
                        ebarat$ = CHR$(145) + ebarat$
                  END SELECT
               CASE 73, 105
                  SELECT CASE ASC(LEFT$(ebarat$, 1))
                     CASE 242, 144, 145, 162 TO 166, 248, 32, 128 TO 137, 65 TO 90, 97 TO 122, 48 TO 57
                        ebarat$ = CHR$(251) + ebarat$
                     CASE ELSE
                        ebarat$ = CHR$(250) + ebarat$
                  END SELECT
               CASE 74, 106
                  ebarat$ = CHR$(151) + ebarat$
               CASE 75, 107
                  ebarat$ = CHR$(247) + ebarat$
               CASE 76, 108
                  ebarat$ = CHR$(245) + ebarat$
               CASE 77, 109
                  ebarat$ = CHR$(142) + ebarat$
               CASE 78, 110
                  ebarat$ = CHR$(162) + ebarat$
               CASE 79, 111
                  ebarat$ = CHR$(161) + ebarat$
               CASE 80, 112
                  ebarat$ = CHR$(159) + ebarat$
               CASE 81, 113
                  ebarat$ = CHR$(174) + ebarat$
               CASE 82, 114
                  ebarat$ = CHR$(236) + ebarat$
               CASE 83, 115
                  ebarat$ = CHR$(168) + ebarat$
               CASE 84, 116
                  ebarat$ = CHR$(234) + ebarat$
               CASE 85, 117
                  SELECT CASE ASC(LEFT$(ebarat$, 1))
                     CASE 242, 144, 145, 162 TO 166, 248, 32, 128 TO 137, 65 TO 90, 97 TO 122, 48 TO 57
                        ebarat$ = CHR$(228) + ebarat$
                     CASE ELSE
                        ebarat$ = CHR$(227) + ebarat$
                  END SELECT
               CASE 86, 118
                  ebarat$ = CHR$(164) + ebarat$
               CASE 87, 119
                  ebarat$ = CHR$(172) + ebarat$
               CASE 88, 120
                  ebarat$ = CHR$(175) + ebarat$
               CASE 89, 121
                  SELECT CASE ASC(LEFT$(ebarat$, 1))
                     CASE 242, 144, 145, 162 TO 166, 248, 32, 128 TO 137, 65 TO 90, 97 TO 122, 48 TO 57
                        ebarat$ = CHR$(232) + ebarat$
                     CASE ELSE
                        ebarat$ = CHR$(231) + ebarat$
                  END SELECT
               CASE 90, 122
                  ebarat$ = CHR$(224) + ebarat$
            END SELECT
         CASE 1
      END SELECT
END SELECT

LOCATE 1, 1
WRITE ebarat$
LOOP

