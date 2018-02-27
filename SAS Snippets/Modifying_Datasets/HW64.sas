DATA FROG;
   INPUT ID X1-X5 Y1-Y5;
DATALINES;
01   4   5   4   7   3   1   7   3   6   8
02   8   7   8   6   7   5   4   3   5   6
;


data Toad;
set FROG;
ARRAY EX[5] X1-X5;
ARRAY WY[5] Y1-Y5;
DO i=1 TO 5;
	Time = i;
	X=EX[i];
	Y=WY[i];
	output;
end;
run;


PROC PRINT DATA=toad;
title 'Output Transposed with Time';
var Time X Y;
RUN;
