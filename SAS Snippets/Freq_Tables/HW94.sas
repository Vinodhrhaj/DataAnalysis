DATA LIVER;
   INPUT SUBJ DOSE REACT LIVER_WT SPLEEN;
DATALINES;
1   1  5.4  10.2  8.9
2   1  5.9   9.8  7.3
3   1  4.8  12.2  9.1
4   1  6.9  11.8  8.8
5   1 15.8  10.9  9.0
6   2  4.9  13.8  6.6
7   2  5.0  12.0  7.9
8   2  6.7  10.5  8.0
9   2 18.2  11.9  6.9
10  2  5.5   9.9  9.1
;

*Printing the data set of Liver;
TITLE "LIVER Data Set";
PROC PRINT DATA=LIVER;
RUN;

*Applying proc univariate with normal plot for all the subjects;
TITLE "Distributions - Liver Data";
PROC UNIVARIATE DATA=LIVER NORMAL PLOT;
   VAR REACT LIVER_WT SPLEEN;
   HISTOGRAM REACT LIVER_WT SPLEEN /NORMAL;
RUN;

*Applying proc univariate with normal plot for all the subjects by dose;
TITLE "Distributions by Dose - Liver Data";
PROC UNIVARIATE DATA=LIVER NORMAL PLOT;
   VAR REACT LIVER_WT SPLEEN;
   HISTOGRAM REACT LIVER_WT SPLEEN /NORMAL;
   BY DOSE;
RUN;
