data exam;
infile "V:/SAS Programming for Business Analytics/Week6/test.txt" firstobs=2 dlm ='09'x ;
input ID :$3. TEST1 - TEST5 ;
RUN;

data result;
set exam;
ARRAY SCORE[5] TEST1 -TEST5;
ARRAY PASS[5] _TEMPORARY_ (65, 70, 60, 62, 68);
PASSCOUNT=0;
DO i=1 to 5;
if score[i]>pass[i] then
PASSCOUNT +1;
END;
DROP i;
run;

proc print data=result;
title 'Exam Results';
run;
