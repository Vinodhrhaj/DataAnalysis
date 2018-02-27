libname collib "V:/SAS Programming for Business Analytics/Week8";

DATA COLLEGE;
SET "V:/SAS Programming for Business Analytics/Week7/college.sas7bdat";
RUN;


PROC FORMAT;
VALUE RESULT
0-50 = 'BOTTOM HALF'
51-74 = '3RD QUARTILE'
75-100 = 'TOP QUARTER';
RUN;

proc print data=college;
run;
