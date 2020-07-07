DECLARE FUNCTION f2e$ (adad!)
DECLARE FUNCTION si% (a$)
'$DYNAMIC
DECLARE SUB box (rowstart!, colstart!, length!, height!)
DECLARE SUB justcent (a$)
DECLARE SUB justleft (a$)
OPTION BASE 1
CONST masir$ = "f:\", mobadel$ = "mystyle"
SHELL masir$ + mobadel$
CLS
COLOR 0, 11: LOCATE 1, 5
justcent (" ό¨ώσπχ/ό¨¤‘κ ωχ‘“¥ψΆ ωΆχχξ ’—¤υ ")
COLOR 2, 0
CALL box(3, 19, 40, 3)
COLOR 0, 2: LOCATE 3, 1
justcent (" όΆψ¤ψ β“χυ ")
COLOR 2, 0: LOCATE 7, 45
PRINT " ’‘΅—χ:[Tab] "
LOCATE 7, 21
PRINT " Άώώ‘—:[Enter] "
DIM manba$(2), ebarat$(10), kuchak$(10)
manba$(1) = "Άώσξ ωκ¬": manba$(2) = "ρώ‘κ"
COLOR 4
'LOCATE 5, 45: PRINT "Άώσξ ωκ¬"
'LOCATE 5, 30: PRINT "ρώ‘κ"
opshen = 1
DO
   FOR i = 1 TO 2
      IF i = opshen THEN rang = 12 ELSE rang = 4
      COLOR rang
      LOCATE 5, 15 * (i + 1)
      PRINT manba$(i)
   NEXT
   k = ASC(INPUT$(1))
   SELECT CASE k
      CASE 9
         opshen = 3 - opshen
      CASE 13
         EXIT DO
      CASE ELSE
   END SELECT
LOOP
CLS
COLOR 11, 0: LOCATE 1, 5
justcent (" ό¨ώσπχ/ό¨¤‘κ ωχ‘“¥ψΆ ωΆχχξ ’—¤υ ")
COLOR 4, 0: LOCATE 3, 1
justcent (manba$(opshen) + " :όΆψ¤ψ β“χυ")
SELECT CASE opshen
   CASE 1
      shomar = 0
      DO
         LOCATE 5, 1: COLOR 2
         justleft ("(.Άώχξ Ά¤ψ όσ‘΅ ω—ª¤ νώ ωυ—‘΅ ό¤“):Άώχξ Ά¤ψ ¤ " + f2e$(shomar + 1) + " ω¤‘υª –¤‘“δ")
         shomar = shomar + 1
         LOCATE 6, 70: COLOR 15
         'LINE INPUT ebarat$(shomar)
         'PRINT ebarat$(shomar)
         'CALL tahrir
         ebarat$(shomar) = rast$: kuchak$(shomar) = freshorde$
         IF shomar = UBOUND(ebarat$) THEN
            REDIM PRESERVE ebarat$(shomar + 10), kuchak$(shomar + 10)
         END IF
         IF RTRIM$(LTRIM$(ebarat$(shomar))) = "" THEN EXIT DO
      LOOP
   CASE 2

END SELECT

REM $STATIC
SUB box (rowstart, colstart, length, height)

LOCATE rowstart, colstart: PRINT CHR$(201)
FOR i = 1 TO length: LOCATE rowstart, colstart + i: PRINT CHR$(205): NEXT
LOCATE rowstart, colstart + length + 1: PRINT CHR$(187)
FOR i = 1 TO height: LOCATE rowstart + i, colstart: PRINT CHR$(186): NEXT
FOR i = 1 TO height: LOCATE rowstart + i, colstart + length + 1: PRINT CHR$(186): NEXT
LOCATE rowstart + height + 1, colstart: PRINT CHR$(200)
LOCATE rowstart + height + 1, colstart + length + 1: PRINT CHR$(188)
FOR i = 1 TO length: LOCATE rowstart + height + 1, colstart + i: PRINT CHR$(205): NEXT
FOR i = 1 TO height: FOR j = 1 TO length: LOCATE rowstart + i, colstart + j: PRINT CHR$(32): NEXT: NEXT

END SUB

FUNCTION f2e$ (adad)

hazf$ = LTRIM$(RTRIM$(STR$(adad)))
FOR i = 1 TO LEN(hazf$)
   anbar$ = anbar$ + CHR$(80 + ASC(MID$(hazf$, i, 1)))
NEXT
f2e$ = anbar$

END FUNCTION

SUB justcent (a$)

makan = (81 - LEN(a$)) \ 2
LOCATE , makan
PRINT a$

END SUB

SUB justleft (a$)

makan = 81 - LEN(a$)
LOCATE , makan
PRINT a$

END SUB

FUNCTION si% (a$)

SELECT CASE ASC(a$)
   CASE 141, 144, 145
      si% = 10
   CASE 146, 147
      si% = 20
   CASE 148, 149
      si% = 30
   CASE 150, 151
      si% = 40
   CASE 152, 153
      si% = 50
   CASE 154, 155
      si% = 60
   CASE 156, 157
      si% = 70
   CASE 158, 159
      si% = 80
   CASE 160, 161
      si% = 90
   CASE 162
      si% = 100
   CASE 163
      si% = 110
   CASE 164
      si% = 120
   CASE 165
      si% = 130
   CASE 166
      si% = 140
   CASE 167, 168
      si% = 150
   CASE 169, 170
      si% = 160
   CASE 171, 172
      si% = 170
   CASE 173, 174
      si% = 180
   CASE 175
      si% = 190
   CASE 224
      si% = 200
   CASE 225 TO 228
      si% = 210
   CASE 229 TO 232
      si% = 220
   CASE 233, 234
      si% = 230
   CASE 235, 236
      si% = 240
   CASE 237, 238
      si% = 250
   CASE 239, 240
      si% = 260
   CASE 241, 243
      si% = 270
   CASE 244, 245
      si% = 280
   CASE 246, 247
      si% = 290
   CASE 248
      si% = 300
   CASE 249 TO 251
      si% = 310
   CASE 252 TO 254
      si% = 320
   CASE 142, 143
      si% = 15
   CASE 65 TO 90
      si% = (ASC(a$) - 32) * 10
   CASE 97 TO 122
      si% = (ASC(a$) - 64) * 10
   CASE 128 TO 137
      si% = (ASC(a$) - 69) * 10
   CASE 48 TO 57
      si% = (ASC(a$) + 11) * 10
   CASE ELSE
      si% = -1
END SELECT

END FUNCTION

