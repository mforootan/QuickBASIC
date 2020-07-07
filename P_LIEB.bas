CLS
pi# = 0: n = 1: t = TIMER
DO
IF n MOD 4 = 3 THEN num = -4 ELSE num = 4
LOCATE 1, 1: pi# = pi# + num / n
PRINT " ã= "; pi#, n, INT(TIMER - t): n = n + 2
LOOP


