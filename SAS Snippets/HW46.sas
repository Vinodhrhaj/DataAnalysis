DATA hanks;
infile "V:/SAS Programming for Business Analytics/Week4/hanks.txt"
dsd firstobs=2;
input Title   :$25.  Year 26-29  Length 34-36 MPAA $ Action 50-51
Drama   58-59 Humor   66-67 Sex     74-75 Violence 82-83 Suspense 90-91 Offbeat ;
run;
proc format;/* Create Rating format with values*/
 value $Rating 'G' = 'Suitable' 
 			'PG -13'= 'Questionable'
			'PG' = 'Questionable' 
			'R' = 'Not Suitable' ;
Proc sort data=hanks;/*Sort dataset by year*/
by Year;
run; 
proc print data=hanks;
var Title Year MPAA;
format  MPAA $Rating.;
title hanks;
run;