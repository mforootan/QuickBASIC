SCREEN 9
CLS
DO
FOR i = 1 TO 7
COLOR i
t = TIMER
LINE (150, 300)-(450, 300)
LINE -(300, 300 - 150 * 3 ^ .5)
LINE -(150, 300): x2 = 300: x3 = 150: x4 = 297
FOR x1 = 450 TO 300 STEP -3
y1 = (x1 - 450) * 3 ^ .5 + 300
y2 = (150 - x2) * 3 ^ .5 + 300
t = TIMER
DO WHILE TIMER < t + .01: LOOP
LINE (x1, y1)-(x2, y2)
LINE (x2, y2)-(x3, 300)
x3 = x3 + 3
x2 = x2 - 3
x4 = x4 + 3
LINE (x1, y1)-(x4, 300)
NEXT
t = TIMER
DO: LOOP WHILE TIMER - t < .01
NEXT
LOOP WHILE TIMER - t < .01
SYSTEM

