Data Blood;
Set "V:/SAS Programming for Business Analytics/Week4/blood.sas7bdat";
run;


TITLE "One-way frequencies for the variables gender, bloodtype and agegroup";
proc freq data=blood;
tables gender bloodtype agegroup/ nocum nopercent;
run;