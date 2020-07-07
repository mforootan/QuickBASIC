CLS
year = 1: time = 20926
DO
add = add + time: IF add >= 86400 THEN add = add - 86400: counter = counter + 1: PRINT "leap"; counter; year - 1, (year - 1) MOD 4
hour = add \ 3600
minute = (add MOD 3600) \ 60
sec = (add MOD 3600) MOD 60
'PRINT year, hour; minute; sec
year = year + 1
'SLEEP 1
'DO WHILE INKEY$ = "": LOOP
LOOP
h = t \ 3600: m = (t MOD 3600) \ 60: s = (t MOD 3600) MOD 60

