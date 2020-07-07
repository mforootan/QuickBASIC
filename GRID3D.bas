SCREEN 12
c = 3
'LINE (0, 0)-(100, 400), 2, BF
'LINE (0, 0)-(640, 10), 2, BF
DO
   LINE (320 + v, 0)-(640, 400 - v * 2), c
   LINE (320 - v, 0)-(0, 400 - v * 2), c
   v = v + 20 - v / 20
LOOP UNTIL v > 200
DO
   LINE (320, 0)-(320 - h, 400), c
   LINE (320, 0)-(320 + h, 400), c
   h = h + 100 - h / 8
LOOP UNTIL h > 300
DO
   g = g + .8 + g / 8
   LINE (0, g)-(640, g), c, BF
LOOP UNTIL g > 400

   

