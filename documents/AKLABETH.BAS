0 ONERR GOTO 20
10 REM
20 PR# 0: IN# 0
30 HIMEM: 49151
40 CLEAR : GOSUB 3530
50 ZZ = RND ( - ABS (LN))
60 LEVEL = 0
70 TEXT : HOME : NORMAL : VTAB (12): PRINT " WELCOME TO AKALABETH, WORLD OF DOOM!"
80 DIM DN%(10,10),TE%(20,20),XX%(10),YY%(10),PER%(10,3),LD%(10,5),CD%(10,3),FT%(10,5),LAD%(10,3)
90 FOR X = 0 TO 20:TE%(X,0) = 1:TE%(0,X) = 1:TE%(X,20) = 1:TE%(20,X) = 1: NEXT
100 : VTAB (23): PRINT " (PLEASE WAIT)";
110 FOR X = 1 TO 19: FOR Y = 1 TO 19:TE%(X,Y) = INT ( RND (1) ^ 5 * 4.5 )
120 IF TE%(X,Y) = 3 AND RND (1) > .5 THEN TE%(X,Y) = 0
130 NEXT : PRINT ".";: NEXT
140 TE%( INT ( RND (1) * 19 + 1), INT ( RND (1) * 19 + 1)) = 5:TX = INT ( RND (1) * 19 + 1):TY = INT ( RND (1) * 19 + 1):TE%(TX,TY) = 3
150 XX%(0) = 139:YY%(0) = 79
160 FOR X = 2 TO 20 STEP 2:XX%(X / 2) = INT ( ATN (1 / X) / ATN (1) * 140 + .5):YY%(X / 2) = INT (XX%(X / 2) * 4 / 7)
170 PER%(X / 2,0) = 139 - XX%(X / 2):PER%(X / 2,1) = 139 + XX%(X / 2):PER%(X / 2,2) = 79 - YY%(X / 2):PER%(X / 2,3) = 79 + YY%(X / 2): NEXT
180 PER%(0,0) = 0:PER%(0,1) = 279:PER%(0,2) = 0:PE%(0,3) = 159
190 FOR X = 1 TO 10:CD%(X,0) = 139 - XX%(X) / 3:CD%(X,1) = 139 + XX%(X) / 3:CD%(X,2) = 79 - YY%(X) * .7:CD%(X,3) = 79 + YY%(X): NEXT : PRINT " .";
200 FOR X = 0 TO 9:LD%(X,0) = (PER%(X,0) * 2 + PER%(X + 1,0)) / 3:LD%(X, 1) = (PER%(X,0) + 2 * PER%(X + 1,0)) / 3:W = LD%(X,0) - PE%(X,0)
210 LD%(X,2) = PE%(X,2) + W * 4 / 7:LD%(X,3) = PER%(X,2) + 2 * W * 4 / 7: LD%(X,4) = (PE%(X,3) * 2 + PE%(X + 1,3)) / 3:LD%(X,5) = (PE%(X,3) + 2 * PE%(X + 1,3)) / 3
220 LD%(X,2) = LD%(X,4) - (LD%(X,4) - LD%(X,2)) * .8:LD%(X,3) = LD%(X,5) - (LD%(X,5) - LD%(X,3)) * .8: IF LD%(X,3) = LD%(X,4) THEN LD%(X,3) = LD%(X,3) - 1
230 NEXT
240 FOR X = 0 TO 9:FT%(X,0) = 139 - XX%(X) / 3:FT%(X,1) = 139 + XX%(X) / 3:FT%(X,2) = 139 - XX%(X + 1) / 3:FT%(X,3) = 139 + XX%(X + 1) / 3
250 FT%(X,4) = 79 + (YY%(X) * 2 + YY%(X + 1)) / 3:FT%(X,5) = 79 + (YY%(X) + 2 * YY%(X + 1)) / 3: NEXT
260 FOR X = 0 TO 9:LAD%(X,0) = (FT%(X,0) * 2 + FT%(X,1)) / 3:LAD%(X,1) = (FT%(X,0) + 2 * FT%(X,1)) / 3:LAD%(X,3) = FT%(X,4):LAD%(X,2) = 159 - LAD%(X,3): NEXT
270 HOME : HCOLOR= 3
280 POKE 34,20: POKE 33,29: HOME
290 GOSUB 310: GOTO 1770
300 FOR X = 0 TO 9: FOR Y = 0 TO 5: PRINT LD%(X,Y);" ";: NEXT : PRINT : NEXT : GET Q$
310 HGR : FOR Y = - 1 TO 1: FOR X = - 1 TO 1
320 HPLOT 138,75 TO 142,75: HPLOT 140,73 TO 140,77
330 ZZ = TER%(TX + X,TY + Y):X1 = 65 + (X + 1) * 50:Y1 = (Y + 1) * 50
340 IF ZZ = 2 THEN HPLOT X1 + 20,Y1 + 20 TO X1 + 30,Y1 + 20 TO X1 + 30 ,Y1 + 30 TO X1 + 20,Y1 + 30 TO X1 + 20,Y1 + 20
350 IF ZZ = 3 THEN HPLOT X1 + 10,Y1 + 10 TO X1 + 20,Y1 + 10 TO X1 + 20 ,Y1 + 40 TO X1 + 10,Y1 + 40 TO X1 + 10,Y1 + 30
360 IF ZZ = 3 THEN HPLOT X1 + 40,Y1 + 30 TO X1 + 40,Y1 + 40 TO X1 + 30,Y1 + 40 TO X1 + 30,Y1 + 10 TO X1 + 40,Y1 + 10
370 IF ZZ = 3 THEN HPLOT X1 + 40,Y1 + 20 TO X1 + 10,Y1 + 20 TO X1 + 10,Y1 + 10
380 IF ZZ = 4 THEN HPLOT X1 + 20,Y1 + 20 TO X1 + 30,Y1 + 30: HPLOT X1 + 20,Y1 + 30 TO X1 + 30,Y1 + 20
390 IF ZZ = 5 THEN HPLOT X1,Y1 TO X1 + 50,Y1 TO X1 + 50,Y1 + 50 TO X1, Y1 + 50 TO X1,Y1
400 : HPLOT X1 + 10,Y1 + 10 TO X1 + 10,Y1 + 40 TO X1 + 40,Y1 + 40 TO X1 + 40,Y1 + 10 TO X1 + 10,Y1 + 10 TO X1 + 40,Y1 + 40: HPLOT X1 + 10,Y1 + 40 TO X1 + 40,Y1 + 10
410 IF ZZ = 1 THEN HPLOT X1 + 10,Y1 + 50 TO X1 + 10,Y1 + 40 TO X1 + 20 ,Y1 + 30 TO X1 + 40,Y1 + 30 TO X1 + 40,Y1 + 50
420 HPLOT X1,Y1 + 10 TO X1 + 10,Y1 + 10: HPLOT X1 + 50,Y1 + 10 TO X1 + 40,Y1 + 10: HPLOT X1, Y1 + 40 TO X1 + 10,Y1 + 40: HPLOT X1 + 40,Y1 + 40 TO X1 + 50,Y1 + 40
430 IF ZZ = 1 THEN HPLOT X1 + 10,Y1 TO X1 + 10,Y1 + 20 TO X1 + 20,Y1 + 20 TO X1 + 20,Y1 + 30 TO X1 + 30,Y1 + 30 TO X1 + 30,Y1 + 10 TO X1 + 40,Y1 + 10 TO X1 + 40,Y1
440 NEXT : NEXT : RETURN
450 HGR :DIS = 0: HCOLOR= 3
460 CENT = DNG%(PX + DX * DIS,PY + DY * DIS):LEFT = DNG%(PX + DX * DIS + DY,PY + DY * DIS - DX):RIGH = DNG%(PX + DX * DIS - DY,PY + DY * DIS + DX)
470 L1 = PER%(DIS,0):R1 = PER%(DIS,1):T1 = PER%(DIS,2):B1 = PER%(DIS,3): L2 = PER%(DIS + 1,0):R2 = PER%(DIS + 1,1):T2 = PER%(DIS + 1,2):B2 = PER%(DIS + 1,3)
480 CENT = INT (CENT):LEFT = INT (LEFT):RIGHT = INT (RIGHT)
490 MC = INT (CENT / 10):CENT = CENT - MC * 10:LEFT = INT ((LEFT / 10 - INT (LEF / 10)) * 10 + .1):RIGH = INT ((RIGH / 10 - INT (RIG / 10 )) * 10 + .1)
500 IF DIS = 0 THEN 540
510 IF CENT = 1 OR CENT = 3 OR CENT = 4 THEN HPLOT L1,T1 TO R1,T1 TO R1,B1 TO L1,B1 TO L1,T1
520 IF CENT = 1 OR CENT = 3 THEN EN = 1: GOTO 740
530 IF CENT = 4 THEN HPLOT CD%(DIS,0),CD%(DIS,3) TO CD%(DIS,0),CD%(DIS ,2) TO CD%(DIS,1),CD%(DIS,2) TO CD%(DIS,1),CD%(DIS,3):EN = 1: GOTO 740
540 IF LEFT = 1 OR LEFT = 3 OR LEFT = 4 THEN HPLOT L1,T1 TO L2,T2: HPLOT L1,B1 TO L2,B2
550 IF RIGH = 1 OR RIGH = 3 OR RIGH = 4 THEN HPLOT R1,T1 TO R2,T2: HPLOT R1,B1 TO R2,B2
560 IF LEFT = 4 AND DIS > 0 THEN HPLOT LD%(DIS,0),LD%(DIS,4) TO LD%(DIS,0),LD%(DIS,2) TO LD%(DIS,1),LD%(DIS,3) TO LD%(DIS,1),LD%(DIS,5)
570 IF LEFT = 4 AND DIS = 0 THEN HPLOT 0,LD%(DIS,2) - 3 TO LD%(DIS,1), LD%(DIS,3) TO LD%(DIS,1),LD%(DIS,5)
580 IF RIGH = 4 AND DIS > 0 THEN HPLOT 279 - LD%(DIS,0),LD%(DIS,4) TO 279 - LD%(DIS,0),LD%(DIS,2) TO 279 - LD%(DIS,1),LD%(DIS,3) TO 279 - LD%(DIS,1),LD%(DIS,5)
590 IF RIGH = 4 AND DIS = 0 THEN HPLOT 279,LD%(DIS,2) - 3 TO 279 - LD% (DIS,1),LD%(DIS,3) TO 279 - LD%(DIS,1),LD%(DIS,5)
600 IF LEFT = 3 OR LEFT = 1 OR LEFT = 4 THEN 630
610 IF DIS < > 0 THEN HPLOT L1,T1 TO L1,B1
620 HPLOT L1,T2 TO L2,T2 TO L2,B2 TO L1,B2
630 IF RIGH = 3 OR RIGH = 1 OR RIGH = 4 THEN 660
640 IF DIS < > 0 THEN HPLOT R1,T1 TO R1,B1
650 HPLOT R1,T2 TO R2,T2 TO R2,B2 TO R1,B2
660 IF CENT = 7 OR CENT = 9 THEN HPLOT FT%(DIS,0),FT%(DIS,4) TO FT%(DIS,2),FT%(DIS,5) TO FT%(DIS,3),FT%(DIS,5) TO FT%(DIS,1),FT%(DIS,4) TO FT%(DIS,0),FT%(DIS,4)
670 IF CENT = 8 THEN HPLOT FT%(DIS,0),158 - FT%(DIS,4) TO FT%(DIS,2),158 - FT%(DIS,5) TO FT%(DIS,3),158 - FT%(DIS,5) TO FT%(DIS,1),158 - FT%(DIS,4) TO FT%(DIS,0),158 - FT%(DIS,4)
680 IF CENT = 7 OR CENT = 8 THEN BASE = LAD%(DIS,3):TP = LAD%(DIS,2):LX = LAD%(DIS,0):RX = LAD%(DIS,1): HPLOT LX,BA TO LX,TP: HPLOT RX,TP TO RX,BA
690 IF CENT = 7 OR CENT = 8 THEN Y1 = (BA * 4 + TP) / 5:Y2 = (BA * 3 + TP * 2) / 5:Y3 = (BA * 2 + TP * 3) / 5:Y4 = (BA + TP * 4) / 5: HPLOT LX,Y1 TO RX,Y1: HPLOT LX,Y2 TO RX,Y2: HPLOT LX,Y3 TO RX,Y3: HPLOT LX ,Y4 TO RX,Y4
700 IF DIS > 0 AND CENT = 5 THEN HPLOT 139 - 10 / DIS,PER%(DIS,3) TO 139 - 10 / DIS,PER%(DIS,3) - 10 / DIS TO 139 + 10 / DIS,PER%(DIS,3) - 10 / DIS TO 139 + 10 / DIS,PER%(DIS,3) TO 139 - 10 / DIS,PER%(DIS,3)
710 IF CENT = 5 AND DIS > 0 THEN INVERSE : PRINT "CHEST!": NORMAL
720 IF DIS > 0 AND CENT = 5 THEN HPLOT 139 - 10 / DIS,PER%(DIS,3) - 10 / DIS TO 139 - 5 / DIS,PER%(DIS,3) - 15 / DIS TO 139 + 15 / DIS,PER %(DIS,3) - 15 / DIS TO 139 + 15 / DIS,PER%(DIS,3) - 5 / DIS TO 139 + 10 / DIS,PER%(DIS,3)
730 IF DIS > 0 AND CENT = 5 THEN HPLOT 139 + 10 / DIS,PER%(DIS,3) - 10 / DIS TO 139 + 15 / DIS,PER%(DIS,3) - 15 / DIS
740 IF MC < 1 THEN 1540
750 B = 79 + YY%(DIS):C = 139
760 INVERSE : IF MC = 8 THEN PRINT "CHEST!";: CALL - 868: PRINT : NORMAL : GOTO 780
770 PRINT M$(MC);: CALL - 868: PRINT : NORMAL
780 IF DIS = 0 THEN 1540
790 ON MC GOTO 810,880,920,980,1060,1140,1210,1260,1300,1430
800 GOTO 1540
810 HPLOT C - 23 / DIS,B TO C - 15 / DIS,B TO C - 15 / DI,B - 15 / DI TO C - 8 / DI,B - 30 / DI TO C + 8 / DI,B - 30 / DI TO C + 15 / DI,B - 15 / DI TO C + 15 / DI,B TO C + 23 / DI,B
820 HPLOT C,B - 26 / DI TO C,B - 65 / DI: HPLOT C - 2 / DI + .5,B - 38 / DI TO C + 2 / DI + .5,B - 38 / DI: HPLOT C - 3 / DI + .5,B - 45 / DI TO C + 3 / DI + .5,B - 45 / DI: HPLOT C - 5 / DI + .5,B - 53 / DI TO C + 5 / DI + .5,B - 53 / DI
830 HPLOT C - 23 / DI,B - 56 / DI TO C - 30 / DI,B - 53 / DI TO C - 23 / DI,B - 45 / DI TO C - 23 / DI,B - 53 / DI TO C - 8 / DI,B - 38 / DI
840 HPLOT C - 15 / DI,B - 45 / DI TO C - 8 / DI,B - 60 / DI TO C + 8 / DI,B - 60 / DI TO C + 15 / DI,B - 45 / DI: HPLOT C + 15 / DI,B - 42 / DI TO C + 15 / DI,B - 57 / DI: HPLOT C + 12 / DI,B - 45 / DI TO C + 20 / DI,B - 45 / DI
850 HPLOT C,B - 75 / DI TO C - 5 / DI + .5,B - 80 / DI TO C - 8 / DI,B - 75 / DI TO C - 5 / DI + .5,B - 65 / DI TO C + 5 / DI + .5,B - 65 / DI TO C + 5 / DI + .5,B - 68 / DI TO C - 5 / DI + .5,B - 68 / DI TO C - 5 / DI + .5,B - 65 / DI
860 HPLOT TO C + 5 / DI + .5,B - 65 / DI TO C + 8 / DI,B - 75 / DI TO C + 5 / DI + .5,B - 80 / DI TO C - 5 / DI + .5,B - 80 / DI: HPLOT C - 5 / DI + .5,B - 72 / DI: HPLOT C + 5 / DI + .5,B - 72 / DI
870 GOTO 1540
880 HPLOT C,B - 56 / DI TO C,B - 8 / DI TO C + 10 / DI,B TO C + 30 / DI ,B TO C + 30 / DI,B - 45 / DI TO C + 10 / DI,B - 64 / DI TO C,B - 56 / DI
890 HPLOT TO C - 10 / DI,B - 64 / DI TO C - 30 / DI,B - 45 / DI TO C - 30 / DI,B TO C - 10 / DI,B TO C,B - 8 / DI
900 HPLOT C - 10 / DI,B - 64 / DI TO C - 10 / DI,B - 75 / DI TO C,B - 83 / DI TO C + 10 / DI,B - 75 / DI TO C,B - 79 / DI TO C - 10 / DI,B - 75 / DI TO C,B - 60 / DI TO C + 10 / DI,B - 75 / DI TO C + 10 / DI,B - 64 / DI
910 GOTO 1540
920 HPLOT C + 5 / DI,B - 30 / DI TO C,B - 25 / DI TO C - 5 / DI,B - 30 / DI TO C - 15 / DI,B - 5 / DI TO C - 10 / DI,B TO C + 10 / DI,B TO C + 15 / DI,B - 5 / DI
930 HPLOT TO C + 20 / DI,B - 5 / DI TO C + 10 / DI,B TO C + 15 / DI,B - 5 / DI TO C + 5 / DI,B - 30 / DI TO C + 10 / DI,B - 40 / DI TO C + 3 / DI + .5,B - 35 / DI
940 HPLOT TO C - 3 / DI + .5,B - 35 / DI TO C - 10 / DI ,B - 40 / DI TO C - 5 / DI,B - 30 / DI
950 HPLOT C - 5 / DI,B - 33 / DI TO C - 3 / DI + .5,B - 30 / DI: HPLOT C + 5 / DI,B - 33 / DI TO C + 3 / DI + .5,B - 30 / DI: HPLOT C - 5 / DI,B - 20 / DI TO C - 5 / DI,B - 15 / DI
960 HPLOT C + 5 / DI,B - 20 / DI TO C + 5 / DI,B - 15 / DI: HPLOT C - 7 / DI,B - 20 / DI TO C - 7 / DI,B - 15 / DI: HPLOT C + 7 / DI,B - 20 / DI TO C + 7 / DI,B - 15 / DI
970 GOTO 1540
980 HPLOT C,B TO C - 15 / DI,B TO C - 8 / DI,B - 8 / DI TO C - 8 / DI,B - 15 / DI TO C - 15 / DI,B - 23 / DI TO C - 15 / DI,B - 15 / DI TO C - 23 / DI,B - 23 / DI
990 HPLOT TO C - 23 / DI,B - 45 / DI TO C - 15 / DI,B - 53 / DI TO C - 8 / DI,B - 53 / DI TO C - 15 / DI,B - 68 / DI TO C - 8 / DI,B - 75 / DI TO C,B - 75 / DI
1000 HPLOT C,B TO C + 15 / DI,B TO C + 8 / DI,B - 8 / DI TO C + 8 / DI,B - 15 / DI TO C + 15 / DI,B - 23 / DI TO C + 15 / DI,B - 15 / DI TO C + 23 / DI,B - 23 / DI
1010 HPLOT TO C + 23 / DI,B - 45 / DI TO C + 15 / DI,B - 53 / DI TO C + 8 / DI,B - 53 / DI TO C + 15 / DI,B - 68 / DI TO C + 8 / DI,B - 75 / DI TO C,B - 75 / DI
1020 HPLOT C - 15 / DI,B - 68 / DI TO C + 15 / DI,B - 68 / DI: HPLOT C - 8 / DI,B - 53 / DI TO C + 8 / DI,B - 53 / DI: HPLOT C - 23 / DI,B - 15 / DI TO C + 8 / DI,B - 45 / DI
1030 HPLOT C - 8 / DI,B - 68 / DI TO C,B - 60 / DI TO C + 8 / DI,B - 68 / DI TO C + 8 / DI,B - 60 / DI TO C - 8 / DI,B - 60 / DI TO C - 8 / DI ,B - 68 / DI
1040 HPLOT C,B - 38 / DI TO C - 8 / DI,B - 38 / DI TO C + 8 / DI,B - 53 / DI TO C + 8 / DI,B - 45 / DI TO C + 15 / DI,B - 45 / DI TO C,B - 30 / DI TO C,B - 38 / DI
1050 GOTO 1540
1060 HPLOT C - 10 / DI,B - 15 / DI TO C - 10 / DI,B - 30 / DI TO C - 15 / DI,B - 20 / DI TO C - 15 / DI,B - 15 / DI TO C - 15 / DI,B TO C + 15 / DI,B TO C + 15 / DI,B - 15 / DI TO C - 15 / DI,B - 15 / DI
1070 HPLOT C - 15 / DI,B - 10 / DI TO C + 15 / DI,B - 10 / DI: HPLOT C - 15 / DI,B - 5 / DI TO C + 15 / DI,B - 5 / DI
1080 HPLOT C,B - 15 / DI TO C - 5 / DI,B - 20 / DI TO C - 5 / DI,B - 35 / DI TO C + 5 / DI,B - 35 / DI TO C + 5 / DI,B - 20 / DI TO C + 10 / DI,B - 15 / DI
1090 HPLOT C - 5 / DI,B - 20 / DI TO C + 5 / DI,B - 20 / DI: HPLOT C - 5 / DI,B - 25 / DI TO C + 5 / DI,B - 25 / DI: HPLOT C - 5 / DI,B - 30 / DI TO C + 5 / DI,B - 30 / DI
1100 HPLOT C - 10 / DI,B - 35 / DI TO C - 10 / DI,B - 40 / DI TO C - 5 / DI,B - 45 / DI TO C + 5 / DI,B - 45 / DI TO C + 10 / DI,B - 40 / DI TO C + 10 / DI,B - 35 / DI
1110 HPLOT C - 10 / DI,B - 40 / DI TO C,B - 45 / DI TO C + 10 / DI,B - 40 / DI
1120 HPLOT C - 5 / DI,B - 40 / DI TO C + 5 / DI,B - 40 / DI TO C + 15 / DI,B - 30 / DI TO C,B - 40 / DI TO C - 15 / DI,B - 30 / DI TO C - 5 / DI + .5,B - 40 / DI
1130 GOTO 1540
1140 HPLOT C - 20 / DI,79 - YY%(DIS) TO C - 20 / DI,B - 88 / DI TO C - 10 / DI,B - 83 / DI TO C + 10 / DI,B - 83 / DI TO C + 20 / DI,B - 88 / DI TO C + 20 / DI,79 - YY%(DIS) TO C - 20 / DI,79 - YY%(DI)
1150 HPLOT C - 20 / DI,B - 88 / DI TO C - 30 / DI,B - 83 / DI TO C - 30 / DI,B - 78 / DI: HPLOT C + 20 / DI,B - 88 / DI TO C + 30 / DI,B - 83 / DI TO C + 40 / DI,B - 83 / DI
1160 HPLOT C - 15 / DI,B - 86 / DI TO C - 20 / DI,B - 83 / DI TO C - 20 / DI,B - 78 / DI TO C - 30 / DI,B - 73 / DI TO C - 30 / DI,B - 68 / DI TO C - 20 / DI,B - 63 / DI
1170 HPLOT C - 10 / DI,B - 83 / DI TO C - 10 / DI,B - 58 / DI TO C,B - 50 / DI: HPLOT C + 10 / DI,B - 83 / DI TO C + 10 / DI,B - 78 / DI TO C + 20 / DI,B - 73 / DI TO C + 20 / DI,B - 40 / DI
1180 HPLOT C + 15 / DI,B - 85 / DI TO C + 20 / DI,B - 78 / DI TO C + 30 / DI,B - 76 / DI TO C + 30 / DI,B - 60 / DI
1190 HPLOT C,B - 83 / DI TO C,B - 73 / DI TO C + 10 / DI,B - 68 / DI TO C + 10 / DI,B - 63 / DI TO C,B - 58 / DI
1200 GOTO 1540
1210 HPLOT C + 5 / DI + .5,B - 10 / DI TO C - 5 / DI + .5,B - 10 / DI TO C,B - 15 / DI TO C + 10 / DI,B - 20 / DI TO C + 5 / DI + .5,B - 15 / DI TO C + 5 / DI + .5,B - 10 / DI
1220 HPLOT TO C + 7 / DI + .5,B - 6 / DI TO C + 5 / DI + .5,B - 3 / DI TO C - 5 / DI + .5,B - 3 / DI TO C - 7 / DI + .5,B - 6 / DI TO C - 5 / DI + .5,B - 10 / DI
1230 HPLOT C + 2 / DI + .5,B - 3 / DI TO C + 5 / DI + .5,B TO C + 8 / DI ,B: HPLOT C - 2 / DI + .5,B - 3 / DI TO C - 5 / DI + .5,B TO C - 8 / DI,B: HPLOT C + 3 / DI + .5,B - 8 / DI
1240 HPLOT C - 3 / DI + .5,B - 8 / DI: HPLOT C + 3 / DI + .5,B - 5 / DI TO C - 3 / DI + .5,B - 5 / DI
1250 GOTO 1540
1260 HPLOT 139 - 10 / DIS,PER%(DIS,3) TO 139 - 10 / DIS,PER%(DIS,3) - 10 / DIS TO 139 + 10 / DIS,PER%(DIS,3) - 10 / DIS TO 139 + 10 / DIS,PE R%(DIS,3) TO 139 - 10 / DIS,PER%(DIS,3)
1270 HPLOT 139 - 10 / DIS,PER%(DIS,3) - 10 / DIS TO 139 - 5 / DIS,PER%(D IS,3) - 15 / DIS TO 139 + 15 / DIS,PER%(DIS,3) - 15 / DIS TO 139 + 15 / DIS,PER%(DIS,3) - 5 / DIS TO 139 + 10 / DIS,PER%(DIS,3)
1280 HPLOT 139 + 10 / DIS,PER%(DIS,3) - 10 / DIS TO 139 + 15 / DIS,PER%( DIS,3) - 15 / DIS
1290 GOTO 1540
1300 HPLOT C - 14 / DI,B - 46 / DI TO C - 12 / DI,B - 37 / DI TO C - 20 / DI,B - 32 / DI TO C - 30 / DI,B - 32 / DI
1310 HPLOT TO C - 22 / DI,B - 24 / DI TO C - 40 / DI,B - 17 / DI TO C - 40 / DI,B - 7 / DI TO C - 38 / DI ,B - 5 / DI TO C - 40 / DI,B - 3 / DI TO C - 40 / DI,B
1320 HPLOT TO C - 36 / DI,B TO C - 34 / DI,B - 2 / DI TO C - 32 / DI,B TO C - 28 / DI,B TO C - 28 / DI,B - 3 / DI TO C - 30 / DI,B - 5 / DI TO C - 28 / DI,B - 7 / DI TO C - 28 / DI,B - 15 / DI TO C,B - 27 / DI
1330 HPLOT C + 14 / DI,B - 46 / DI TO C + 12 / DI,B - 37 / DI TO C + 20 / DI,B - 32 / DI TO C + 30 / DI,B - 32 / DI
1340 HPLOT TO C + 22 / DI,B - 24 / DI TO C + 40 / DI,B - 17 / DI TO C + 40 / DI,B - 7 / DI TO C + 38 / DI ,B - 5 / DI TO C + 40 / DI,B - 3 / DI TO C + 40 / DI,B
1350 HPLOT TO C + 36 / DI,B TO C + 34 / DI,B - 2 / DI TO C + 32 / DI,B TO C + 28 / DI,B TO C + 28 / DI,B - 3 / DI TO C + 30 / DI,B - 5 / DI TO C + 28 / DI,B - 7 / DI TO C + 28 / DI,B - 15 / DI TO C,B - 27 / DI
1360 HPLOT C + 6 / DI,B - 48 / DI TO C + 38 / DI,B - 41 / DI TO C + 40 / DI,B - 42 / DI TO C + 18 / DI,B - 56 / DI
1370 HPLOT TO C + 12 / DI,B - 56 / DI TO C + 10 / DI,B - 57 / DI TO C + 8 / DI,B - 56 / DI TO C - 8 / DI, B - 56 / DI TO C - 10 / DI,B - 58 / DI TO C + 14 / DI,B - 58 / DI TO C + 16 / DI,B - 59 / DI
1380 HPLOT TO C + 8 / DI,B - 63 / DI TO C + 6 / DI,B - 63 / DI TO C + 2 / DI + .5,B - 70 / DI TO C + 2 / DI + .5,B - 63 / DI
1390 HPLOT TO C - 2 / DI + .5,B - 63 / DI TO C - 2 / DI + .5,B - 70 / DI TO C - 6 / DI,B - 63 / DI TO C - 8 / DI,B - 63 / DI TO C - 16 / DI,B - 59 / DI TO C - 14 / DI,B - 58 / DI
1400 HPLOT TO C - 10 / DI,B - 57 / DI TO C - 12 / DI,B - 56 / DI TO C - 18 / DI,B - 56 / DI TO C - 36 / DI,B - 47 / DI
1410 HPLOT TO C - 36 / DI,B - 39 / DI TO C - 28 / DI,B - 41 / DI TO C - 28 / DI,B - 46 / DI TO C - 20 / DI,B - 50 / DI TO C - 18 / DI,B - 50 / DI TO C - 14 / DI,B - 46 / DI
1420 GOTO 2870
1430 HPLOT C + 6 / DI,B - 60 / DI TO C + 30 / DI,B - 90 / DI TO C + 60 / DI,B - 30 / DI TO C + 60 / DI,B - 10 / DI TO C + 30 / DI,B - 40 / DI TO C + 15 / DI,B - 40 / DI
1440 HPLOT C - 6 / DI,B - 60 / DI TO C - 30 / DI,B - 90 / DI TO C - 60 / DI,B - 30 / DI TO C - 60 / DI,B - 10 / DI TO C - 30 / DI,B - 40 / DI TO C - 15 / DI,B - 40 / DI
1450 HPLOT C,B - 25 / DI TO C + 6 / DI,B - 25 / DI TO C + 10 / DI,B - 20 / DI TO C + 12 / DI,B - 10 / DI TO C + 10 / DI,B - 6 / DI TO C + 10 / DI,B TO C + 14 / DI,B TO C + 15 / DI,B - 5 / DI TO C + 16 / DI,B TO C + 20 / DI,B
1460 HPLOT TO C + 20 / DI,B - 6 / DI TO C + 18 / DI,B - 10 / DI TO C + 18 / DI,B - 20 / DI TO C + 15 / DI,B - 30 / DI TO C + 15 / DI,B - 45 / DI TO C + 40 / DI,B - 60 / DI TO C + 40 / DI,B - 70 / DI
1470 HPLOT TO C + 10 / DI,B - 55 / DI TO C + 6 / DI,B - 60 / DI TO C + 10 / DI,B - 74 / DI TO C + 6 / DI,B - 80 / DI TO C + 4 / DI + .5,B - 80 / DI TO C + 3 / DI + .5,B - 82 / DI TO C + 2 / DI + .5,B - 80 / DI TO C,B - 80 / DI
1480 HPLOT C,B - 25 / DI TO C - 6 / DI,B - 25 / DI TO C - 10 / DI,B - 20 / DI TO C - 12 / DI,B - 10 / DI TO C - 10 / DI,B - 6 / DI TO C - 10 / DI,B TO C - 14 / DI,B TO C - 15 / DI,B - 5 / DI TO C - 16 / DI,B TO C - 20 / DI,B
1490 HPLOT TO C - 20 / DI,B - 6 / DI TO C - 18 / DI,B - 10 / DI TO C - 18 / DI,B - 20 / DI TO C - 15 / DI,B - 30 / DI TO C - 15 / DI,B - 45 / DI TO C - 40 / DI,B - 60 / DI TO C - 40 / DI,B - 70 / DI
1500 HPLOT TO C - 10 / DI,B - 55 / DI TO C - 6 / DI,B - 60 / DI TO C - 10 / DI,B - 74 / DI TO C - 6 / DI,B - 80 / DI TO C - 4 / DI + .5,B - 80 / DI TO C - 3 / DI + .5,B - 82 / DI TO C - 2 / DI + .5,B - 80 / DI TO C,B - 80 / DI
1510 HPLOT C - 6 / DI,B - 25 / DI TO C,B - 6 / DI TO C + 10 / DI,B TO C + 4 / DI + .5,B - 8 / DI TO C + 6 / DI,B - 25 / DI: HPLOT C - 40 / DI, B - 64 / DI TO C - 40 / DI,B - 90 / DI TO C - 52 / DI,B - 80 / DI TO C - 52 / DI,B - 40 / DI
1520 HPLOT C + 40 / DI,B - 86 / DI TO C + 38 / DI,B - 92 / DI TO C + 42 / DI,B - 92 / DI TO C + 40 / DI,B - 86 / DI TO C + 40 / DI,B - 50 / DI
1530 HPLOT C + 4 / DI + .5,B - 70 / DI TO C + 6 / DI,B - 74 / DI: HPLOT C - 4 / DI + .5,B - 70 / DI TO C - 6 / DI,B - 74 / DI: HPLOT C,B - 64 / DI TO C,B - 60 / DI: GOTO 1540
1540 IF EN = 1 THEN EN = 0: RETURN
1550 DIS = DIS + 1: GOTO 460
1560 ZZ = RND ( - ABS (LN) - TX * 10 - TY * 1000 + INOUT * 31.4)
1570 FOR X = 1 TO 9: FOR Y = 1 TO 9:DNG%(X,Y) = 0: NEXT : NEXT
1580 FOR X = 0 TO 10:DNG%(X,0) = 1:DNG%(X,10) = 1:DNG%(0,X) = 1:DNG%(10, X) = 1: NEXT
1590 FOR X = 2 TO 8 STEP 2: FOR Y = 1 TO 9:DNG%(X,Y) = 1:DNG(Y,X) = 1: NEXT : NEXT
1600 FOR X = 2 TO 8 STEP 2: FOR Y = 1 TO 9 STEP 2
1610 IF RND (1) > .95 THEN DNG%(X,Y) = 2
1620 IF RND (1) > .95 THEN DNG%(Y,X) = 2
1630 IF RND (1) > .6 THEN DNG%(Y,X) = 3
1640 IF RND (1) > .6 THEN DNG%(X,Y) = 3
1650 IF RND (1) > .6 THEN DNG%(X,Y) = 4
1660 IF RND (1) > .6 THEN DNG%(Y,X) = 4
1670 IF RND (1) > .97 THEN DNG%(Y,X) = 9
1680 IF RND (1) > .97 THEN DNG%(X,Y) = 9
1690 IF RND (1) > .94 THEN DNG%(X,Y) = 5
1700 IF RND (1) > .94 THEN DNG%(Y,X) = 5
1710 NEXT : NEXT
1720 DNG%(2,1) = 0: IF INOUT / 2 = INT (INOUT / 2) THEN DNG%(7,3) = 7:DN G%(3,7) = 8
1730 IF INOUT / 2 < > INT (INOUT / 2) THEN DNG%(7,3) = 8:DNG%(3,7) = 7
1740 IF INOUT = 1 THEN DNG%(1,1) = 8:DNG%(7,3) = 0
1750 GOSUB 2760
1760 RETURN
1770 VTAB (24): PRINT "COMMAND? ";: CALL - 868
1780 X = PEEK ( - 16384): IF X < 128 THEN 1780
1790 Q = FRE (0)
1800 POKE - 16368,0
1810 IF X = 141 THEN ON SGN (INOUT) + 1 GOTO 2000,2020
1820 IF X = 149 THEN ON SGN (INOUT) + 1 GOTO 2090,2110
1830 IF X = 136 THEN ON SGN (INOUT) + 1 GOTO 2140,2160
1840 IF X = 175 THEN ON SGN (INOUT) + 1 GOTO 2190,2210
1850 IF X = 216 THEN ON SGN (INOUT) + 1 GOTO 2220,2260
1860 IF X = 193 OR X = 155 THEN ON SGN (INOUT) + 1 GOTO 2350,2360
1870 IF X = 160 THEN PRINT "PASS": GOTO 1920
1880 IF X = 211 THEN 2750
1890 IF X = 208 THEN IF PA = 1 THEN PA = 0: PRINT "PAUSE OFF": GOTO 1770
1900 IF X = 208 THEN IF PA = 0 THEN PA = 1: PRINT "PAUSE ON": GOTO 1770
1910 PRINT "HUH?": GOTO 1770
1920 PW(0) = PW(0) - 1 + SGN (INOUT) * .9: IF PW(0) < 0 THEN C(0) = 0: PRINT : PRINT "YOU HAVE STARVED!!!!!": GOTO 1950
1930 POKE 33,40: VTAB (22): HTAB (30): PRINT "FOOD=";PW(0);: CALL - 868: VTAB (23): HTAB (30): PRINT "H.P.=";C(0);: CALL - 868: VTAB (24) : HTAB (30): PRINT "GOLD=";C(5);: CALL - 868: POKE 33,29: HTAB (1)
1940 PW(0) = INT (PW(0) * 10) / 10
1950 IF C(0) < = 0 THEN 3230
1960 IF IN > 0 THEN GOSUB 2920: IF C(0) < = 0 THEN 1950
1970 POKE 33,40: VTAB (22): HTAB (30): PRINT "FOOD=";PW(0);: CALL - 868: VTAB (23): HTAB (30): PRINT "H.P.=";C(0);: CALL - 868: VTAB (24) : HTAB (30): PRINT "GOLD=";C(5);: CALL - 868: POKE 33,29: HTAB (1)
1980 IF INOUT = 0 THEN GOSUB 310: GOTO 1770
1990 IF INOUT > 0 THEN GOSUB 450: GOTO 1770
2000 PRINT "NORTH": IF TER%(TX,TY - 1) = 1 THEN PRINT "YOU CAN'T PASS THE MOUNTAINS": GOTO 1920
2010 TY = TY - 1: GOTO 1920
2020 IF DNG%(PX + DX,PY + DY) < > 1 AND DNG%(PX + DX,PY + DY) < 10 THEN PX = PX + DX:PY = PY + DY
2030 PRINT "FORWARD"
2040 IF DNG%(PX,PY) = 2 THEN PRINT "AAARRRGGGHHH!!! A TRAP!":C(0)= C( 0) - INT ( RND (1) * INOUT + 3):MR = 1:INOUT = INOUT + 1: PRINT "FA LLING TO LEVEL ";IN: GOSUB 1560: GOTO 1920
2050 Z = 0
2060 IF DNG%(PX,PY) = 5 THEN DNG%(PX,PY) = 0: PRINT "GOLD!!!!!":Z = INT ( RND (1) * 5 * INOUT + INOUT): PRINT Z;"-PIECES OF EIGHT":C(5) = C( 5) + Z
2070 IF Z > 0 THEN Z = INT ( RND (1) * 6): PRINT "AND A ";W$(Z):PW(Z) = PW(Z) + 1: GOTO 1920
2080 GOTO 1920
2090 PRINT "EAST": IF TER%(TX + 1,TY) = 1 THEN PRINT "YOU CAN'T PASS T HE MOUNTAINS": GOTO 1920
2100 TX = TX + 1: GOTO 1920
2110 PRINT "TURN RIGHT"
2120 IF DX < > 0 THEN DY = DX:DX = 0: GOTO 1920
2130 DX = - DY:DY = 0: GOTO 1920
2140 PRINT "WEST": IF TER%(TX - 1,TY) = 1 THEN PRINT "YOU CAN'T PASS T HE MOUNTAINS": GOTO 1920
2150 TX = TX - 1: GOTO 1920
2160 PRINT "TURN LEFT"
2170 IF DX < > 0 THEN DY = - DX:DX = 0: GOTO 1920
2180 DX = DY:DY = 0: GOTO 1920
2190 PRINT "SOUTH": IF TER%(TX,TY + 1) = 1 THEN PRINT "YOU CAN'T PASS THE MOUNTAINS": GOTO 1920
2200 TY = TY + 1: GOTO 1920
2210 PRINT "TURN AROUND":DX = - DX:DY = - DY: GOTO 1920
2220 IF TE%(TX,TY) = 3 THEN GOSUB 3710: GOSUB 3800: GOTO 1920
2230 IF TE%(TX,TY) = 4 AND INOUT = 0 THEN PRINT "GO DUNGEON": PRINT "P LEASE WAIT ":INOUT = 1: GOSUB 1560:DX = 1:DY = 0:PX = 1:PY = 1: GOTO 1920
2240 IF TE%(TX,TY) = 5 THEN 3320
2250 PRINT "HUH?": GOTO 1770
2260 IF DNG%(PX,PY) < > 7 AND DNG%(PX,PY) < > 9 THEN 2290
2270 PRINT "GO DOWN TO LEVEL ";INOUT + 1
2280 INOUT = INOUT + 1: GOSUB 1560:MR = 1: GOTO 1920
2290 IF DNG%(PX,PY) < > 8 THEN PRINT "HUH?": GOTO 1920
2300 IF IN = 1 THEN PRINT "LEAVE DUNGEON":IN = 0: GOTO 2330
2310 PRINT "GO UP TO LEVEL ";INOUT - 1
2320 INOUT = INOUT - 1: GOSUB 1560:MR = 1
2330 IF IN = 0 THEN PRINT "THOU HAST GAINED": PRINT LK;" HIT POINTS":C (0) = C(0) + LK:LK = 0
2340 GOTO 1920
2350 GOTO 1920
2360 MN = 0:DAM = 0: PRINT "ATTACK": PRINT "WHICH WEAPON ";: GET Q$
2370 IF Q$ = "R" THEN DAM = 10: PRINT "RAPIER": IF PW(1) < 1 THEN PRINT "NOT OWNED": GOTO 2360
2380 IF Q$ = "A" THEN DAM = 5: PRINT "AXE": IF PW(2) < 1 THEN PRINT "N OT OWNED": GOTO 2360
2390 IF Q$ = "S" THEN DAM = 1: PRINT "SHIELD": IF PW(3) < 1 THEN PRINT "NOT OWNED": GOTO 2360
2400 IF Q$ = "B" THEN DAM = 4: PRINT "BOW": IF PW(4) < 1 THEN PRINT "N OT OWNED": GOTO 2360
2410 IF Q$ = "M" THEN PRINT "MAGIC AMULET": GOTO 2620
2420 IF Q$ = "B" AND PT$ = "M" THEN PRINT "MAGES CAN'T USE BOWS!": GOTO 2360
2430 IF Q$ = "R" AND PT$ = "M" THEN PRINT "MAGES CAN'T USE RAPIERS!": GOTO 2360
2440 IF DAM = 0 THEN PRINT "HANDS"
2450 IF DAM = 5 OR DAM = 4 THEN 2570
2460 MN = DN%(PX + DX,PY + DY) / 10:MN = INT (MN)
2470 IF MN < 1 OR C(2) - RND (1) * 25 < MN + INOUT THEN PRINT "YOU MI SSED": GOTO 2550
2480 PRINT "HIT!!! "
2490 DAM = RND (1) * DAM + C(1) / 5
2500 MZ%(MN,1) = MZ%( MN,1) - DAM
2510 PRINT M$(MN);"'S HIT POINTS=";MZ%(MN,1)
2520 IF MZ%(MN,1) < 1 THEN PRINT "THOU HAST KILLED A ";M$(MN): PRINT " THOU SHALT RECEIVE":DA = INT (MN + IN): PRINT DA;" PIECES OF EIGHT"
2530 IF MZ%(MN,1) < 1 THEN C(5) = INT (C(5) + DA):DNG%(ML%(MN,0),ML%(MN,1)) = DNG%(ML%(MN,0),ML%(MN,1)) - 10 * MN:MZ%(MN,0) = 0
2540 LK = LK + INT (MN * IN / 2): IF MN = TASK THEN TASK = - TASK
2550 IF PA = 1 THEN PRINT "-CR- TO CONT. ";: INPUT Q$
2560 GOTO 1920
2570 IF DAM = 5 THEN PRINT "TO THROW OR SWING:";: GET Q$: IF Q$ < > " T" THEN PRINT "SWING": GOTO 2460
2580 IF DAM = 5 THEN PRINT "THROW":PW(2) = PW(2) - 1
2590 FOR Y = 1 TO 5: IF PX + DX * Y < 1 OR PX + DX * Y > 9 OR PY + DY * Y > 9 OR PY + DY * Y < 0 THEN 2470
2600 MN = DNG%(PX + DX * Y,PY + DY * Y):MN = INT (MN / 10): IF MN > 0 THEN 2470
2610 NEXT : GOTO 2470
2620 IF PW(5) < 1 THEN PRINT "NONE OWNED": GOTO 2360
2630 IF PT$ = "F" THEN Q = INT ( RND (1) * 4 + 1): GOTO 2660
2640 PRINT "1-LADDER-UP","2-LADDER-DN": PRINT "3-KILL","4-BAD??": PRINT "CHOICE ";: GET Q$:Q = VAL (Q$): PRINT Q: IF Q < 1 OR Q > 4 THEN 2640
2650 IF RND (1) > .75 THEN PRINT "LAST CHARGE ON THIS AMULET!":PW(5) = PW(5) - 1
2660 ON Q GOTO 2670,2680,2690,2700
2670 PRINT "LADDER UP":DNG%(PX,PY) = 8: GOTO 1920
2680 PRINT "LADDER DOWN":DNG%(PX,PY) = 7: GOTO 1920
2690 PRINT "MAGIC ATTACK":DAM = 10 + INOUT: GOTO 2590
2700 ON INT ( RND (1) * 3 + 1) GOTO 2710,2730,2740
2710 PRINT "YOU HAVE BEEN TURNED": PRINT "INTO A TOAD!"
2720 FOR Z2 = 1 TO 4:C(Z2) = 3: NEXT Z2: GOTO 1920
2730 PRINT "YOU HAVE BEEN TURNED": PRINT "INTO A LIZARD MAN": FOR Y = 0 TO 4:C(Y) = INT (C(Y) * 2.5): NEXT : GOTO 1920
2740 PRINT "BACKFIRE":C(0) = C(0) / 2: GOTO 1920
2750 GOSUB 3710: HOME : PRINT "PRESS -CR- TO CONTINUE";: INPUT Q$: TEXT : HOME : GOTO 1920
2760 NM = 0: FOR X = 1 TO 10
2770 MZ%(X,0) = 0:MZ%(X,1) = X + 3 + INOUT
2780 IF X - 2 > INO OR RND (1) > .4 THEN 2860
2790 ML%(X,0) = INT ( RND (1) * 9 + 1):ML%(X,1) = INT ( RND (1) * 9 + 1)
2800 IF DNG%(ML%(X,0),ML%(X,1)) < > 0 THEN 2790
2810 IF ML%(X,0) = PX AND ML%(X,1) = PY THEN 2790
2820 DNG%(ML%(X,0),ML%(X,1)) = X * 10
2830 MZ%(X,0) = 1
2840 NM = NM + 1
2850 MZ%(X,1) = X * 2 + IN * 2 * LP
2860 NEXT : RETURN
2870 HPLOT C - 28 / DI,B - 41 / DI TO C + 30 / DI,B - 55 / DI: HPLOT C + 28 / DI,B - 58 / DI TO C + 22 / DI,B - 56 / DI
2880 HPLOT TO C + 22 / DI,B - 53 / DI TO C + 28 / DI,B - 52 / DI TO C + 34 / DI,B - 54 / DI: HPLOT C + 20 / DI,B - 50 / DI TO C + 26 / DI,B - 47 / DI
2890 HPLOT C + 10 / DI,B - 58 / DI TO C + 10 / DI,B - 61 / DI TO C + 4 / DI,B - 58 / DI: HPLOT C - 10 / DI,B - 58 / DI TO C - 10 / DI,B - 61 / DI
2900 HPLOT TO C - 4 / DI,B - 58 / DI: HPLOT C + 40 / DI,B - 9 / DI TO C + 50 / DI,B - 12 / DI TO C + 40 / DI,B - 7 / DI
2910 HPLOT C - 8 / DI,B - 25 / DI TO C + 6 / DI,B - 7 / DI TO C + 28 / DI,B - 7 / DI TO C + 28 / DI,B - 9 / DI TO C + 20 / DI,B - 9 / DI TO C + 6 / DI,B - 25 / DI: GOTO 1540
2920 FOR MM = 1 TO 10: IF MZ%(MM,0) = 0 THEN 3220
2930 RA = SQR ((PX - ML%(MM,0)) ^ 2 + (PY - ML%(MM,1)) ^ 2)
2940 IF MZ%(MM,1) < IN * LP THEN 2970
2950 IF RA < 1.3 THEN 3120
2960 IF MM = 8 AND RA < 3 THEN 3220
2970 X1 = SGN (PX - ML%(MM,0)):Y1 = SGN (PY - ML%(MM,1))
2980 IF MZ%(MM,1) < IN * LP THEN X1 = - X1:Y1 = - Y1
2990 IF Y1 = 0 THEN 3020
3000 D = DNG%(ML%(MM,0),(ML%(MM,1) + Y1 + .5)): IF D = 1 OR D > 9 OR D = 2 THEN 3020
3010 X1 = 0: GOTO 3040
3020 Y1 = 0: IF X1 = 0 THEN 3040
3030 D = DN%((ML%(MM,0) + X1 + .5),ML%(MM,1)): IF D = 1 OR D > 9 OR D = 2 THEN X1 = 0: GOTO 3080
3040 DNG%(ML%(MM,0),ML%(MM,1)) = DNG%(ML%(MM,0),ML%(MM,1)) - 10 * MM
3050 IF ML%(MM,0) + X1 = PX AND ML%(MM,1) + Y1 = PY THEN 3220
3060 ML%(MM,0) = ML%(MM,0) + X1:ML%(MM,1) = ML%(MM,1) + Y1
3070 DNG%(ML%(MM,0),ML%(MM,1)) = (DNG%(ML%(MM,0),ML%(MM,1)) + 10 * MM + .5)
3080 IF X1 < > 0 OR Y1 < > 0 THEN 3220
3090 IF MZ%(MM,1) < IN * LP AND RA < 1.3 THEN 3120
3100 IF MZ%(MM,1) < IN * LP THEN MZ%(MM,1) = MZ%(MM,1) + MM + IN
3110 GOTO 3220
3120 IF MM = 2 OR MM = 7 THEN 3180
3130 PRINT "YOU ARE BEING ATTACKED": PRINT "BY A ";M$(MM)
3140 IF RND (1) * 20 - SGN (PW(3)) - C(3) + MM + IN < 0 THEN PRINT " MISSED": GOTO 3160
3150 PRINT "HIT":C(0) = C(0) - INT ( RND (1) * MM + IN)
3160 IF PA = 1 THEN PRINT "-CR- TO CONT. ";: INPUT Q$
3170 GOTO 3220
3180 IF RND (1) < .5 THEN 3130
3190 IF MM = 7 THEN PW(0) = INT (PW(0) / 2): PRINT "A GREMLIN STOLE SO ME FOOD": GOTO 3160
3200 ZZ = INT ( RND (1) * 6): IF PW(ZZ) < 1 THEN 3200
3210 PRINT "A THIEF STOLE A ";W$(ZZ):PW(ZZ) = PW(ZZ) - 1: GOTO 3160
3220 NEXT : RETURN
3230 POKE 33,40: PRINT : PRINT : PRINT "    WE MOURN THE PASSING OF "
3240 IF LEN (PN$) > 22 THEN PN$ = ""
3250 IF PN$ = "" THEN PN$ = "THE PEASANT"
3260 PN$ = PN$ + " AND HIS COMPUTER"
3270 HTAB (20 - INT ( LEN (PN$) / 2)): PRINT PN$
3280 PRINT " TO INVOKE A MIRACLE OF RESSURECTION"
3290 PRINT "       <HIT ESC KEY>";
3300 IF PEEK ( - 16384) = 155 THEN 10
3310 GOTO 3300
3320 HOME : TEXT : HOME
3330 CALL 62450
3340 IF PN$ < > "" THEN 3420
3350 PRINT : PRINT : PRINT "   WELCOME PEASANT INTO THE HALLS OF": PRINT "THE MIGHTY LORD BRITISH. HEREIN THOU MAYCHOOSE TO DARE BATTLE WITH THE EVIL": PRINT "CREATURES OF THE DEPTHS, FOR GREAT": PRINT "REWARD !"
3360 PRINT : PRINT "WHAT IS THY NAME PEASANT ";: INPUT PN$
3370 PRINT "DOEST THOU WISH FOR GRAND ADVENTURE ? ";: GET Q$: IF Q$ < > "Y" THEN PRINT : PRINT "THEN LEAVE AND BEGONE!":PN$ = "": PRINT : PRINT "     PRESS -SPACE- TO CONT.";: GET Q$: GOTO 1920
3380 PRINT
3390 PRINT : PRINT "GOOD! THOU SHALT TRY TO BECOME A ": PRINT "KNIGHT!! !": PRINT : PRINT "THY FIRST TASK IS TO GO INTO THE": PRINT "DUNGEON S AND TO RETURN ONLY AFTER": PRINT "KILLING A(N) ";:TASK = INT (C(4 ) / 3): PRINT M$(TASK)
3400 PRINT : PRINT "   GO NOW UPON THIS QUEST, AND MAY": PRINT "LADY LUCK BE FAIR UNTO YOU.....": PRINT ".....ALSO I, BRITISH, HAVE INCRE ASED": PRINT "EACH OF THY ATTRIBUTES BY ONE!"
3410 PRINT : PRINT "     PRESS -SPACE- TO CONT.";: GET Q$: FOR X = 0 TO 5:C(X) = C(X) + 1: NEXT : HOME : GOTO 1920
3420 IF TASK > 0 THEN PRINT : PRINT : PRINT PN$;" WHY HAST THOU RETURN ED?": PRINT "THOU MUST KILL A(N) ";M$(TASK): PRINT "GO NOW AND COMPL ETE THY QUEST!": PRINT : PRINT "     PRESS -SPACE- TO CONT.";: GET Q$: HOME : GOTO 1920
3430 PRINT : PRINT : PRINT : PRINT "AAHH!!.....";PN$: PRINT : PRINT "TH OU HAST ACOMPLISHED THY QUEST!": IF ABS (TASK) = 10 THEN 3460
3440 PRINT "UNFORTUNATELY, THIS IS NOT ENOUGH TO": PRINT "BECOME A KNIG HT.":TASK = ABS (TASK) + 1: PRINT : PRINT "NOW THOU MUST KILL A(N) ";M$(TASK)
3450 GOTO 3400
3460 TEXT : HOME : PRINT : PRINT : PRINT :PN$ = "LORD " + PN$: PRINT "   ";PN$;","
3470 PRINT "    THOU HAST PROVED THYSELF WORTHY": PRINT "OF KNIGHTHO OD, CONTINUE PLAY IF THOU": PRINT "DOTH WISH, BUT THOU HAST ACOMPLIS HED": PRINT "THE MAIN OBJECTIVE OF THIS GAME..."
3480 IF LP = 10 THEN 3510
3490 PRINT : PRINT "  NOW MAYBE THOU ART FOOLHEARTY": PRINT "ENOUGH TO TRY DIFFICULTY LEVEL ";LP + 1
3500 GOTO 3410
3510 PRINT : PRINT "...CALL CALIFORNIA PACIFIC COMPUTER": PRINT "AT (415)-569-9126 TO REPORT THIS": PRINT "AMAZING FEAT!"
3520 GOTO 3410
3530 TEXT : HOME : VTAB (5): INPUT "TYPE THY LUCKY NUMBER.....";Q$:LN = VAL (Q$)
3540 VTAB (7): INPUT "LEVEL OF PLAY (1-10)......";Q$:LP = INT ( VAL ( Q$))
3550 IF LP < 1 OR LP > 10 THEN 3540
3560 ZZ = RND ( - ABS (LN))
3570 DATA  "HIT POINTS.....","STRENGTH.......","DEXTERITY......","STA MINA........","WISDOM.........","GOLD..........."
3580 DIM PW(5)
3590 DIM C$(5): FOR X = 0 TO 5: READ C$(X): NEXT
3600 DIM C(5)
3610 DIM M$(10),ML%(10,1),MZ%(10,1)
3620 DATA    "SKELETON","THIEF","GIANT RAT","ORC","VIPER","CARRION CRAWLER","GREMLIN","MIMIC","DAEMON","BALROG"
3630 FOR X = 1 TO 10: READ M$(X): NEXT
3640 FOR X = 0 TO 5:C(X) = INT ( SQR ( RND (1)) * 21 + 4): NEXT X
3650 HOME : VTAB (8): FOR X = 0 TO 5: PRINT C$(X),C(X): NEXT : PRINT : PRINT "SHALT THOU PLAY WITH THESE QUALITIES?": HTAB (20): GET Q$: IF Q$ < > "Y" THEN 3640
3660 VTAB (15): PRINT : PRINT "AND SHALT THOU BE A FIGHTER OR A MAGE?" : HTAB (20): GET PT$
3670 IF PT$ = "M" OR PT$ = "F" THEN 3690
3680 GOTO 3660
3690 DIM W$(5): DATA  "FOOD","RAPIER","AXE","SHIELD","BOW AND ARROWS ","MAGIC AMULET": FOR X = 0 TO 5: READ W$(X): NEXT
3700 GOSUB 3710: GOSUB 3800: RETURN
3710 TEXT : HOME : PRINT : PRINT : PRINT "   STAT'S       WEA PONS": PRINT : FOR X = 0 TO 5: PRINT C$(X);C(X); TAB( 24);"0-";W$(X) : NEXT : POKE 34,12: HOME : POKE 35,15
3720 VTAB (11): HTAB (18): PRINT "Q-QUIT"
3730 IF PW(0) > 0 THEN CALL 62450
3740 FOR Z = 0 TO 5: VTAB (5 + Z): HTAB (25 - LEN ( STR$ (PW(Z)))): PRINT PW(Z);: NEXT
3750 VTAB (17): HTAB (5): PRINT "PRICE";: HTAB (15): PRINT "DAMAGE";: HTAB (25): PRINT "ITEM"
3760 FOR X = 0 TO 5: VTAB (19 + X): HTAB (25): PRINT W$(X): NEXT
3770 VTAB (19): HTAB (5): PRINT "1 FOR 10": HTAB (15): PRINT "N/A": VTAB (20): HTAB (5): PRINT "8": HTAB (15): PRINT "1-10": VTAB (21): HTAB (5): PRINT "5": HTAB (15): PRINT "1-5"
3780 VTAB (22): HTAB (5): PRINT "6": HTAB (15): PRINT "1": VTAB (23): HTAB (5): PRINT "3": HTAB (15): PRINT "1-4": VTAB (24): HTAB (5): PRINT " 15": HTAB (15): PRINT "?????": HOME
3790 RETURN
3800 HOME : PRINT "WELCOME TO THE ADVENTURE SHOP"
3810 PRINT "WHICH ITEM SHALT THOU BUY ";: GET Q$: IF Q$ = "Q" THEN PRINT : PRINT "BYE": FOR Z = 1 TO 1000: NEXT : TEXT : HOME : RETURN
3820 Z = - 1
3830 IF Q$ = "F" THEN PRINT "FOOD":Z = 0:P = 1
3840 IF Q$ = "R" THEN PRINT "RAPIER":Z = 1:P = 8
3850 IF Q$ = "A" THEN PRINT "AXE":Z = 2:P = 5
3860 IF Q$ = "S" THEN PRINT "SHIELD":Z = 3:P = 6
3870 IF Q$ = "B" THEN PRINT "BOW":Z = 4:P = 3
3880 IF Q$ = "M" THEN PRINT "AMULET":Z = 5:P = 15
3890 IF Z = - 1 THEN PRINT Q$: PRINT "I'M SORRY WE DON'T HAVE THAT." : GOTO 3810
3900 IF Q$ = "R" AND PT$ = "M" THEN PRINT "I'M SORRY MAGES": PRINT "CAN'T USE THAT!": GOTO 3810
3910 IF Q$ = "B" AND PT$ = "M" THEN PRINT "I'M SORRY MAGES": PRINT "CAN'T USE THAT!": GOTO 3810
3920 IF C(5) - P < 0 THEN PRINT "M'LORD THOU CAN NOT AFFORD THAT ITEM.": GOTO 3810
3930 IF Z = 0 THEN PW(Z) = PW(Z) + 9
3940 PW(Z) = PW(Z) + 1:C(5) = C(5) - P
3950 VTAB (10): HTAB (16): PRINT C(5);" "
3960 VTAB (5 + Z): HTAB (25 - LEN ( STR$ (PW(Z)))): PRINT PW(Z);: HTAB (1): VTAB (14): PRINT
3970 GOTO 3810