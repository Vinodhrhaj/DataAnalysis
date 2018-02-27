data college;
set "V:/SAS Programming for Business Analytics/Week7/college.sas7bdat";
run;

proc format;
value rankgroup low-70  = 'Low to 70' 71-high = '71 and higher';
run; 


title "Two way table of Scholarship by ClassRank";
proc freq data=college;   
tables Scholarship*ClassRank;   
format ClassRank rankgroup. ;
run;