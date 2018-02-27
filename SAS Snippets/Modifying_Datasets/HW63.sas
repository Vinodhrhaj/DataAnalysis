DATA SPEED;
   INPUT X1-X5 Y1-Y3;
DATALINES;
1 2 3 4 5 6 7 8
11 22 33 44 55 66 77 88
;
DATA SPEED2;
set speed;
  * INPUT X1-X5 Y1-Y3;
 array X[5];
 array Y[3];
  array LX[5] LX1-LX5;
   ARRAY SY[3] SY1-SY3;
    do i = 1 to 5;
    do j = 1 to 3;
 LX[i] = log(X[i]);
 SY[j] =sqrt(Y[j]);
 end;
 end;
 drop i j;
 run;

proc print data=speed2;
title 'Additional variables with natural log and square root';
run;
