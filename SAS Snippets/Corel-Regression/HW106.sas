DATA HOSPITALDATA;
   INPUT COUNTY POP HOSPITAL FIRE_CO RURAL $;
DATALINES;
1   35   1   2   YES
2   88   5   8   NO
3    5   0   1   YES
4   55   3   3   YES
5   75   4   5   NO
6  125   5   8   NO
7  225   7   9   YES
8  500  10  11   NO
;
title "a) The details of hospital data";
PROC PRINT DATA=hospitaldata;
RUN;

Title "b) Checking the distributions for the variables POP, HOSPITAL and FIRE_CO";
PROC UNIVARIATE DATA=hospitaldata NORMAL PLOT;
VAR POP HOSPITAL FIRE_CO;
RUN;

title "c) Pearson and Spearman Correlation matrix for the variables";
PROC CORR DATA=hospitaldata NOSIMPLE PEARSON SPEARMAN;
VAR POP HOSPITAL FIRE_CO;
RUN;

PROC FORMAT;
   VALUE POP LOW-81  = 'Below median' 
             82-HIGH = 'Above Median';
   VALUE HOSPITAL LOW-4  = 'Below Median' 
                  5-HIGH = 'Above Median';
   VALUE FIRE_CO LOW-6  = 'Below Median' 
                 7-HIGH = 'Above Median';
RUN;

TITLE "d) Computing crosstabulations between the variable RURAL and the recoded variables";
PROC FREQ DATA=hospitaldata;
FORMAT POP POP. HOSPITAL HOSPITAL. FIRE_CO FIRE_CO.;
TABLES RURAL*(POP HOSPITAL FIRE_CO) / CHISQ;
RUN;
