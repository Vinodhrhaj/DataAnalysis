
DATA OLDMISS;
   INPUT A B C X1-X3 Y1-Y3;
  DATALINES;
1 2 3 4 5 6 7 8 9
999 4 999 999 5 999 777 7 7
;


DATA new1;
   INPUT A B C X1-X3 Y1-Y3;
 array r[9] A -- Y3;
   do i = 1 to 9;
   IF r[i]=999 then r[i]=.;
    END;
	drop i;
DATALINES;
1 2 3 4 5 6 7 8 9
999 4 999 999 5 999 777 7 7
;

proc print data=oldmiss;
run;

DATA NEW2;
   SET oldmiss;
   ARRAY JUNK[*] A--Y3;
   DO j= 1 TO DIM (JUNK) ;
      IF JUNK[j] = 999 THEN JUNK[j] = .;
   END;
   DROP j;
RUN;

proc print data=new2;
run;
