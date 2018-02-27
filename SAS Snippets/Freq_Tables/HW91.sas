DATA Student;
   INPUT ID AGE GENDER $ GPA CSCORE;
DATALINES;
1 18 M 3.7 650
2 18 F 2.0 490
3 19 F 3.3 580
4 23 M 2.8 530
5 21 M 3.5 640
;

title "Student Information";
PROC PRINT DATA=Student;
RUN;


title "The mean grade point average and mean college entrance exam score";
PROC MEANS DATA=Student MEAN;
VAR GPA CSCORE;
RUN;


DATA S_Index;
SET Student;
INDEX = GPA + 3*CSCORE/500;
RUN;

title "Index for each subject (INDEX = GPA + 3*CSCORE/500)";
PROC PRINT DATA=S_Index;
RUN;