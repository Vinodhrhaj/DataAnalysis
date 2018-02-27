libname thanksTA v9 "V:/SAS Programming for Business Analytics/Week7";
DATA COLLEGE;
SET thanksTA.college;
Options fmtsearch=(thanksTA);
PROC MEANS DATA=COLLEGE N NMISS MEAN MEDIAN MIN MAX MAXDEC=2;
VAR CLASSRANK GPA;
RUN;