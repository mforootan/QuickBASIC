DECLARE FUNCTION ascii2ansi! (adad%)
CONST masir$ = "e:\"
CLS
INPUT "Enter the ASCII Filename:"; esm$
OPEN esm$ FOR INPUT AS #1
OPEN masir$ + "ansi.txt" FOR OUTPUT AS #2
DO WHILE NOT EOF(1)
   LINE INPUT #1, khat$
   hadaf$ = ""
   FOR i = 1 TO LEN(khat$)
      harf$ = MID$(khat$, i, 1)
      kod% = ASC(harf$)
      jadid$ = CHR$(ascii2ansi(kod%))
      SELECT CASE ASC(jadid$)
         CASE 48 TO 57, 65 TO 90, 97 TO 122
            hadaf$ = hadaf$ + jadid$
         CASE ELSE
            hadaf$ = jadid$ + hadaf$
      END SELECT
   NEXT
   PRINT #2, hadaf$
LOOP
CLOSE #1
CLOSE #2

FUNCTION ascii2ansi (adad%)

SELECT CASE adad%
   CASE 141
      javab% = 193
   CASE 144, 145
      javab% = 194
   CASE 143
      javab% = 195
   CASE 146, 147
      javab% = 200
   CASE 148, 149
      javab% = 201
   CASE 150, 151
      javab% = 202
   CASE 152, 153
      javab% = 204
   CASE 154, 155
      javab% = 205
   CASE 156, 157
      javab% = 206
   CASE 158, 159
      javab% = 207
   CASE 160, 161
      javab% = 208
   CASE 162
      javab% = 209
   CASE 163
      javab% = 210
   CASE 164
      javab% = 211
   CASE 165
      javab% = 212
   CASE 166
      javab% = 213
   CASE 167, 168
      javab% = 214
   CASE 169, 170
      javab% = 216
   CASE 171, 172
      javab% = 217
   CASE 173, 174
      javab% = 218
   CASE 175
      javab% = 219
   CASE 224
      javab% = 221
   CASE 225 TO 228
      javab% = 222
   CASE 229 TO 232
      javab% = 223
   CASE 233, 234
      javab% = 224
   CASE 235, 236
      javab% = 225
   CASE 237, 238
      javab% = 226
   CASE 239, 240
      javab% = 227
   CASE 241, 243
      javab% = 228
   CASE 244, 245
      javab% = 229
   CASE 246, 247
      javab% = 230
   CASE 248
      javab% = 231
   CASE 249 TO 251
      javab% = 232
   CASE 252 TO 254
      javab% = 233
   CASE 142
      javab% = 199
   CASE 128 TO 137
      javab% = adad% - 80
   CASE ELSE
      javab% = adad%
END SELECT
ascii2ansi = javab%

END FUNCTION

