'             ÛÛÛÛÛÛ  ÛÛ      ÛÛÛÛÛÛ   ÛÛÛÛÛÛ   ÛÛÛÛÛÛ   ÛÛ
'            ÛÛ    ÛÛ ÛÛ     ÛÛ    ÛÛ ÛÛ    ÛÛ ÛÛ    ÛÛ  ÛÛ
'            ÛÛ       ÛÛ     ÛÛ    ÛÛ ÛÛ       ÛÛ    ÛÛ  ÛÛ
'            ÛÛ       ÛÛ     ÛÛ    ÛÛ ÛÛ       ÛÛÛÛÛÛÛÛ  ÛÛ
'            ÛÛ    ÛÛ ÛÛ     ÛÛ    ÛÛ ÛÛ    ÛÛ ÛÛ    ÛÛ  ÛÛ
'             ÛÛÛÛÛÛ  ÛÛÛÛÛÛ  ÛÛÛÛÛÛ   ÛÛÛÛÛÛ  ÛÛ    ÛÛ  ÛÛÛÛÛÛ
'                                                               TM
'            ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
'            º             Graphic Clock & Calendar           º
'            º                 ® Version 1.3 ¯                º
'            º             (With monochrome vision)           º
'            ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
'            º          Written by:  Massih Forootan          º
'            º        Copyright (c) 1995-1996 Home Ltd.       º
'            º              All rights reserved.              º
'            ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
'
'                     To execute, press [Shift]+[F5]
'
DECLARE SUB bcolour ()
DECLARE SUB colour ()
DECLARE SUB hour ()
DECLARE SUB second ()
DECLARE SUB minute ()
DECLARE FUNCTION day$ (d$)
DECLARE SUB drn (n!, xi!, ys!, sc!)
5 DATA 200,100,238,130,255,170,238,213,200,240,140,255,80,240,45,213,25,170,45,130,80,100,140,87
10 DATA " January "," February","  March  ","  April  ","   May   ","   June  ","   July  ","  August ","September"," October "," November"," December"
20 DATA "  Monday "," Tuesday ","Wednesday"," Thursday","  Friday "," Saturday","  Sunday ",
30 DATA 31,28,31,30,31,30,31,31,30,31,30,31
DIM mnt$(12), x(12), y(12)
DIM SHARED bclr(15), clr(15)
RESTORE 5: FOR i = 1 TO 12: READ x(i), y(i): NEXT
RESTORE 10: FOR i = 1 TO 12: READ mnt$(i): NEXT
SCREEN 9
index = 0
DO
CLS
IF TIMER >= 21600 AND TIMER <= 64800 THEN dec$ = "yes" ELSE dec$ = "no"
CALL colour: CALL bcolour
CIRCLE (150, 178), 143, clr(1): IF dec$ = "yes" THEN PAINT STEP(0, 0), 7, 1
CIRCLE (150, 178), 133, clr(15): IF dec$ = "yes" THEN PAINT STEP(0, 0), 15
COLOR clr(2)
FOR i = 1 TO 12: CALL drn(i, x(i), y(i), 2.3): NEXT
DO
CALL colour: CALL bcolour
mt = VAL(MID$(DATE$, 1, 2)): dy = VAL(MID$(DATE$, 4, 2)): yr = VAL(MID$(DATE$, 7, 4))
LOCATE 7, 43: COLOR clr(12), bclr(7): PRINT SPACE$(4) + STR$(yr); : COLOR clr(9): PRINT SPACE$(6) + mnt$(mt) + "      "
LOCATE 19, 43: COLOR clr(6), bclr(7): PRINT SPACE$(10) + day$(DATE$) + SPACE$(11)
LINE (336, 83)-STEP(239, 183), clr(1), B
LINE (338, 100)-STEP(235, 152), bclr(15), BF
COLOR clr(5): CALL drn(dy, 365, 115, .25)
IF dec$ = "no" THEN LINE (336, 100)-STEP(239, 0), clr(15)
IF dec$ = "no" THEN LINE (336, 252)-STEP(239, 0), clr(15)
IF dec$ = "yes" THEN PAINT (0, 0), 1, 1
IF TIMER >= 21600 AND TIMER <= 64800 THEN dec$ = "yes" ELSE dec$ = "no"
DO
IF INKEY$ = CHR$(27) THEN SYSTEM
t = TIMER
h = t \ 3600: m = (t MOD 3600) \ 60: s = (t MOD 3600) MOD 60
ans = (6 * s) MOD 360: anm = (6 * m) MOD 360: anh = (30 * h + .5 * m) MOD 360
CALL second
CALL minute
CALL hour
IF (INT(TIMER) = 21600 OR INT(TIMER) = 64800) AND index = 0 THEN index = index + 1: EXIT DO
LOOP UNTIL INT(TIMER) = 0
LOOP UNTIL INT(TIMER) = 21600 OR INT(TIMER) = 64800
LOOP



SUB bcolour
SHARED dec$
FOR i = 1 TO 15
IF dec$ = "yes" THEN bclr(i) = i ELSE bclr(i) = 0
NEXT
END SUB

SUB colour
SHARED dec$
FOR i = 1 TO 15
IF dec$ = "yes" THEN clr(i) = i ELSE clr(i) = 14
NEXT
END SUB

FUNCTION day$ (d$)
mt = VAL(MID$(d$, 1, 2)): dy = VAL(MID$(d$, 4, 2)): yr = VAL(MID$(d$, 7, 4))
DIM w$(7), m(12)
RESTORE 20
FOR i = 1 TO 7: READ w$(i): NEXT
RESTORE 30
FOR i = 1 TO 12: READ m(i): NEXT
IF yr MOD 4 = 0 THEN m(2) = 29
y = yr - 1901
B = 365 * y + INT(y / 4)
FOR i = 1 TO mt - 1: B = B + m(i): NEXT
B = B + dy
B = B MOD 7 + 1
day$ = w$(B)
END FUNCTION

SUB drn (n, xi, ys, sc)
IF LEN(STR$(n)) = 2 THEN
nm$ = " " + STR$(n)
xi = xi - 10 / sc
ELSE
nm$ = STR$(n)
END IF
DIM dg$(1)
dg$(0) = MID$(nm$, 2, 1): dg$(1) = RIGHT$(nm$, 1)
FOR i = 0 TO 1
IF i = 1 THEN xs = xi + 23 / sc ELSE xs = xi
SELECT CASE dg$(i)
CASE "0"
CIRCLE (10 / sc + xs, 15 / sc + ys), 15 / sc, , , , 1.5
CASE "1"
LINE (10 / sc + xs, ys)-STEP(0, 30 / sc)
CASE "2"
CIRCLE (10 / sc + xs, 10 / sc + ys), 10 / sc, , , 3.142, .98
CIRCLE (10 / sc + xs, 10 / sc + ys), 10 / sc, , 5.498, 6.283
LINE STEP(6.99 / sc, 5.4 / sc)-(xs, 30 / sc + ys)
LINE (xs, 30 / sc + ys)-STEP(20 / sc, 0)
CASE "3"
LINE (xs, ys)-STEP(20 / sc, 0)
LINE -STEP(-10 / sc, 10 / sc)
CIRCLE (10 / sc + xs, 20 / sc + ys), 10 / sc, , , 1.571, .98
CIRCLE (10 / sc + xs, 20 / sc + ys), 10 / sc, , 3.142, 6.283, .98
CASE "4"
LINE (15 / sc + xs, 5 / sc + ys)-STEP(0, 25 / sc)
LINE (10 / sc + xs, ys)-STEP(-10 / sc, 20 / sc)
LINE -STEP(20 / sc, 0)
CASE "5"
CIRCLE (10 / sc + xs, 21 / sc + ys), 10 / sc, , , 1.571, .9
CIRCLE (10 / sc + xs, 21 / sc + ys), 10 / sc, , 3.142, 6.283, .9
LINE (20 / sc + xs, ys)-STEP(-18 / sc, 0)
LINE -STEP(-2 / sc, 12 / sc)
LINE -STEP(10 / sc, 0)
CASE "6"
CIRCLE (10 / sc + xs, 21 / sc + ys), 10 / sc, , , , .9
CIRCLE (20 / sc + xs, 20 / sc + ys), 20 / sc, , 1.8, 3.142, 1
CASE "7"
LINE (xs, ys)-STEP(20 / sc, 0)
LINE -STEP(-15 / sc, 30 / sc)
CASE "8"
CIRCLE (10 / sc + xs, 7 / sc + ys), 10 / sc, , , , .7
CIRCLE (10 / sc + xs, 22 / sc + ys), 10 / sc, , , , .8
CASE "9"
CIRCLE (10 / sc + xs, 9 / sc + ys), 9.95 / sc, , , , .9
LINE (20 / sc + xs, 10 / sc + ys)-STEP(0, 10.5 / sc)
CIRCLE (10 / sc + xs, 20.5 / sc + ys), 9.95 / sc, , 3.4, 6.28, .95
CASE ELSE
END SELECT
NEXT
END SUB

SUB hour
SHARED anh, eanh, dec$
ranh = anh * .01745329252#: reanh = eanh * .01745329252#
x = 69 * SIN(ranh): y = 52.5 * COS(ranh)
xs = 13.8 * SIN(ranh): ys = 10.5 * COS(ranh)
ex = 69 * SIN(reanh): ey = 52.5 * COS(reanh)
exs = 13.8 * SIN(reanh): eys = 10.5 * COS(reanh)
xl = 4.6 * SIN(ranh + 1.571): yl = 3.5 * COS(ranh + 1.571)
xr = 4.6 * SIN(ranh - 1.571): yr = 3.5 * COS(ranh - 1.571)
exl = 4.6 * SIN(reanh + 1.571): eyl = 3.5 * COS(reanh + 1.571)
exr = 4.6 * SIN(reanh - 1.571): eyr = 3.5 * COS(reanh - 1.571)
IF eanh <> anh THEN
LINE (150 + exs + exl, 178 - eys - eyl)-(150 + exs + exr, 178 - eys - eyr), bclr(15): LINE -(150 + ex, 178 - ey), bclr(15): LINE -(150 + exs + exl, 178 - eys - eyl), bclr(15)
IF dec$ = "yes" THEN PAINT (150 + ex / 2, 178 - ey / 2), 15, 15
END IF
LINE (150 + xs + xl, 178 - ys - yl)-(150 + xs + xr, 178 - ys - yr), clr(7): LINE -(150 + x, 178 - y), clr(7): LINE -(150 + xs + xl, 178 - ys - yl), clr(7)
IF dec$ = "yes" THEN PAINT (150 + x / 2, 178 - y / 2), 8, 7
IF dec$ = "yes" THEN LINE (150 + .5 * x, 178 - .5 * y)-STEP(.2 * x, -.2 * y), 10
eanh = anh
END SUB

SUB minute
SHARED anm, eanm, dec$
ranm = anm * .01745329252#: reanm = eanm * .01745329252#
x = 92 * SIN(ranm): y = 70 * COS(ranm)
xs = 13.8 * SIN(ranm): ys = 10.5 * COS(ranm)
ex = 92 * SIN(reanm): ey = 70 * COS(reanm)
exs = 13.8 * SIN(reanm): eys = 10.5 * COS(reanm)
xl = 4.6 * SIN(ranm + 1.571): yl = 3.5 * COS(ranm + 1.571)
xr = 4.6 * SIN(ranm - 1.571): yr = 3.5 * COS(ranm - 1.571)
exl = 4.6 * SIN(reanm + 1.571): eyl = 3.5 * COS(reanm + 1.571)
exr = 4.6 * SIN(reanm - 1.571): eyr = 3.5 * COS(reanm - 1.571)
IF eanm <> anm THEN
LINE (150 + exs + exl, 178 - eys - eyl)-(150 + exs + exr, 178 - eys - eyr), bclr(15): LINE -(150 + ex, 178 - ey), bclr(15): LINE -(150 + exl + exs, 178 - eys - eyl), bclr(15)
IF dec$ = "yes" THEN PAINT (150 + ex / 2, 178 - ey / 2), 15, 15
END IF
LINE (150 + xs + xl, 178 - ys - yl)-(150 + xs + xr, 178 - ys - yr), clr(7): LINE -(150 + x, 178 - y), clr(7): LINE -(150 + xl + xs, 178 - yl - ys), clr(7)
IF dec$ = "yes" THEN PAINT (150 + x / 2, 178 - y / 2), 8, 7
IF dec$ = "yes" THEN LINE (150 + .5 * x, 178 - .5 * y)-STEP(.2 * x, -.2 * y), 10
eanm = anm
END SUB

SUB second
SHARED ans, eans, dec$
rans = ans * .01745329252#: reans = eans * .01745329252#
x = 92 * SIN(rans): y = 70 * COS(rans)
xs = 12 * SIN(rans): ys = 9.13 * COS(rans)
ex = 92 * SIN(reans): ey = 70 * COS(reans)
exs = 12 * SIN(reans): eys = 9.13 * COS(reans)
IF eans <> ans THEN LINE (150 + exs, 178 - eys)-(150 + ex, 178 - ey), bclr(15)
LINE (150 + xs, 178 - ys)-(150 + x, 178 - y), clr(12)
eans = ans
END SUB

