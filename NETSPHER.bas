CLS
SCREEN 9
FOR c = 14 TO 1 STEP -1
PSET (300, 170): COLOR c, 0
FOR s = 0 TO 126 STEP .005
x = 229 * SIN(s) + 300
y = 148 * COS(s) * SIN(s * .95) + 150
LINE -(x, y + 20)
NEXT: NEXT
PSET (300, 170): COLOR 15, 0
FOR s = 0 TO 126 STEP .001
x = 229 * SIN(s) + 300
y = 148 * COS(s) * SIN(s * .95) + 150
LINE -(x, y + 20)
NEXT
SYSTEM

