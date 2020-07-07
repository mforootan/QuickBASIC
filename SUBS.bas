OPTION BASE 1
CLS
INPUT "Enter group's number of members: ", tedad%
DIM ozv$(tedad%)

'This FOR...NEXT loop assigns letters to member of group
FOR i = 1 TO tedad%
   ozv$(i) = CHR$(64 + i)
NEXT

'This FOR...NEXT loop counts the subgroups
FOR i = 0 TO 2 ^ tedad% - 1
   'From here, decimal-binary conversion is made
   javab$ = ""
   soorat = i
   shomar = 1
   DO
      bakhshi = soorat \ 2
      mande = soorat MOD 2
      'CORE OF THE PROGRAM: This IF adds a letter to the subgroup if there
      'is a "1" in the binary equivalent at the correspondent place.
      IF mande = 1 THEN javab$ = ozv$(tedad% - shomar + 1) + javab$
      soorat = bakhshi
      shomar = shomar + 1
   LOOP UNTIL soorat < 2
   'Description as the above IF; jusk check the last digit.
   IF bakhshi = 1 THEN javab$ = ozv$(tedad% - shomar + 1) + javab$
   PRINT "{"; javab$; "}";
NEXT
PRINT
PRINT "You sort it!!!!"



