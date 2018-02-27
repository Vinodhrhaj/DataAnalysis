DATA logcorrel;
   INPUT X Y Z;
   LX = LOG(X);
   LY = LOG(Y);
   LZ = LOG(Z);
DATALINES;
1 3 15
7 13 7
8 12 5
3 4 14
4 7 10
;


title "Correlation Matrix of the logarithms ";
PROC CORR DATA=logcorrel;
   VAR LX LY LZ;
RUN;


