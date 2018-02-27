DATA grades;
INFILE "V:/SAS Programming for Business Analytics/Week7/grades.txt";
INPUT student $ 1-4 scores $ 6-18;
RUN;

title "The details of the grades data set";
PROC PRINT DATA=grades;
RUN;

DATA GRADES_NEW;
SET grades;
Group6= 0;
Group7= 0;
DO
i = 1 TO 13;
IF i = 7 THEN
Group6= Group6 + INT(substr(scores,i,1));
ELSE
Group7= Group7 + INT(substr(scores,i,1));
END;
DROP i;
RUN;

title "The details of the new grades dataset";
proc print data=grades_new;
run;

title "Correlation between both the groups";
PROC CORR DATA = grades_new;
VAR Group6;
WITH Group7;
RUN;
