data rline; 
input x y z; 
datalines; 
1 3 15 
7 13 7 
8 12 5 
3 4 14 
4 7 10 
;

proc print data=rline;
run;

title "Regression models";
PROC REG DATA=rline;
MODEL Y = X;
RUN;
