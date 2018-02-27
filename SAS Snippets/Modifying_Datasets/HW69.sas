DATA hw6ryan;
infile "V:/SAS Programming for Business Analytics/Week4/ryan.txt" firstobs=2 dlm='09'x;
input TITLE :$25. ROGER NYTIMES USAT :;
array RATING[3] ROGER NYTIMES USAT;
do i = 1 to 3;
if RATING[i] = '.' then RATING[i] = '5';
	end;
run;

proc print data=hw6ryan;
title 'ryans list';
run;