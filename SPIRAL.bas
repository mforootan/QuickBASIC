SCREEN 9
p = 3.141592654#
FOR i = 0 TO 55000 STEP 50
x = 320 + i / 250 * COS(i)
y = 175 + i / 350 * SIN(i)
LINE -(x, y)
NEXT

