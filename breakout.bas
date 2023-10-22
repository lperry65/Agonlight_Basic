   10 REM BREAKOUT
   20 MODE 7
   30 PRINT TAB(10,10);CHR$(141);"Breakout"
   40 PRINT TAB(10);CHR$(141);"Breakout"
   50 A=INKEY(100)
   60 MODE 2
   70 DIM P(7,18)
   80 FOR A=1 TO 7
   90   FOR B=1 TO 18
  100     P(A,B)=1
  110     NEXT B,A
  120 VDU 23;8202;0;0;0;
  130 VDU 23,244,0,254,254,254,254,254,254,254
  140 VDU 23,245,255,255,255,255,0,0,0,0
  150 VDU 23,246,255,255,255,255,255,255,255,255
  160 COLOUR 2
  170 FOR A=1 TO 20
  180   PRINT CHR$(246);
  190   NEXT
  200 FOR A=1 TO 19
  210   PRINT CHR$(246);SPC(18);CHR$(246);
  220   NEXT A
  230 FOR A=1 TO 7
  240   COLOUR A
  250   FOR B=1 TO 18
  260     PRINT TAB(B,A+2);CHR$(244);
  270     NEXT B
  280   NEXT A
  290 Y=19:X=RND(18)
  300 B=9
  310 XI=1
  320 YI=-1
  330 Q=0
  340 C=1 
  350 PRINT TAB(B,19);CHR$(245);CHR$(245);CHR$(245)
  360 PRINT TAB(X,Y);"O"
  370 R=X
  380 S=Y
  390 N=B
  400 X=X+XI
  410 Y=Y+YI
  420 IF Y<0 THEN YI=-YI
  430 IF Y=19 AND ( B-1=X OR B=X OR B+1=X OR B+2=X OR B+3=X) THEN YI=-YI:Y=18
  440 IF Y>20 THEN PROC_LOST
  450 IF X<2 OR X>17 THEN XI=-XI:GOTO 400
  460 IF Y=1 THEN YI=-YI:GOTO 400
  470 IF Y>2 AND Y<9 THEN PROC_CHECK
  480 PRINT TAB(0,25);"Score ";Q
  490 PRINT "Ball ";C
  500 B=B+INKEY(-98)-INKEY(-83)
  510 IF B<1 THEN B=1
  520 IF B>16 THEN B=16
  530 PRINT TAB(R,S);" "
  540 PRINT TAB(N,19);"   "
  550 GOTO 350
  560 DEF PROC_CHECK
  570   A=Y-2
  580   IF P(A,X)=0 THEN ENDPROC
  590   P=9-Y
  600   P(A,X)=0
  610   SOUND 1,-15,50*P,5
  620   Q=Q+P*10
  630   YI=-YI
  640   ENDPROC
  650 DEF PROC_LOST
  660   SOUND 0,-15,2,5
  670   C=C+1
  680   IF C<11 THEN Y=19:X=RND(18):YI=-1:FOR D=1 TO 1000:NEXT D:ENDPROC
  690   CLG
  700   PRINT "Score ";Q
  710   *FX 15,1
  720   PRINT "Another Go?":A$=GET$
  730   IF LEFT$(A$,1)="Y" THEN RUN ELSE END
  740   ENDPROC
