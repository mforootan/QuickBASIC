CLS
x = 1: y = 1: ax = 1: ay = 1: ex = 1: ey = 1
PRINT "SELECT A KEY": k$ = INPUT$(1): cnt = 3476
DO
t = TIMER: DO UNTIL TIMER - t > .01: LOOP
LOCATE 1, 1: PRINT x, y, cnt
LOCATE ex, ey: PRINT " "
LOCATE x, y: PRINT k$: t = TIMER
ex = x: ey = y
x = x + ax: y = y + ay
IF x < 2 OR x > 22 THEN SOUND 512, .2: ax = -ax
IF y < 2 OR y > 79 THEN SOUND 512, .2: ay = -ay
cnt = cnt - 1
LOOP UNTIL cnt = 0: SYSTEM

