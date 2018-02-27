data corrcoeff; 
input x y z; 
datalines; 
1 3 15 
7 13 7 
8 12 5 
3 4 14 
4 7 10 
;
title "The details of the data set";
proc print data=corrcoeff;
run;

title "x correlation with y and z";
PROC CORR DATA=corrcoeff;   
   VAR X;                   
   WITH Y Z;
RUN;

title "Correlation matrix";
PROC CORR DATA=corrcoeff;   
VAR X Y Z;
RUN;