DECLARE FUNCTION order$ (number!)
DECLARE SUB errormsg ()
DECLARE FUNCTION stringnumber$ (choice!, number!)
DECLARE SUB splitbox (row!, column!, length!)
DECLARE SUB compute (year!, month!, day!, choice!)
DECLARE SUB box (rowstart!, colstart!, length!, height!, shadow!)
10 DATA January,February,March,April,May,June,July,August,September,October,November,December
20 DATA ˆ˛¢§¯§Í,ñ™˙ì˛¢§ê,¢ê¢§°,§˛ó,¢ê¢§ı,§¯˛§˙™,§˙ı,ˆëìç,§£ç,¸¢,ˆı˙ì,¢˜Í®ê
30 DATA 31,28,31,30,31,30,31,31,30,31,30,31
40 DATA 31,31,31,31,31,31,30,30,30,30,30,29
50 DATA " Convert Christian calendar to Persian ¸®ı™ ˘ì ¸¢Ú˛ı †˛§ëó Ò˛¢ìó "," Convert Persian calendar to Christian ¸¢Ú˛ı ˘ì ¸®ı™ †˛§ëó Ò˛¢ìó "," Exit                                                       ö¯§° "
60 DATA 7,10,9,10,11,10,7,30,9,30,11,30,7,48,9,48,11,48,7,65,9,65,11,65
70 DATA 7,66,9,65,11,68,7,51,9,49,11,48,7,31,9,30,11,31,7,13,9,11,11,10
80 DATA Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday
90 DATA ˘ì˜™¯¢,˘ì˜™˘®,˘ì˜™§ë˙ù,˘ì˜™ö˜ï,˘„ıõ,˘ì˜™,˘ì˜™Ó˛
OPTION BASE 1
DIM SHARED month$(2, 12), day(2, 12), week$(2, 7)
DIM maindecision$(3), rowmonth(2, 12), colmonth(2, 12)
RESTORE 10: FOR i = 1 TO 2: FOR j = 1 TO 12: READ month$(i, j): NEXT: NEXT
RESTORE 30: FOR i = 1 TO 2: FOR j = 1 TO 12: READ day(i, j): NEXT: NEXT
RESTORE 80: FOR i = 1 TO 2: FOR j = 1 TO 7: READ week$(i, j): NEXT: NEXT
RESTORE 50: FOR i = 1 TO 3: READ maindecision$(i): NEXT
RESTORE 60: FOR i = 1 TO 2: FOR j = 1 TO 12: READ rowmonth(i, j), colmonth(i, j): NEXT: NEXT
defdecision = 0
DO
   COLOR 15, 1: CLS
   CALL box(3, 5, 67, 7, 0)
   LOCATE 3, 25: COLOR 12: PRINT " Calendar convert   Ù˛¯Ïó Ò˛¢ìó "
   DO
      FOR i = 1 TO 3
         IF i = defdecision + 1 THEN kolor = 14 ELSE kolor = 3
         COLOR kolor: LOCATE 2 * i + 3, 7: PRINT maindecision$(i)
      NEXT
      ky = ASC(INPUT$(1))
      SELECT CASE ky
         CASE 9
            defdecision = (defdecision + 1) MOD 3
         CASE 13
            EXIT DO
         CASE ELSE
            BEEP
      END SELECT
   LOOP
   IF defdecision = 2 THEN COLOR 7, 0: CLS : SYSTEM
   defoption = 0
   defyear = VAL(MID$(DATE$, 7, 4)): defmonth = VAL(MID$(DATE$, 1, 2)): defday = VAL(MID$(DATE$, 4, 2))
      IF defdecision = 1 THEN
         CALL compute(defyear, defmonth, defday, 1)
         defyear = findyear: defmonth = findmonth: defday = findday
      END IF
   DO
      COLOR , 1: CLS
      COLOR 15, 5
      CALL box(3, 7, 67, 10, 1)
      COLOR 15: CALL splitbox(6, 7, 67): CALL splitbox(12, 7, 67)
      LOCATE 3, 9: COLOR 5, 7: PRINT maindecision$(defdecision + 1)
      LOCATE 5, 25: COLOR 15, 5: PRINT "YEAR:"
      LOCATE 5, 55: PRINT ":Òë®"
      LOCATE 6, 10: PRINT " MONTH:"
      LOCATE 6, 66: PRINT ":˘ëı "
      LOCATE 13, 26: PRINT "DAY:"
      LOCATE 13, 55: PRINT ":•¯§"
      COLOR 14, 5
      keepyear = defyear: keepday = defday
      DO
         SELECT CASE defoption
            CASE 0
               yearcolor = 10: bgyearcolor = 0
               monthcolor = 3: bgmonthcolor = 5: defmonthcolor = 14: bgdefmonthcolor = 5
               daycolor = 4: bgdaycolor = 0
            CASE 1
               yearcolor = 4: bgyearcolor = 0
               monthcolor = 3: bgmonthcolor = 5: defmonthcolor = 14: bgdefmonthcolor = 2
               daycolor = 4: bgdaycolor = 0
            CASE 2
               yearcolor = 4: bgyearcolor = 0
               monthcolor = 3: bgmonthcolor = 5: defmonthcolor = 14: bgdefmonthcolor = 2
               daycolor = 10: bgdaycolor = 0
         END SELECT
         LOCATE 5, 39: COLOR , bgyearcolor: PRINT SPACE$(6)
         LOCATE 5, 40: COLOR yearcolor, bgyearcolor: PRINT stringnumber$(defdecision + 1, defyear)
         FOR i = 1 TO 12
            IF i = defmonth THEN
               IF defoption = 1 THEN
                  kolor = defmonthcolor: bkolor = bgdefmonthcolor
                ELSE
                  kolor = defmonthcolor: bkolor = bgmonthcolor
               END IF
             ELSE
               kolor = monthcolor: bkolor = bgmonthcolor
            END IF
            LOCATE rowmonth(defdecision + 1, i), colmonth(defdecision + 1, i): COLOR kolor, bkolor: PRINT month$(defdecision + 1, i)
         NEXT
         LOCATE 13, 40: COLOR , bgdaycolor: PRINT SPACE$(4)
         LOCATE 13, 41: COLOR daycolor, bgdaycolor: PRINT stringnumber$(defdecision + 1, defday)
         k$ = INPUT$(1)
         SELECT CASE ASC(k$)
            CASE 13
               enter$ = ""
               EXIT DO
            CASE 48 TO 57
               enter$ = enter$ + k$
               SELECT CASE defoption
                  CASE 0
                     defyear = VAL(enter$)
                  CASE 1
                     BEEP
                  CASE 2
                     defday = VAL(enter$)
               END SELECT
            CASE 27
               enter$ = ""
               defoption = (defoption + 1) MOD 3
            CASE 9
               IF defoption <> 1 THEN
                  BEEP
                 ELSE
                  defmonth = defmonth MOD 12 + 1
               END IF
         END SELECT
      LOOP
      SELECT CASE defyear
         CASE IS < 100
            IF defdecision = 0 THEN add = 1900 ELSE add = 1300
            defyear = defyear + add
         CASE 100 TO 999
            defyear = defyear + 1000
      END SELECT
      SELECT CASE defdecision
         CASE 0
            IF defyear MOD 4 = 0 AND defyear MOD 100 <> 0 THEN day(1, 2) = 29 ELSE day(1, 2) = 28
            IF defyear < 1901 OR defyear > 2099 THEN
               CALL errormsg
            END IF
         CASE 1
            IF defyear MOD 2 = 0 AND defyear MOD 4 <> 0 THEN day(2, 12) = 30 ELSE day(2, 12) = 29
            IF defyear < 1280 OR defyear > 1477 THEN
               CALL errormsg
            END IF
      END SELECT
      IF defday > day(defdecision + 1, defmonth) THEN
         CALL errormsg
      END IF
   LOOP WHILE errorindex = 1
   CALL compute(defyear, defmonth, defday, defdecision + 1)
   COLOR 15, 6: CALL box(17, 22, 37, 3, 1)
   LOCATE 17, 25: COLOR 6, 7: PRINT " Equivalent date      Ò¢ë„ı †˛§ëó "
   SELECT CASE defdecision
      CASE 0
         COLOR 11, 6: LOCATE 19, 36: PRINT stringnumber$(2, findyear); " "; month$(2, findmonth); " "; stringnumber$(2, findday)
         COLOR 14: LOCATE 20, 28: PRINT ".ñ®ê "; findweek$; " §ìê§ì †˛§ëó ˆ˛ê"
      CASE 1
         COLOR 11, 6: LOCATE 19, 33: PRINT month$(1, findmonth); order$(findday); ","; findyear
         COLOR 14: LOCATE 20, 32: PRINT "This day is "; : PRINT findweek$; "."
   END SELECT
   DO WHILE INKEY$ = "": LOOP
LOOP

SUB box (rowstart, colstart, length, height, shadow)
LOCATE rowstart, colstart: PRINT CHR$(201)
FOR i = 1 TO length: LOCATE rowstart, colstart + i: PRINT CHR$(205): NEXT
LOCATE rowstart, colstart + length + 1: PRINT CHR$(187)
FOR i = 1 TO height: LOCATE rowstart + i, colstart: PRINT CHR$(186): NEXT
FOR i = 1 TO height: LOCATE rowstart + i, colstart + length + 1: PRINT CHR$(186): NEXT
LOCATE rowstart + height + 1, colstart: PRINT CHR$(200)
LOCATE rowstart + height + 1, colstart + length + 1: PRINT CHR$(188)
FOR i = 1 TO length: LOCATE rowstart + height + 1, colstart + i: PRINT CHR$(205): NEXT
FOR i = 1 TO height: FOR j = 1 TO length: LOCATE rowstart + i, colstart + j: PRINT CHR$(32): NEXT: NEXT
IF shadow = 1 THEN
  COLOR 0
  FOR i = 1 TO height + 1: LOCATE rowstart + i, colstart + length + 2: PRINT CHR$(219): NEXT
  FOR i = 1 TO length + 1: LOCATE rowstart + height + 2, colstart + i + 1: PRINT CHR$(219): NEXT
END IF
END SUB

SUB compute (year, month, day, choice)
SHARED findyear, findmonth, findday, findweek$
shamsitotal = 365: miladitotal = 365
SELECT CASE choice
   CASE 1
      IF year MOD 4 = 0 AND year MOD 100 <> 0 THEN day(1, 2) = 29: miladitotal = 366
   CASE 2
      IF year MOD 2 = 0 AND year MOD 4 <> 0 THEN day(2, 12) = 30: shamsitotal = 366
END SELECT
passedfromstart = 0
FOR i = 1 TO month - 1
   passedfromstart = passedfromstart + day(choice, i)
NEXT
passedfromstart = passedfromstart + day
SELECT CASE choice
   CASE 1
      IF miladitotal = 365 THEN leapday = 80 ELSE leapday = 81
      IF passedfromstart < leapday THEN findyear = year - 622 ELSE findyear = year - 621
      IF findyear MOD 2 = 0 AND findyear MOD 4 <> 0 THEN shamsitotal = 366: day(2, 12) = 30
      convertday = passedfromstart + 286
      IF convertday > shamsitotal THEN convertday = convertday - miladitotal
   CASE 2
      IF passedfromstart < 287 THEN findyear = year + 621 ELSE findyear = year + 622
      IF findyear MOD 4 = 0 AND findyear MOD 100 <> 0 THEN miladitotal = 366: day(1, 2) = 29
      convertday = passedfromstart - 286
      IF convertday < 1 THEN convertday = convertday + miladitotal
END SELECT
searchmonth = 0: i = 1: choice2 = 3 - choice
DO
   searchmonth = searchmonth + day(choice2, i)
   i = i + 1
LOOP WHILE searchmonth < convertday
searchmonth = searchmonth - day(choice2, i - 1)
findmonth = i - 1
findday = convertday - searchmonth
SELECT CASE choice
   CASE 1
      weekyear = year: weekmonth = month: weekday = day
   CASE 2
      weekyear = findyear: weekmonth = findmonth: weekday = findday
END SELECT
IF weekyear MOD 4 = 0 AND weekyear MOD 100 <> 0 THEN day(1, 2) = 29
startyear = weekyear - 1901
counter = 365 * startyear + INT(startyear / 4)
FOR i = 1 TO weekmonth - 1: counter = counter + day(1, i): NEXT
counter = counter + weekday
counter = counter MOD 7 + 1
findweek$ = week$(choice2, counter)
END SUB

SUB errormsg
SHARED errorindex, defdecision, defyear, defmonth, defday, findyear, findmonth, findday
BEEP
COLOR 14, 4: CALL box(6, 20, 40, 5, 0)
COLOR 15: LOCATE 8, 29: PRINT "This date is not legal!"
LOCATE 10, 30: PRINT ".ñ®˛˜ •ëõı †˛§ëó ˆ˛ê"
SLEEP 2
defyear = VAL(MID$(DATE$, 7, 4)): defmonth = VAL(MID$(DATE$, 1, 2)): defday = VAL(MID$(DATE$, 4, 2))
   IF defdecision = 1 THEN
      CALL compute(defyear, defmonth, defday, 1)
      defyear = findyear: defmonth = findmonth: defday = findday
   END IF
errorindex = 1
END SUB

FUNCTION order$ (number)
digit1 = number - 10 * (number \ 10)
digit2 = number - 100 * (number \ 100)
SELECT CASE digit1
   CASE 1
      IF digit2 <> 11 THEN ext$ = "st" ELSE ext$ = "th"
   CASE 2
      IF digit2 <> 12 THEN ext$ = "nd" ELSE ext$ = "th"
   CASE 3
      IF digit2 <> 13 THEN ext$ = "rd" ELSE ext$ = "th"
   CASE ELSE
      ext$ = "th"
END SELECT
order$ = STR$(number) + ext$
END FUNCTION

SUB splitbox (row, column, length)
LOCATE row, column: PRINT CHR$(199)
LOCATE row, column + length + 1: PRINT CHR$(182)
FOR i = 1 TO length: LOCATE row, column + i: PRINT CHR$(196): NEXT
END SUB

FUNCTION stringnumber$ (choice, number)
SELECT CASE choice
   CASE 1
      stringnumber$ = LTRIM$(STR$(number))
   CASE 2
      receive$ = LTRIM$(STR$(number))
      FOR i = 1 TO LEN(receive$)
         digitcode = ASC(MID$(receive$, i, 1))
         number$ = number$ + CHR$(digitcode + 80)
      NEXT
      stringnumber$ = number$
END SELECT
END FUNCTION

