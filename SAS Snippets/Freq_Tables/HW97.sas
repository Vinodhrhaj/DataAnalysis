data blood;
set "V:/SAS Programming for Business Analytics/Week4/blood.sas7bdat";
run;

proc format;
value cholgroup low-200 = 'Normal' 201-high = 'High' . = 'Missing';
run;


title "Proc freq - With MISSING Option";
proc freq data=blood;
tables Chol / nocum missing;
format Chol cholgroup.;
run;

title "Proc freq - Without MISSING Option";
proc freq data=blood;
tables Chol / nocum;
format Chol cholgroup.;
run;