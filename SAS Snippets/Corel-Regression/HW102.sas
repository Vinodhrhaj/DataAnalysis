DATA PatientsBP;
INPUT AGE SBP;
DATALINES;
15 116
20 120
25 130
30 132
40 150
50 148
;

TITLE "Patients Blood Pressure data";
PROC PRINT DATA=PatientsBP;
RUN;

title "Correlation between SBP and AGE";
PROC CORR DATA=PatientsBP;
VAR AGE SBP;
RUN;
