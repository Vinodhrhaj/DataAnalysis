data prob2;
 length group $ 1;
 input X Y Z Group $;
 datalines;
 2 4 6 A
 3 3 3 B
 1 3 7 A
 7 5 3 B
 1 1 5 B
 2 2 4 A
 5 5 6 A
 ;
run;

PROC GCHART data=prob2;
vbar Group;
run;

Proc plot data=prob2;
plot Y*X;
run;
quit;

proc sort data=prob2;
by group;
run;

proc print data=prob2;
run;

Proc plot data=prob2;
plot Y*X;
by group;
run;
quit;
