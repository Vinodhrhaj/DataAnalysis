DATA Bread;
INFILE "V:/SAS Programming for Business Analytics/Week2/bread.txt" dlm=',' firstobs=3;
INPUT dough $ water  oil  sugar  salt  dry_milk  flour  yeast  wheat  oregano  eggs;
RUN;

DATA Bread1;
INPUT dough $ water  oil  sugar  salt  dry_milk  flour  yeast  wheat  oregano  eggs;
DATALINES;
NewRec 1 2 2 1.5 0 . 2.25 0 0 0
;
RUN;

DATA New_Bread;
SET Bread Bread1;
RUN;

title "The details of the combined dataset";
PROC PRINT DATA=NEW_Bread;
RUN;

title "regression model";
PROC REG DATA=New_Bread;
MODEL flour=water oil sugar salt yeast;
OUTPUT OUT=Final_bread PREDICTED=flour_estimate;
RUN;

title "The details of the final bread";
PROC PRINT DATA = Final_bread;
VAR dough water oil sugar salt yeast flour flour_estimate;
RUN;
