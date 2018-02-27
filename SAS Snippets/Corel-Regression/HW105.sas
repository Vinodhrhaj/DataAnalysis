title "Plot of Y versus X";
PROC PLOT DATA=corrcoeff;
   PLOT Y*X;
RUN;

SYMBOL VALUE=DOT COLOR=BLACK I=RL;
PROC GPLOT DATA=corrcoeff;
   TITLE "Regression line and original data on the same axes";
   PLOT Y*X;
RUN;
