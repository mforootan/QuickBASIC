SCREEN 9
CLS
colour = 0
x = 1: y = 1: ax = 1: ay = 1: ex = 1: ey = 1
DO
COLOR colour + 10: PSET (x, y)
ex = x: ey = y
x = x + ax: y = y + ay
IF x < 2 OR x > 639 THEN ax = -ax: colour = (colour + 1) MOD 6: t = TIMER: DO UNTIL TIMER - t > .01: LOOP
IF y < 2 OR y > 345 THEN ay = -ay: colour = (colour + 1) MOD 6: t = TIMER: DO UNTIL TIMER - t > .01: LOOP
cnt = cnt - 1
LOOP UNTIL x = 639 AND y = 345: SYSTEM

