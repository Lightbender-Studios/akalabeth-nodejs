0 ONERR GOTO 10
5 REM
10 PR# 0: IN# 0
15 HIMEM: 49151
16 REM ------------------ NEW GAME GOSUB ------------------
20 CLEAR : GOSUB 1790
25 REM ------------------ MAIN PROGRAM ------------------
30 ZZ = RND(-ABS(LN))
35 LE = 0
40 TEXT : HOME : NORMAL : VTAB (12): PRINT " WELCOME TO AKALABETH, WORLD OF DOOM!"
45 DIM DN%(10,10),TE%(20,20),XX%(10),YY%(10),PE%(10,3),LD%(10,5),CD%(10,3),FT%(10,5),LA(10,3)
50 FOR X = 0 TO 20:TE%(X,0) = 1:TE%(0,X) = 1:TE%(X,20) = 1:TE%(20,X) = 1: NEXT
55 : VTAB (23): PRINT " (PLEASE WAIT)";
60 FOR X = 1 TO 19: FOR Y = 1 TO 19:TE%(X,Y) = INT ( RND (1) ^ 5 * 4.5 )
65 IF TE%(X,Y) = 3 AND RND (1) > .5 THEN TE%(X,Y) = 0
70 NEXT : PRINT ".";: NEXT
75 TE%( INT ( RND (1) * 19 + 1), INT ( RND (1) * 19 + 1)) = 5:TX = INT ( RND (1) * 19 + 1):TY = INT ( RND (1) * 19 + 1):TE%(TX,TY) = 3
80 XX%(0) = 139:YY%(0) = 79
85 FOR X = 2 TO 20 STEP 2:XX%(X / 2) = INT ( ATN (1 / X) / ATN (1) * 140 + .5):YY%(X / 2) = INT (XX%(X / 2) * 4 / 7)
90 PE%(X / 2,0) = 139 - XX%(X / 2):PE%(X / 2,1) = 139 + XX%(X / 2):PE%(X / 2,2) = 79 - YY%(X / 2):PE%(X / 2,3) = 79 + YY%(X / 2): NEXT
95 PE%(0,0) = 0:PE%(0,1) = 279:PE%(0,2) = 0:PE%(0,3) = 159
100 FOR X = 1 TO 10:CD%(X,0) = 139 - XX%(X) / 3:CD%(X,1) = 139 + XX%(X) / 3:CD%(X,2) = 79 - YY%(X) * .7:CD%(X,3) = 79 + YY%(X): NEXT : PRINT " .";
105 FOR X = 0 TO 9:LD%(X,0) = (PE%(X,0) * 2 + PE%(X + 1,0)) / 3:LD%(X, 1) = (PE%(X,0) + 2 * PE%(X + 1,0)) / 3:W = LD%(X,0) - PE%(X,0)
110 LD%(X,2) = PE%(X,2) + W * 4 / 7:LD%(X,3) = PE%(X,2) + 2 * W * 4 / 7: LD%(X,4) = (PE%(X,3) * 2 + PE%(X + 1,3)) / 3:LD%(X,5) = (PE%(X,3) + 2 * PE%(X + 1,3)) / 3
115 LD%(X,2) = LD%(X,4) - (LD%(X,4) - LD%(X,2)) * .8:LD%(X,3) = LD%(X,5) - (LD%(X,5) - LD%(X,3)) * .8: IF LD%(X,3) = LD%(X,4) THEN LD%(X,3) = LD%(X,3) - 1
120 NEXT
125 FOR X = 0 TO 9:FT%(X,0) = 139 - XX%(X) / 3:FT%(X,1) = 139 + XX%(X) / 3:FT%(X,2) = 139 - XX%(X + 1) / 3:FT%(X,3) = 139 + XX%(X + 1) / 3
130 FT%(X,4) = 79 + (YY%(X) * 2 + YY%(X + 1)) / 3:FT%(X,5) = 79 + (YY%(X) + 2 * YY%(X + 1)) / 3: NEXT
135 FOR X = 0 TO 9:LA(X,0) = (FT%(X,0) * 2 + FT%(X,1)) / 3:LA(X,1) = (FT%(X,0) + 2 * FT%(X,1)) / 3:LA(X,3) = FT%(X,4):LA(X,2) = 159 - LA(X,3): NEXT
140 HOME : HCOLOR= 3
145 POKE 34,20: POKE 33,29: HOME
155 GOSUB 175
160 GOTO 905
170 FOR X = 0 TO 9: FOR Y = 0 TO 5: PRINT LD%(X,Y);" ";: NEXT : PRINT : NEXT : GET Q$
173 REM ------------------ HANDLE DUNGEON ------------------
175 HGR : FOR Y = - 1 TO 1: FOR X = - 1 TO 1
180 HPLOT 138,75 TO 142,75: HPLOT 140,73 TO 140,77
185 ZZ = TE%(TX + X,TY + Y):X1 = 65 + (X + 1) * 50:Y1 = (Y + 1) * 50
190 IF ZZ = 2 THEN HPLOT X1 + 20,Y1 + 20 TO X1 + 30,Y1 + 20 TO X1 + 30 ,Y1 + 30 TO X1 + 20,Y1 + 30 TO X1 + 20,Y1 + 20
195 IF ZZ = 3 THEN HPLOT X1 + 10,Y1 + 10 TO X1 + 20,Y1 + 10 TO X1 + 20 ,Y1 + 40 TO X1 + 10,Y1 + 40 TO X1 + 10,Y1 + 30
200 IF ZZ = 3 THEN HPLOT X1 + 40,Y1 + 30 TO X1 + 40,Y1 + 40 TO X1 + 30,Y1 + 40 TO X1 + 30,Y1 + 10 TO X1 + 40,Y1 + 10
205 IF ZZ = 3 THEN HPLOT X1 + 40,Y1 + 20 TO X1 + 10,Y1 + 20 TO X1 + 10,Y1 + 10
210 IF ZZ = 4 THEN HPLOT X1 + 20,Y1 + 20 TO X1 + 30,Y1 + 30: HPLOT X1 + 20,Y1 + 30 TO X1 + 30,Y1 + 20
215 IF ZZ = 5 THEN HPLOT X1,Y1 TO X1 + 50,Y1 TO X1 + 50,Y1 + 50 TO X1, Y1 + 50 TO X1,Y1
220 : HPLOT X1 + 10,Y1 + 10 TO X1 + 10,Y1 + 40 TO X1 + 40,Y1 + 40 TO X1 + 40,Y1 + 10 TO X1 + 10,Y1 + 10 TO X1 + 40,Y1 + 40: HPLOT X1 + 10,Y1 + 40 TO X1 + 40,Y1 + 10
225 IF ZZ = 1 THEN HPLOT X1 + 10,Y1 + 50 TO X1 + 10,Y1 + 40 TO X1 + 20 ,Y1 + 30 TO X1 + 40,Y1 + 30 TO X1 + 40,Y1 + 50
230 HPLOT X1,Y1 + 10 TO X1 + 10,Y1 + 10: HPLOT X1 + 50,Y1 + 10 TO X1 + 40,Y1 + 10: HPLOT X1, Y1 + 40 TO X1 + 10,Y1 + 40: HPLOT X1 + 40,Y1 + 40 TO X1 + 50,Y1 + 40
235 IF ZZ = 1 THEN HPLOT X1 + 10,Y1 TO X1 + 10,Y1 + 20 TO X1 + 20,Y1 + 20 TO X1 + 20,Y1 + 30 TO X1 + 30,Y1 + 30 TO X1 + 30,Y1 + 10 TO X1 + 40,Y1 + 10 TO X1 + 40,Y1
240 NEXT : NEXT : RETURN
245 HGR :DI = 0: HCOLOR= 3
250 CE = DN%(PX + DX * DI,PY + DY * DI):LE = DN%(PX + DX * DI + DY,PY + DY * DI - DX):RI = DN%(PX + DX * DI - DY,PY + DY * DI + DX)
255 L1 = PE%(DI,0):R1 = PE%(DI,1):T1 = PE%(DI,2):B1 = PE%(DI,3): L2 = PE%(DI + 1,0):R2 = PE%(DI + 1,1):T2 = PE%(DI + 1,2):B2 = PE%(DI + 1,3)
260 CE = INT (CE):LE = INT (LE):RI = INT (RI)
265 MC = INT (CE / 10):CE = CE - MC * 10:LE = INT ((LE / 10 - INT (LE / 10)) * 10 + .1):RI = INT ((RI / 10 - INT (RI / 10 )) * 10 + .1)
270 IF DI = 0 THEN 290
275 IF CE = 1 OR CE = 3 OR CE = 4 THEN HPLOT L1,T1 TO R1,T1 TO R1,B1 TO L1,B1 TO L1,T1
280 IF CE = 1 OR CE = 3 THEN EN = 1: GOTO 390
285 IF CE = 4 THEN HPLOT CD%(DI,0),CD%(DI,3) TO CD%(DI,0),CD%(DI ,2) TO CD%(DI,1),CD%(DI,2) TO CD%(DI,1),CD%(DI,3):EN = 1: GOTO 390
290 IF LE = 1 OR LE = 3 OR LE = 4 THEN HPLOT L1,T1 TO L2,T2: HPLOT L1,B1 TO L2,B2
295 IF RI = 1 OR RI = 3 OR RI = 4 THEN HPLOT R1,T1 TO R2,T2: HPLOT R1,B1 TO R2,B2
300 IF LE = 4 AND DI > 0 THEN HPLOT LD%(DI,0),LD%(DI,4) TO LD%(DI,0),LD%(DI,2) TO LD%(DI,1),LD%(DI,3) TO LD%(DI,1),LD%(DI,5)
305 IF LE = 4 AND DI = 0 THEN HPLOT 0,LD%(DI,2) - 3 TO LD%(DI,1), LD%(DI,3) TO LD%(DI,1),LD%(DI,5)
310 IF RI = 4 AND DI > 0 THEN HPLOT 279 - LD%(DI,0),LD%(DI,4) TO 279 - LD%(DI,0),LD%(DI,2) TO 279 - LD%(DI,1),LD%(DI,3) TO 279 - LD%(DI,1),LD%(DI,5)
315 IF RI = 4 AND DI = 0 THEN HPLOT 279,LD%(DI,2) - 3 TO 279 - LD% (DI,1),LD%(DI,3) TO 279 - LD%(DI,1),LD%(DI,5)
320 IF LE = 3 OR LE = 1 OR LE = 4 THEN 335
325 IF DI < > 0 THEN HPLOT L1,T1 TO L1,B1
330 HPLOT L1,T2 TO L2,T2 TO L2,B2 TO L1,B2
335 IF RI = 3 OR RI = 1 OR RI = 4 THEN 350
340 IF DI < > 0 THEN HPLOT R1,T1 TO R1,B1
345 HPLOT R1,T2 TO R2,T2 TO R2,B2 TO R1,B2
350 IF CE = 7 OR CE = 9 THEN HPLOT FT%(DI,0),FT%(DI,4) TO FT%(DI,2),FT%(DI,5) TO FT%(DI,3),FT%(DI,5) TO FT%(DI,1),FT%(DI,4) TO FT%(DI,0),FT%(DI,4)
355 IF CE = 8 THEN HPLOT FT%(DI,0),158 - FT%(DI,4) TO FT%(DI,2),158 - FT%(DI,5) TO FT%(DI,3),158 - FT%(DI,5) TO FT%(DI,1),158 - FT%(DI,4) TO FT%(DI,0),158 - FT%(DI,4)
360 IF CE = 7 OR CE = 8 THEN BA = LA(DI,3):TP = LA(DI,2):LX = LA(DI,0):RX = LA(DI,1): HPLOT LX,BA TO LX,TP: HPLOT RX,TP TO RX,BA
365 IF CE = 7 OR CE = 8 THEN Y1 = (BA * 4 + TP) / 5:Y2 = (BA * 3 + TP * 2) / 5:Y3 = (BA * 2 + TP * 3) / 5:Y4 = (BA + TP * 4) / 5: HPLOT LX,Y1 TO RX,Y1: HPLOT LX,Y2 TO RX,Y2: HPLOT LX,Y3 TO RX,Y3: HPLOT LX ,Y4 TO RX,Y4
370 IF DI > 0 AND CE = 5 THEN HPLOT 139 - 10 / DI,PE%(DI,3) TO 139 - 10 / DI,PE%(DI,3) - 10 / DI TO 139 + 10 / DI,PE%(DI,3) - 10 / DI TO 139 + 10 / DI,PE%(DI,3) TO 139 - 10 / DI,PE%(DI,3)
375 IF CE = 5 AND DI > 0 THEN INVERSE : PRINT "CHEST!": NORMAL
380 IF DI > 0 AND CE = 5 THEN HPLOT 139 - 10 / DI,PE%(DI,3) - 10 / DI TO 139 - 5 / DI,PE%(DI,3) - 15 / DI TO 139 + 15 / DI,PE%(DI,3) - 15 / DI TO 139 + 15 / DI,PE%(DI,3) - 5 / DI TO 139 + 10 / DI,PE%(DI,3)
385 IF DI > 0 AND CE = 5 THEN HPLOT 139 + 10 / DI,PE%(DI,3) - 10 / DI TO 139 + 15 / DI,PE%(DI,3) - 15 / DI
390 IF MC < 1 THEN 790
395 B = 79 + YY%(DI):C = 139
400 INVERSE : IF MC = 8 THEN PRINT "CHEST!";: CALL - 868: PRINT : NORMAL : GOTO 410
405 PRINT M$(MC);: CALL - 868: PRINT : NORMAL
410 IF DI = 0 THEN 790
415 ON MC GOTO 425,460,480,510,550,590,625,650,670,735
420 GOTO 790
425 HPLOT C - 23 / DI,B TO C - 15 / DI,B TO C - 15 / DI,B - 15 / DI TO C - 8 / DI,B - 30 / DI TO C + 8 / DI,B - 30 / DI TO C + 15 / DI,B - 15 / DI TO C + 15 / DI,B TO C + 23 / DI,B
430 HPLOT C,B - 26 / DI TO C,B - 65 / DI: HPLOT C - 2 / DI + .5,B - 38 / DI TO C + 2 / DI + .5,B - 38 / DI: HPLOT C - 3 / DI + .5,B - 45 / DI TO C + 3 / DI + .5,B - 45 / DI: HPLOT C - 5 / DI + .5,B - 53 / DI TO C + 5 / DI + .5,B - 53 / DI
435 HPLOT C - 23 / DI,B - 56 / DI TO C - 30 / DI,B - 53 / DI TO C - 23 / DI,B - 45 / DI TO C - 23 / DI,B - 53 / DI TO C - 8 / DI,B - 38 / DI
440 HPLOT C - 15 / DI,B - 45 / DI TO C - 8 / DI,B - 60 / DI TO C + 8 / DI,B - 60 / DI TO C + 15 / DI,B - 45 / DI: HPLOT C + 15 / DI,B - 42 / DI TO C + 15 / DI,B - 57 / DI: HPLOT C + 12 / DI,B - 45 / DI TO C + 20 / DI,B - 45 / DI
445 HPLOT C,B - 75 / DI TO C - 5 / DI + .5,B - 80 / DI TO C - 8 / DI,B - 75 / DI TO C - 5 / DI + .5,B - 65 / DI TO C + 5 / DI + .5,B - 65 / DI TO C + 5 / DI + .5,B - 68 / DI TO C - 5 / DI + .5,B - 68 / DI TO C - 5 / DI + .5,B - 65 / DI
450 HPLOT TO C + 5 / DI + .5,B - 65 / DI TO C + 8 / DI,B - 75 / DI TO C + 5 / DI + .5,B - 80 / DI TO C - 5 / DI + .5,B - 80 / DI: HPLOT C - 5 / DI + .5,B - 72 / DI: HPLOT C + 5 / DI + .5,B - 72 / DI
455 GOTO 790
460 HPLOT C,B - 56 / DI TO C,B - 8 / DI TO C + 10 / DI,B TO C + 30 / DI ,B TO C + 30 / DI,B - 45 / DI TO C + 10 / DI,B - 64 / DI TO C,B - 56 / DI
465 HPLOT TO C - 10 / DI,B - 64 / DI TO C - 30 / DI,B - 45 / DI TO C - 30 / DI,B TO C - 10 / DI,B TO C,B - 8 / DI
470 HPLOT C - 10 / DI,B - 64 / DI TO C - 10 / DI,B - 75 / DI TO C,B - 83 / DI TO C + 10 / DI,B - 75 / DI TO C,B - 79 / DI TO C - 10 / DI,B - 75 / DI TO C,B - 60 / DI TO C + 10 / DI,B - 75 / DI TO C + 10 / DI,B - 64 / DI
475 GOTO 790
480 HPLOT C + 5 / DI,B - 30 / DI TO C,B - 25 / DI TO C - 5 / DI,B - 30 / DI TO C - 15 / DI,B - 5 / DI TO C - 10 / DI,B TO C + 10 / DI,B TO C + 15 / DI,B - 5 / DI
485 HPLOT TO C + 20 / DI,B - 5 / DI TO C + 10 / DI,B TO C + 15 / DI,B - 5 / DI TO C + 5 / DI,B - 30 / DI TO C + 10 / DI,B - 40 / DI TO C + 3 / DI + .5,B - 35 / DI
490 HPLOT TO C - 3 / DI + .5,B - 35 / DI TO C - 10 / DI ,B - 40 / DI TO C - 5 / DI,B - 30 / DI
495 HPLOT C - 5 / DI,B - 33 / DI TO C - 3 / DI + .5,B - 30 / DI: HPLOT C + 5 / DI,B - 33 / DI TO C + 3 / DI + .5,B - 30 / DI: HPLOT C - 5 / DI,B - 20 / DI TO C - 5 / DI,B - 15 / DI
500 HPLOT C + 5 / DI,B - 20 / DI TO C + 5 / DI,B - 15 / DI: HPLOT C - 7 / DI,B - 20 / DI TO C - 7 / DI,B - 15 / DI: HPLOT C + 7 / DI,B - 20 / DI TO C + 7 / DI,B - 15 / DI
505 GOTO 790
510 HPLOT C,B TO C - 15 / DI,B TO C - 8 / DI,B - 8 / DI TO C - 8 / DI,B - 15 / DI TO C - 15 / DI,B - 23 / DI TO C - 15 / DI,B - 15 / DI TO C - 23 / DI,B - 23 / DI
515 HPLOT TO C - 23 / DI,B - 45 / DI TO C - 15 / DI,B - 53 / DI TO C - 8 / DI,B - 53 / DI TO C - 15 / DI,B - 68 / DI TO C - 8 / DI,B - 75 / DI TO C,B - 75 / DI
520 HPLOT C,B TO C + 15 / DI,B TO C + 8 / DI,B - 8 / DI TO C + 8 / DI,B - 15 / DI TO C + 15 / DI,B - 23 / DI TO C + 15 / DI,B - 15 / DI TO C + 23 / DI,B - 23 / DI
525 HPLOT TO C + 23 / DI,B - 45 / DI TO C + 15 / DI,B - 53 / DI TO C + 8 / DI,B - 53 / DI TO C + 15 / DI,B - 68 / DI TO C + 8 / DI,B - 75 / DI TO C,B - 75 / DI
530 HPLOT C - 15 / DI,B - 68 / DI TO C + 15 / DI,B - 68 / DI: HPLOT C - 8 / DI,B - 53 / DI TO C + 8 / DI,B - 53 / DI: HPLOT C - 23 / DI,B - 15 / DI TO C + 8 / DI,B - 45 / DI
535 HPLOT C - 8 / DI,B - 68 / DI TO C,B - 60 / DI TO C + 8 / DI,B - 68 / DI TO C + 8 / DI,B - 60 / DI TO C - 8 / DI,B - 60 / DI TO C - 8 / DI ,B - 68 / DI
540 HPLOT C,B - 38 / DI TO C - 8 / DI,B - 38 / DI TO C + 8 / DI,B - 53 / DI TO C + 8 / DI,B - 45 / DI TO C + 15 / DI,B - 45 / DI TO C,B - 30 / DI TO C,B - 38 / DI
545 GOTO 790
550 HPLOT C - 10 / DI,B - 15 / DI TO C - 10 / DI,B - 30 / DI TO C - 15 / DI,B - 20 / DI TO C - 15 / DI,B - 15 / DI TO C - 15 / DI,B TO C + 15 / DI,B TO C + 15 / DI,B - 15 / DI TO C - 15 / DI,B - 15 / DI
555 HPLOT C - 15 / DI,B - 10 / DI TO C + 15 / DI,B - 10 / DI: HPLOT C - 15 / DI,B - 5 / DI TO C + 15 / DI,B - 5 / DI
560 HPLOT C,B - 15 / DI TO C - 5 / DI,B - 20 / DI TO C - 5 / DI,B - 35 / DI TO C + 5 / DI,B - 35 / DI TO C + 5 / DI,B - 20 / DI TO C + 10 / DI,B - 15 / DI
565 HPLOT C - 5 / DI,B - 20 / DI TO C + 5 / DI,B - 20 / DI: HPLOT C - 5 / DI,B - 25 / DI TO C + 5 / DI,B - 25 / DI: HPLOT C - 5 / DI,B - 30 / DI TO C + 5 / DI,B - 30 / DI
570 HPLOT C - 10 / DI,B - 35 / DI TO C - 10 / DI,B - 40 / DI TO C - 5 / DI,B - 45 / DI TO C + 5 / DI,B - 45 / DI TO C + 10 / DI,B - 40 / DI TO C + 10 / DI,B - 35 / DI
575 HPLOT C - 10 / DI,B - 40 / DI TO C,B - 45 / DI TO C + 10 / DI,B - 40 / DI
580 HPLOT C - 5 / DI,B - 40 / DI TO C + 5 / DI,B - 40 / DI TO C + 15 / DI,B - 30 / DI TO C,B - 40 / DI TO C - 15 / DI,B - 30 / DI TO C - 5 / DI + .5,B - 40 / DI
585 GOTO 790
590 HPLOT C - 20 / DI,79 - YY%(DI) TO C - 20 / DI,B - 88 / DI TO C - 10 / DI,B - 83 / DI TO C + 10 / DI,B - 83 / DI TO C + 20 / DI,B - 88 / DI TO C + 20 / DI,79 - YY%(DI) TO C - 20 / DI,79 - YY%(DI)
595 HPLOT C - 20 / DI,B - 88 / DI TO C - 30 / DI,B - 83 / DI TO C - 30 / DI,B - 78 / DI: HPLOT C + 20 / DI,B - 88 / DI TO C + 30 / DI,B - 83 / DI TO C + 40 / DI,B - 83 / DI
600 HPLOT C - 15 / DI,B - 86 / DI TO C - 20 / DI,B - 83 / DI TO C - 20 / DI,B - 78 / DI TO C - 30 / DI,B - 73 / DI TO C - 30 / DI,B - 68 / DI TO C - 20 / DI,B - 63 / DI
605 HPLOT C - 10 / DI,B - 83 / DI TO C - 10 / DI,B - 58 / DI TO C,B - 50 / DI: HPLOT C + 10 / DI,B - 83 / DI TO C + 10 / DI,B - 78 / DI TO C + 20 / DI,B - 73 / DI TO C + 20 / DI,B - 40 / DI
610 HPLOT C + 15 / DI,B - 85 / DI TO C + 20 / DI,B - 78 / DI TO C + 30 / DI,B - 76 / DI TO C + 30 / DI,B - 60 / DI
615 HPLOT C,B - 83 / DI TO C,B - 73 / DI TO C + 10 / DI,B - 68 / DI TO C + 10 / DI,B - 63 / DI TO C,B - 58 / DI
620 GOTO 790
625 HPLOT C + 5 / DI + .5,B - 10 / DI TO C - 5 / DI + .5,B - 10 / DI TO C,B - 15 / DI TO C + 10 / DI,B - 20 / DI TO C + 5 / DI + .5,B - 15 / DI TO C + 5 / DI + .5,B - 10 / DI
630 HPLOT TO C + 7 / DI + .5,B - 6 / DI TO C + 5 / DI + .5,B - 3 / DI TO C - 5 / DI + .5,B - 3 / DI TO C - 7 / DI + .5,B - 6 / DI TO C - 5 / DI + .5,B - 10 / DI
635 HPLOT C + 2 / DI + .5,B - 3 / DI TO C + 5 / DI + .5,B TO C + 8 / DI ,B: HPLOT C - 2 / DI + .5,B - 3 / DI TO C - 5 / DI + .5,B TO C - 8 / DI,B: HPLOT C + 3 / DI + .5,B - 8 / DI
640 HPLOT C - 3 / DI + .5,B - 8 / DI: HPLOT C + 3 / DI + .5,B - 5 / DI TO C - 3 / DI + .5,B - 5 / DI
645 GOTO 790
650 HPLOT 139 - 10 / DI,PE%(DI,3) TO 139 - 10 / DI,PE%(DI,3) - 10 / DI TO 139 + 10 / DI,PE%(DI,3) - 10 / DI TO 139 + 10 / DI,PE%(DI,3) TO 139 - 10 / DI,PE%(DI,3)
655 HPLOT 139 - 10 / DI,PE%(DI,3) - 10 / DI TO 139 - 5 / DI,PE%(DI,3) - 15 / DI TO 139 + 15 / DI,PE%(DI,3) - 15 / DI TO 139 + 15 / DI,PE%(DI,3) - 5 / DI TO 139 + 10 / DI,PE%(DI,3)
660 HPLOT 139 + 10 / DI,PE%(DI,3) - 10 / DI TO 139 + 15 / DI,PE%( DI,3) - 15 / DI
665 GOTO 790
670 HPLOT C - 14 / DI,B - 46 / DI TO C - 12 / DI,B - 37 / DI TO C - 20 / DI,B - 32 / DI TO C - 30 / DI,B - 32 / DI
675 HPLOT TO C - 22 / DI,B - 24 / DI TO C - 40 / DI,B - 17 / DI TO C - 40 / DI,B - 7 / DI TO C - 38 / DI ,B - 5 / DI TO C - 40 / DI,B - 3 / DI TO C - 40 / DI,B
680 HPLOT TO C - 36 / DI,B TO C - 34 / DI,B - 2 / DI TO C - 32 / DI,B TO C - 28 / DI,B TO C - 28 / DI,B - 3 / DI TO C - 30 / DI,B - 5 / DI TO C - 28 / DI,B - 7 / DI TO C - 28 / DI,B - 15 / DI TO C,B - 27 / DI
685 HPLOT C + 14 / DI,B - 46 / DI TO C + 12 / DI,B - 37 / DI TO C + 20 / DI,B - 32 / DI TO C + 30 / DI,B - 32 / DI
690 HPLOT TO C + 22 / DI,B - 24 / DI TO C + 40 / DI,B - 17 / DI TO C + 40 / DI,B - 7 / DI TO C + 38 / DI ,B - 5 / DI TO C + 40 / DI,B - 3 / DI TO C + 40 / DI,B
695 HPLOT TO C + 36 / DI,B TO C + 34 / DI,B - 2 / DI TO C + 32 / DI,B TO C + 28 / DI,B TO C + 28 / DI,B - 3 / DI TO C + 30 / DI,B - 5 / DI TO C + 28 / DI,B - 7 / DI TO C + 28 / DI,B - 15 / DI TO C,B - 27 / DI
700 HPLOT C + 6 / DI,B - 48 / DI TO C + 38 / DI,B - 41 / DI TO C + 40 / DI,B - 42 / DI TO C + 18 / DI,B - 56 / DI
705 HPLOT TO C + 12 / DI,B - 56 / DI TO C + 10 / DI,B - 57 / DI TO C + 8 / DI,B - 56 / DI TO C - 8 / DI, B - 56 / DI TO C - 10 / DI,B - 58 / DI TO C + 14 / DI,B - 58 / DI TO C + 16 / DI,B - 59 / DI
710 HPLOT TO C + 8 / DI,B - 63 / DI TO C + 6 / DI,B - 63 / DI TO C + 2 / DI + .5,B - 70 / DI TO C + 2 / DI + .5,B - 63 / DI
715 HPLOT TO C - 2 / DI + .5,B - 63 / DI TO C - 2 / DI + .5,B - 70 / DI TO C - 6 / DI,B - 63 / DI TO C - 8 / DI,B - 63 / DI TO C - 16 / DI,B - 59 / DI TO C - 14 / DI,B - 58 / DI
720 HPLOT TO C - 10 / DI,B - 57 / DI TO C - 12 / DI,B - 56 / DI TO C - 18 / DI,B - 56 / DI TO C - 36 / DI,B - 47 / DI
725 HPLOT TO C - 36 / DI,B - 39 / DI TO C - 28 / DI,B - 41 / DI TO C - 28 / DI,B - 46 / DI TO C - 20 / DI,B - 50 / DI TO C - 18 / DI,B - 50 / DI TO C - 14 / DI,B - 46 / DI
730 GOTO 1455
735 HPLOT C + 6 / DI,B - 60 / DI TO C + 30 / DI,B - 90 / DI TO C + 60 / DI,B - 30 / DI TO C + 60 / DI,B - 10 / DI TO C + 30 / DI,B - 40 / DI TO C + 15 / DI,B - 40 / DI
740 HPLOT C - 6 / DI,B - 60 / DI TO C - 30 / DI,B - 90 / DI TO C - 60 / DI,B - 30 / DI TO C - 60 / DI,B - 10 / DI TO C - 30 / DI,B - 40 / DI TO C - 15 / DI,B - 40 / DI
745 HPLOT C,B - 25 / DI TO C + 6 / DI,B - 25 / DI TO C + 10 / DI,B - 20 / DI TO C + 12 / DI,B - 10 / DI TO C + 10 / DI,B - 6 / DI TO C + 10 / DI,B TO C + 14 / DI,B TO C + 15 / DI,B - 5 / DI TO C + 16 / DI,B TO C + 20 / DI,B
750 HPLOT TO C + 20 / DI,B - 6 / DI TO C + 18 / DI,B - 10 / DI TO C + 18 / DI,B - 20 / DI TO C + 15 / DI,B - 30 / DI TO C + 15 / DI,B - 45 / DI TO C + 40 / DI,B - 60 / DI TO C + 40 / DI,B - 70 / DI
755 HPLOT TO C + 10 / DI,B - 55 / DI TO C + 6 / DI,B - 60 / DI TO C + 10 / DI,B - 74 / DI TO C + 6 / DI,B - 80 / DI TO C + 4 / DI + .5,B - 80 / DI TO C + 3 / DI + .5,B - 82 / DI TO C + 2 / DI + .5,B - 80 / DI TO C,B - 80 / DI
760 HPLOT C,B - 25 / DI TO C - 6 / DI,B - 25 / DI TO C - 10 / DI,B - 20 / DI TO C - 12 / DI,B - 10 / DI TO C - 10 / DI,B - 6 / DI TO C - 10 / DI,B TO C - 14 / DI,B TO C - 15 / DI,B - 5 / DI TO C - 16 / DI,B TO C - 20 / DI,B
765 HPLOT TO C - 20 / DI,B - 6 / DI TO C - 18 / DI,B - 10 / DI TO C - 18 / DI,B - 20 / DI TO C - 15 / DI,B - 30 / DI TO C - 15 / DI,B - 45 / DI TO C - 40 / DI,B - 60 / DI TO C - 40 / DI,B - 70 / DI
770 HPLOT TO C - 10 / DI,B - 55 / DI TO C - 6 / DI,B - 60 / DI TO C - 10 / DI,B - 74 / DI TO C - 6 / DI,B - 80 / DI TO C - 4 / DI + .5,B - 80 / DI TO C - 3 / DI + .5,B - 82 / DI TO C - 2 / DI + .5,B - 80 / DI TO C,B - 80 / DI
775 HPLOT C - 6 / DI,B - 25 / DI TO C,B - 6 / DI TO C + 10 / DI,B TO C + 4 / DI + .5,B - 8 / DI TO C + 6 / DI,B - 25 / DI: HPLOT C - 40 / DI, B - 64 / DI TO C - 40 / DI,B - 90 / DI TO C - 52 / DI,B - 80 / DI TO C - 52 / DI,B - 40 / DI
780 HPLOT C + 40 / DI,B - 86 / DI TO C + 38 / DI,B - 92 / DI TO C + 42 / DI,B - 92 / DI TO C + 40 / DI,B - 86 / DI TO C + 40 / DI,B - 50 / DI
785 HPLOT C + 4 / DI + .5,B - 70 / DI TO C + 6 / DI,B - 74 / DI: HPLOT C - 4 / DI + .5,B - 70 / DI TO C - 6 / DI,B - 74 / DI: HPLOT C,B - 64 / DI TO C,B - 60 / DI: GOTO 790
790 IF EN = 1 THEN EN = 0: RETURN
795 DI = DI + 1: GOTO 250
800 ZZ = RND ( - ABS (LN) - TX * 10 - TY * 1000 + IO * 31.4)
805 FOR X = 1 TO 9: FOR Y = 1 TO 9:DN%(X,Y) = 0: NEXT : NEXT
810 FOR X = 0 TO 10:DN%(X,0) = 1:DN%(X,10) = 1:DN%(0,X) = 1:DN%(10, X) = 1: NEXT
815 FOR X = 2 TO 8 STEP 2: FOR Y = 1 TO 9:DN%(X,Y) = 1:DN%(Y,X) = 1: NEXT : NEXT
820 FOR X = 2 TO 8 STEP 2: FOR Y = 1 TO 9 STEP 2
825 IF RND (1) > .95 THEN DN%(X,Y) = 2
830 IF RND (1) > .95 THEN DN%(Y,X) = 2
835 IF RND (1) > .6 THEN DN%(Y,X) = 3
840 IF RND (1) > .6 THEN DN%(X,Y) = 3
845 IF RND (1) > .6 THEN DN%(X,Y) = 4
850 IF RND (1) > .6 THEN DN%(Y,X) = 4
855 IF RND (1) > .97 THEN DN%(Y,X) = 9
860 IF RND (1) > .97 THEN DN%(X,Y) = 9
865 IF RND (1) > .94 THEN DN%(X,Y) = 5
870 IF RND (1) > .94 THEN DN%(Y,X) = 5
875 NEXT : NEXT
880 DN%(2,1) = 0: IF IO / 2 = INT (IN / 2) THEN DN%(7,3) = 7:DN%(3,7) = 8
885 IF IO / 2 < > INT (IN / 2) THEN DN%(7,3) = 8:DN%(3,7) = 7
890 IF IO = 1 THEN DN%(1,1) = 8:DN%(7,3) = 0
895 GOSUB 1400
900 RETURN
905 VTAB (24): PRINT "COMMAND? ";: CALL - 868
910 X = PEEK (-16384): IF X < 128 THEN 910
915 Q = FRE (0)
920 POKE - 16368,0
925 IF X = 141 THEN ON SGN (IN) + 1 GOTO 1020,1030
930 IF X = 149 THEN ON SGN (IN) + 1 GOTO 1065,1075
935 IF X = 136 THEN ON SGN (IN) + 1 GOTO 1090,1100
940 IF X = 175 THEN ON SGN (IN) + 1 GOTO 1115,1125
945 IF X = 216 THEN ON SGN (IN) + 1 GOTO 1130,1150
950 IF X = 193 OR X = 155 THEN ON SGN (IN) + 1 GOTO 1195,1200
955 IF X = 160 THEN PRINT "PASS": GOTO 980
960 IF X = 211 THEN 1395
965 IF X = 208 THEN IF PA = 1 THEN PA = 0: PRINT "PAUSE OFF": GOTO 905
970 IF X = 208 THEN IF PA = 0 THEN PA = 1: PRINT "PAUSE ON": GOTO 905
975 PRINT "HUH?": GOTO 905
976 REM ------------------ STARVE ------------------
980 PW(0) = PW(0) - 1 + SGN (IN) * .9: IF PW(0) < 0 THEN C(0) = 0: PRINT : PRINT "YOU HAVE STARVED!!!!!": GOTO 995
985 POKE 33,40: VTAB (22): HTAB (30): PRINT "FOOD=";PW(0);: CALL - 868: VTAB (23): HTAB (30): PRINT "H.P.=";C(0);: CALL - 868: VTAB (24) : HTAB (30): PRINT "GOLD=";C(5);: CALL - 868: POKE 33,29: HTAB (1)
990 PW(0) = INT (PW(0) * 10) / 10
995 IF C(0) < = 0 THEN 1635
1000 IF IO > 0 THEN GOSUB 1480: IF C(0) < = 0 THEN 995
1005 POKE 33,40: VTAB (22): HTAB (30): PRINT "FOOD=";PW(0);: CALL - 868: VTAB (23): HTAB (30): PRINT "H.P.=";C(0);: CALL - 868: VTAB (24) : HTAB (30): PRINT "GOLD=";C(5);: CALL - 868: POKE 33,29: HTAB (1)
1010 IF IO = 0 THEN GOSUB 175: GOTO 905
1015 IF IO > 0 THEN GOSUB 245: GOTO 905
1020 PRINT "NORTH": IF TE%(TX,TY - 1) = 1 THEN PRINT "YOU CAN'T PASS THE MOUNTAINS": GOTO 980
1025 TY = TY - 1: GOTO 980
1030 IF DN%(PX + DX,PY + DY) < > 1 AND DN%(PX + DX,PY + DY) < 10 THEN PX = PX + DX:PY = PY + DY
1035 PRINT "FORWARD"
1040 IF DN%(PX,PY) = 2 THEN PRINT "AAARRRGGGHHH!!! A TRAP!":C(0)= C( 0) - INT ( RND (1) * IO + 3):MR = 1:IN = IO + 1: PRINT "FALLING TO LEVEL ";IN: GOSUB 800: GOTO 980
1045 Z = 0
1050 IF DN%(PX,PY) = 5 THEN DN%(PX,PY) = 0: PRINT "GOLD!!!!!":Z = INT ( RND (1) * 5 * IO + IN): PRINT Z;"-PIECES OF EIGHT":C(5) = C( 5) + Z
1055 IF Z > 0 THEN Z = INT ( RND (1) * 6): PRINT "AND A ";W$(Z):PW(Z) = PW(Z) + 1: GOTO 980
1060 GOTO 980
1065 PRINT "EAST": IF TE%(TX + 1,TY) = 1 THEN PRINT "YOU CAN'T PASS T HE MOUNTAINS": GOTO 980
1070 TX = TX + 1: GOTO 980
1075 PRINT "TURN RIGHT"
1080 IF DX < > 0 THEN DY = DX:DX = 0: GOTO 980
1085 DX = - DY:DY = 0: GOTO 980
1090 PRINT "WEST": IF TE%(TX - 1,TY) = 1 THEN PRINT "YOU CAN'T PASS T HE MOUNTAINS": GOTO 980
1095 TX = TX - 1: GOTO 980
1100 PRINT "TURN LE"
1105 IF DX < > 0 THEN DY = - DX:DX = 0: GOTO 980
1110 DX = DY:DY = 0: GOTO 980
1115 PRINT "SOUTH": IF TE%(TX,TY + 1) = 1 THEN PRINT "YOU CAN'T PASS THE MOUNTAINS": GOTO 980
1120 TY = TY + 1: GOTO 980
1125 PRINT "TURN AROUND":DX = - DX:DY = - DY: GOTO 980
1130 IF TE%(TX,TY) = 3 THEN GOSUB 1895: GOSUB 1945: GOTO 980
1135 IF TE%(TX,TY) = 4 AND IO = 0 THEN PRINT "GO DUNGEON": PRINT "P LEASE WAIT ":IN = 1: GOSUB 800:DX = 1:DY = 0:PX = 1:PY = 1: GOTO 980
1140 IF TE%(TX,TY) = 5 THEN 1680
1145 PRINT "HUH?": GOTO 905
1150 IF DN%(PX,PY) < > 7 AND DN%(PX,PY) < > 9 THEN 1165
1155 PRINT "GO DOWN TO LEVEL ";IN + 1
1160 IO = IO + 1: GOSUB 800:MR = 1: GOTO 980
1165 IF DN%(PX,PY) < > 8 THEN PRINT "HUH?": GOTO 980
1170 IF IO = 1 THEN PRINT "LEAVE DUNGEON":IN = 0: GOTO 1185
1175 PRINT "GO UP TO LEVEL ";IN - 1
1180 IO = IO - 1: GOSUB 800:MR = 1
1185 IF IO = 0 THEN PRINT "THOU HAST GAINED": PRINT LK;" HIT POINTS":C (0) = C(0) + LK:LK = 0
1190 GOTO 980
1195 GOTO 980
1200 MN = 0:DA = 0: PRINT "ATTACK": PRINT "WHICH WEAPON ";: GET Q$
1205 IF Q$ = "R" THEN DA = 10: PRINT "RAPIER": IF PW(1) < 1 THEN PRINT "NOT OWNED": GOTO 1200
1210 IF Q$ = "A" THEN DA = 5: PRINT "AXE": IF PW(2) < 1 THEN PRINT "N OT OWNED": GOTO 1200
1215 IF Q$ = "S" THEN DA = 1: PRINT "SHIELD": IF PW(3) < 1 THEN PRINT "NOT OWNED": GOTO 1200
1220 IF Q$ = "B" THEN DA = 4: PRINT "BOW": IF PW(4) < 1 THEN PRINT "N OT OWNED": GOTO 1200
1225 IF Q$ = "M" THEN PRINT "MAGIC AMULET": GOTO 1330
1230 IF Q$ = "B" AND PT$ = "M" THEN PRINT "MAGES CAN'T USE BOWS!": GOTO 1200
1235 IF Q$ = "R" AND PT$ = "M" THEN PRINT "MAGES CAN'T USE RAPIERS!": GOTO 1200
1240 IF DA = 0 THEN PRINT "HANDS"
1245 IF DA = 5 OR DA = 4 THEN 1305
1250 MN = DN%(PX + DX,PY + DY) / 10:MN = INT (MN)
1255 IF MN < 1 OR C(2) - RND (1) * 25 < MN + IO THEN PRINT "YOU MISSED": GOTO 1295
1260 PRINT "HIT!!! "
1265 DA = RND (1) * DA + C(1) / 5
1270 MZ%(MN,1) = MZ%( MN,1) - DA
1275 PRINT M$(MN);"'S HIT POINTS=";MZ%(MN,1)
1280 IF MZ%(MN,1) < 1 THEN PRINT "THOU HAST KILLED A ";M$(MN): PRINT " THOU SHALT RECEIVE":DA = INT (MN + IN): PRINT DA;" PIECES OF EIGHT"
1285 IF MZ%(MN,1) < 1 THEN C(5) = INT (C(5) + DA):DN%(ML%(MN,0),ML%(MN,1)) = DN%(ML%(MN,0),ML%(MN,1)) - 10 * MN:MZ%(MN,0) = 0
1290 LK = LK + INT (MN * IO / 2): IF MN = TASK THEN TASK = - TASK
1295 IF PA = 1 THEN PRINT "-CR- TO CONT. ";: INPUT Q$
1300 GOTO 980
1305 IF DA = 5 THEN PRINT "TO THROW OR SWING:";: GET Q$: IF Q$ < > " T" THEN PRINT "SWING": GOTO 1250
1310 IF DA = 5 THEN PRINT "THROW":PW(2) = PW(2) - 1
1315 FOR Y = 1 TO 5: IF PX + DX * Y < 1 OR PX + DX * Y > 9 OR PY + DY * Y > 9 OR PY + DY * Y < 0 THEN 1255
1320 MN = DN%(PX + DX * Y,PY + DY * Y):MN = INT (MN / 10): IF MN > 0 THEN 1255
1325 NEXT : GOTO 1255
1330 IF PW(5) < 1 THEN PRINT "NONE OWNED": GOTO 1200
1335 IF PT$ = "F" THEN Q = INT ( RND (1) * 4 + 1): GOTO 1350
1340 PRINT "1-LADDER-UP","2-LADDER-DN": PRINT "3-KILL","4-BAD??": PRINT "CHOICE ";: GET Q$:Q = VAL (Q$): PRINT Q: IF Q < 1 OR Q > 4 THEN 1340
1345 IF RND (1) > .75 THEN PRINT "LAST CHARGE ON THIS AMULET!":PW(5) = PW(5) - 1
1350 ON Q GOTO 1355,1360,1365,1370
1355 PRINT "LADDER UP":DN%(PX,PY) = 8: GOTO 980
1360 PRINT "LADDER DOWN":DN%(PX,PY) = 7: GOTO 980
1365 PRINT "MAGIC ATTACK":DA = 10 + IN: GOTO 1315
1370 ON INT ( RND (1) * 3 + 1) GOTO 1375,1385,1390
1375 PRINT "YOU HAVE BEEN TURNED": PRINT "INTO A TOAD!"
1380 FOR Z2 = 1 TO 4:C(Z2) = 3: NEXT Z2: GOTO 980
1385 PRINT "YOU HAVE BEEN TURNED": PRINT "INTO A LIZARD MAN": FOR Y = 0 TO 4:C(Y) = INT (C(Y) * 2.5): NEXT : GOTO 980
1390 PRINT "BACKFIRE":C(0) = C(0) / 2: GOTO 980
1395 GOSUB 1895: HOME : PRINT "PRESS -CR- TO CONTINUE";: INPUT Q$: TEXT : HOME : GOTO 980
1400 NM = 0: FOR X = 1 TO 10
1405 MZ%(X,0) = 0:MZ%(X,1) = X + 3 + IN
1410 IF X - 2 > IO OR RND (1) > .4 THEN 1450
1415 ML%(X,0) = INT ( RND (1) * 9 + 1):ML%(X,1) = INT ( RND (1) * 9 + 1)
1420 IF DN%(ML%(X,0),ML%(X,1)) < > 0 THEN 1415
1425 IF ML%(X,0) = PX AND ML%(X,1) = PY THEN 1415
1430 DN%(ML%(X,0),ML%(X,1)) = X * 10
1435 MZ%(X,0) = 1
1440 NM = NM + 1
1445 MZ%(X,1) = X * 2 + IO * 2 * LV
1450 NEXT : RETURN
1455 HPLOT C - 28 / DI,B - 41 / DI TO C + 30 / DI,B - 55 / DI: HPLOT C + 28 / DI,B - 58 / DI TO C + 22 / DI,B - 56 / DI
1460 HPLOT TO C + 22 / DI,B - 53 / DI TO C + 28 / DI,B - 52 / DI TO C + 34 / DI,B - 54 / DI: HPLOT C + 20 / DI,B - 50 / DI TO C + 26 / DI,B - 47 / DI
1465 HPLOT C + 10 / DI,B - 58 / DI TO C + 10 / DI,B - 61 / DI TO C + 4 / DI,B - 58 / DI: HPLOT C - 10 / DI,B - 58 / DI TO C - 10 / DI,B - 61 / DI
1470 HPLOT TO C - 4 / DI,B - 58 / DI: HPLOT C + 40 / DI,B - 9 / DI TO C + 50 / DI,B - 12 / DI TO C + 40 / DI,B - 7 / DI
1475 HPLOT C - 8 / DI,B - 25 / DI TO C + 6 / DI,B - 7 / DI TO C + 28 / DI,B - 7 / DI TO C + 28 / DI,B - 9 / DI TO C + 20 / DI,B - 9 / DI TO C + 6 / DI,B - 25 / DI: GOTO 790
1480 FOR MM = 1 TO 10: IF MZ%(MM,0) = 0 THEN 1630
1485 RA = SQR ((PX - ML%(MM,0)) ^ 2 + (PY - ML%(MM,1)) ^ 2)
1490 IF MZ%(MM,1) < IO * LV THEN 1505
1495 IF RA < 1.3 THEN 1580
1500 IF MM = 8 AND RA < 3 THEN 1630
1505 X1 = SGN (PX - ML%(MM,0)):Y1 = SGN (PY - ML%(MM,1))
1510 IF MZ%(MM,1) < IO * LV THEN X1 = - X1:Y1 = - Y1
1515 IF Y1 = 0 THEN 1530
1520 D = DN%(ML%(MM,0),(ML%(MM,1) + Y1 + .5)): IF D = 1 OR D > 9 OR D = 2 THEN 1530
1525 X1 = 0: GOTO 1540
1530 Y1 = 0: IF X1 = 0 THEN 1540
1535 D = DN%((ML%(MM,0) + X1 + .5),ML%(MM,1)): IF D = 1 OR D > 9 OR D = 2 THEN X1 = 0: GOTO 1560
1540 DN%(ML%(MM,0),ML%(MM,1)) = DN%(ML%(MM,0),ML%(MM,1)) - 10 * MM
1545 IF ML%(MM,0) + X1 = PX AND ML%(MM,1) + Y1 = PY THEN 1630
1550 ML%(MM,0) = ML%(MM,0) + X1:ML%(MM,1) = ML%(MM,1) + Y1
1555 DN%(ML%(MM,0),ML%(MM,1)) = (DN%(ML%(MM,0),ML%(MM,1)) + 10 * MM + .5)
1560 IF X1 < > 0 OR Y1 < > 0 THEN 1630
1565 IF MZ%(MM,1) < IO * LV AND RA < 1.3 THEN 1580
1570 IF MZ%(MM,1) < IO * LV THEN MZ%(MM,1) = MZ%(MM,1) + MM + IN
1575 GOTO 1630
1580 IF MM = 2 OR MM = 7 THEN 1610
1585 PRINT "YOU ARE BEING ATTACKED": PRINT "BY A ";M$(MM)
1590 IF RND (1) * 20 - SGN (PW(3)) - C(3) + MM + IO < 0 THEN PRINT " MISSED": GOTO 1600
1595 PRINT "HIT":C(0) = C(0) - INT ( RND (1) * MM + IN)
1600 IF PA = 1 THEN PRINT "-CR- TO CONT. ";: INPUT Q$
1605 GOTO 1630
1610 IF RND (1) < .5 THEN 1585
1615 IF MM = 7 THEN PW(0) = INT (PW(0) / 2): PRINT "A GREMLIN STOLE SO ME FOOD": GOTO 1600
1620 ZZ = INT ( RND (1) * 6): IF PW(ZZ) < 1 THEN 1620
1625 PRINT "A THIEF STOLE A ";W$(ZZ):PW(ZZ) = PW(ZZ) - 1: GOTO 1600
1630 NEXT : RETURN
1632 REM ------------------ DIE ------------------
1635 POKE 33,40: PRINT : PRINT : PRINT "    WE MOURN THE PASSING OF "
1640 IF LEN (PN$) > 22 THEN PN$ = ""
1645 IF PN$ = "" THEN PN$ = "THE PEASANT"
1650 PN$ = PN$ + " AND HIS COMPUTER"
1655 HTAB (20 - INT ( LEN (PN$) / 2)): PRINT PN$
1660 PRINT " TO INVOKE A MIRACLE OF RESSURECTION"
1665 PRINT "       <HIT ESC KEY>";
1670 IF PEEK ( - 16384) = 155 THEN 5
1675 GOTO 1670
1677 REM ------------------ LORD BRITISH'S CASTLE------------------
1680 HOME : TEXT : HOME
1685 CALL 62450
1690 IF PN$ < > "" THEN 1730
1695 PRINT : PRINT : PRINT "   WELCOME PEASANT INTO THE HALLS OF": PRINT "THE MIGHTY LORD BRITISH. HEREIN THOU MAYCHOOSE TO DARE BATTLE WITH THE EVIL": PRINT "CREATURES OF THE DEPTHS, FOR GREAT": PRINT "REWARD !"
1700 PRINT : PRINT "WHAT IS THY NAME PEASANT ";: INPUT PN$
1705 PRINT "DOEST THOU WISH FOR GRAND ADVENTURE ? ";: GET Q$: IF Q$ < > "Y" THEN PRINT : PRINT "THEN LEAVE AND BEGONE!":PN$ = "": PRINT : PRINT "     PRESS -SPACE- TO CONT.";: GET Q$: GOTO 980
1710 PRINT
1715 PRINT : PRINT "GOOD! THOU SHALT TRY TO BECOME A ": PRINT "KNIGHT!! !": PRINT : PRINT "THY FIRST TASK IS TO GO INTO THE": PRINT "DUNGEONS AND TO RETURN ONLY AFTER": PRINT "KILLING A(N) ";:TASK = INT (C(4 ) / 3): PRINT M$(TASK)
1720 PRINT : PRINT "   GO NOW UPON THIS QUEST, AND MAY": PRINT "LADY LUCK BE FAIR UNTO YOU.....": PRINT ".....ALSO I, BRITISH, HAVE INCREASED": PRINT "EACH OF THY ATTRIBUTES BY ONE!"
1725 PRINT : PRINT "     PRESS -SPACE- TO CONT.";: GET Q$: FOR X = 0 TO 5:C(X) = C(X) + 1: NEXT : HOME : GOTO 980
1727 REM ------------------ RETURN TO CASTLE ------------------
1730 IF TASK > 0 THEN PRINT : PRINT : PRINT PN$;" WHY HAST THOU RETURNED?": PRINT "THOU MUST KILL A(N) ";M$(TASK): PRINT "GO NOW AND COMPLETE THY QUEST!": PRINT : PRINT "     PRESS -SPACE- TO CONT.";: GET Q$: HOME : GOTO 980
1735 PRINT : PRINT : PRINT : PRINT "AAHH!!.....";PN$: PRINT : PRINT "THOU HAST ACOMPLISHED THY QUEST!": IF ABS (TASK) = 10 THEN 1750
1740 PRINT "UNFORTUNATELY, THIS IS NOT ENOUGH TO": PRINT "BECOME A KNIGHT.":TASK = ABS (TASK) + 1: PRINT : PRINT "NOW THOU MUST KILL A(N) ";M$(TASK)
1745 GOTO 1720
1746 REM ------------------ WIN ------------------
1750 TEXT : HOME : PRINT : PRINT : PRINT :PN$ = "LORD " + PN$: PRINT "   ";PN$;","
1755 PRINT "    THOU HAST PROVED THYSELF WORTHY": PRINT "OF KNIGHTHO OD, CONTINUE PLAY IF THOU": PRINT "DOTH WISH, BUT THOU HAST ACOMPLISHED": PRINT "THE MAIN OBJECTIVE OF THIS GAME..."
1760 IF LV = 10 THEN 1775
1765 PRINT : PRINT "  NOW MAYBE THOU ART FOOLHEARTY": PRINT "ENOUGH TO TRY DIFFICULTY LEVEL ";LV + 1
1770 GOTO 1725
1775 PRINT : PRINT "...CALL CALIFORNIA PACIFIC COMPUTER": PRINT "AT (415)-569-9126 TO REPORT THIS": PRINT "AMAZING FEAT!"
1780 GOTO 1725
1785 REM ------------------  CHARACTER CREATE  ------------------
1790 TEXT : HOME : VTAB (5): INPUT "TYPE THY LUCKY NUMBER.....";Q$:LN = VAL (Q$)
1795 VTAB (7): INPUT "LEVEL OF PLAY (1-10)......";Q$:LV = INT ( VAL ( Q$))
1800 IF LV < 1 OR LV > 10 THEN 1795
1805 ZZ = RND (-ABS(LN))
1810 DATA  "HIT POINTS.....","STRENGTH.......","DEXTERITY......","STA MINA........","WISDOM.........","GOLD..........."
1815 DIM PW(5)
1820 DIM C$(5): FOR X = 0 TO 5: READ C$(X): NEXT
1825 DIM C(5)
1830 DIM M$(10),ML%(10,1),MZ%(10,1)
1835 DATA    "SKELETON","THIEF","GIANT RAT","ORC","VIPER","CARRION CRAWLER","GREMLIN","MIMIC","DAEMON","BALROG"
1840 FOR X = 1 TO 10: READ M$(X): NEXT
1845 FOR X = 0 TO 5:C(X) = INT ( SQR ( RND (1)) * 21 + 4): NEXT X
1850 HOME : VTAB (8): FOR X = 0 TO 5: PRINT C$(X),C(X): NEXT : PRINT : PRINT "SHALT THOU PLAY WITH THESE QUALITIES?": HTAB (20): GET Q$: IF Q$ < > "Y" THEN 1845
1855 VTAB (15): PRINT : PRINT "AND SHALT THOU BE A FIGHTER OR A MAGE?" : HTAB (20): GET PT$
1860 IF PT$ = "M" OR PT$ = "F" THEN 1880
1865 GOTO 1855
1870 REM ------------------  END CHARACTER CREATE  ------------------
1875 REM ------------------  BEGIN INITIALIZE ITEMS  ------------------
1880 DIM W$(5): DATA  "FOOD","RAPIER","AXE","SHIELD","BOW AND ARROWS ","MAGIC AMULET": FOR X = 0 TO 5: READ W$(X): NEXT
1885 GOSUB 1895: GOSUB 1945: RETURN
1890 REM ------------------  END INITIALIZE ITEMS  ------------------
1895 TEXT : HOME : PRINT : PRINT : PRINT "   STAT'S       WEAPONS": PRINT : FOR X = 0 TO 5: PRINT C$(X);C(X); TAB( 24);"0-";W$(X) : NEXT : POKE 34,12: HOME : POKE 35,15
1900 VTAB (11): HTAB (18): PRINT "Q-QUIT"
1905 IF PW(0) > 0 THEN CALL 62450
1910 FOR Z = 0 TO 5: VTAB (5 + Z): HTAB (25 - LEN ( STR$ (PW(Z)))): PRINT PW(Z);: NEXT
1915 VTAB (17): HTAB (5): PRINT "PRICE";: HTAB (15): PRINT "DAMAGE";: HTAB (25): PRINT "ITEM"
1920 FOR X = 0 TO 5: VTAB (19 + X): HTAB (25): PRINT W$(X): NEXT
1925 VTAB (19): HTAB (5): PRINT "1 FOR 10": HTAB (15): PRINT "N/A": VTAB (20): HTAB (5): PRINT "8": HTAB (15): PRINT "1-10": VTAB (21): HTAB (5): PRINT "5": HTAB (15): PRINT "1-5"
1930 VTAB (22): HTAB (5): PRINT "6": HTAB (15): PRINT "1": VTAB (23): HTAB (5): PRINT "3": HTAB (15): PRINT "1-4": VTAB (24): HTAB (5): PRINT " 15": HTAB (15): PRINT "?????": HOME
1935 RETURN
1940 REM ------------------  BEGIN ADVENTURE SHOP  ------------------
1945 HOME : PRINT "WELCOME TO THE ADVENTURE SHOP"
1950 PRINT "WHICH ITEM SHALT THOU BUY ";: GET Q$: IF Q$ = "Q" THEN PRINT : PRINT "BYE": FOR Z = 1 TO 1000: NEXT : TEXT : HOME : RETURN
1955 Z = - 1
1960 IF Q$ = "F" THEN PRINT "FOOD":Z = 0:P = 1
1965 IF Q$ = "R" THEN PRINT "RAPIER":Z = 1:P = 8
1970 IF Q$ = "A" THEN PRINT "AXE":Z = 2:P = 5
1975 IF Q$ = "S" THEN PRINT "SHIELD":Z = 3:P = 6
1980 IF Q$ = "B" THEN PRINT "BOW":Z = 4:P = 3
1985 IF Q$ = "M" THEN PRINT "AMULET":Z = 5:P = 15
1990 IF Z = - 1 THEN PRINT Q$: PRINT "I'M SORRY WE DON'T HAVE THAT." : GOTO 1950
1995 IF Q$ = "R" AND PT$ = "M" THEN PRINT "I'M SORRY MAGES": PRINT "CAN'T USE THAT!": GOTO 1950
2000 IF Q$ = "B" AND PT$ = "M" THEN PRINT "I'M SORRY MAGES": PRINT "CAN'T USE THAT!": GOTO 1950
2005 IF C(5) - P < 0 THEN PRINT "M'LORD THOU CAN NOT AFFORD THAT ITEM.": GOTO 1950
2010 IF Z = 0 THEN PW(Z) = PW(Z) + 9
2015 PW(Z) = PW(Z) + 1:C(5) = C(5) - P
2020 VTAB (10): HTAB (16): PRINT C(5);" "
2025 VTAB (5 + Z): HTAB (25 - LEN ( STR$ (PW(Z)))): PRINT PW(Z);: HTAB (1): VTAB (14): PRINT
2030 GOTO 1950
2035 REM ------------------  END ADVENTURE SHOP  ------------------