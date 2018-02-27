
libname libtest 'V:\SAS Programming for Business Analytics\Week4\';
options fmtsearch=(libtest);

proc format library=libtest;
value YESNO 	1='Yes' 0='No';
value $YESNO 	Y='Yes'	N='No';
value $Gender  	M='Male'F='Female';
value Age20yr	low-20 = 1 
				21-40=2 
				41-60=3 
				61-80=4
				81-high=5.;
run;

proc format library=libtest fmtlib;
run;


