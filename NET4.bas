CLS
SCREEN 9
FOR n = 1 TO 15
'SLEEP 1
COLOR n: x1 = 639: x = 0
FOR y = 174 TO 349 STEP 4
t = TIMER
DO UNTIL TIMER > t + .00015: LOOP
LINE (319, y)-(x, 174)
LINE (x1, 174)-(319, y)
LINE (319, 349 - y)-(x, 174)
LINE (x1, 174)-(319, 349 - y)
x1 = x1 - 1.83 * 4
x = x + 1.83 * 4
NEXT
NEXT
SYSTEM

