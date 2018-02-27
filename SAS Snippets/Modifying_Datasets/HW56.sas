Data clinton1;
INFILE 'V:/SAS Programming for Business Analytics/Week2/clinton.txt' firstobs=2;
input day month $ year approve disapprove no_opinion;
If month= 'Jan' then month1= '1';
If month= 'Feb' then month1= '2';
If month= 'Mar' then month1= '3';
If month= 'Apr' then month1= '4';
If month= 'May' then month1= '5';
If month= 'Jun' then month1= '6';
If month= 'Jul' then month1= '7';
If month= 'Aug' then month1= '8';
If month= 'Sep' then month1= '9';
If month= 'Oct' then month1= '10';
If month= 'Nov' then month1= '11';
If month= 'Dec' then month1= '12';
Date=MDY(month1, Day, Year);
format date mmddyy8.;
run;

data clinton2;
infile datalines expandtabs;
input date mmddyy8. approve disapprove no_opinion;
datalines;
8-18-98		66		29		5
8-20-98		61		34		5
8-21-98		62		35		3
9-1-98		62		33		5
9-10-98		60		37		3
9-11-98		63		34		3 
;
run;

data clinton3;
set clinton1 clinton2;
run;

proc sort data=clinton3 out=result;
by descending Date;
run;

proc print data=result;
format Date mmddyy8.;
var Date approve disapprove no_opinion;
Title 'Clinton Approval Disapproval Summary';
run;





