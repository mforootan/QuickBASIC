CLS
pi# = 8 / 3
t = TIMER
shomar& = 4
DO
   pi# = pi# * (shomar& ^ 2) / (shomar& ^ 2 - 1)
   LOCATE 1, 1: PRINT "ã="; pi#, shomar&, INT(TIMER - t)
   shomar& = shomar& + 2
LOOP

