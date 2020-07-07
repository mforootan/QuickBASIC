CLS
hlf# = SQR(.5): tpp# = SQR(.5): cnt = 1: t = TIMER
FOR i = 1 TO 100000
LOCATE 1, 1: PRINT " ã= "; 2 / tpp#, cnt, INT(TIMER - t)
hlf# = (SQR(.5 + .5 * hlf#))
tpp# = hlf# * tpp#: cnt = cnt + 1
NEXT




