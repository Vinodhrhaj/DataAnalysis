DATA IRIS;
INFILE "V:/SAS Programming for Business Analytics/Week4/iris.txt" FIRSTOBS=2;
INPUT flower $ SL SW PL PW;
RUN;

title "Correlation of sepal lenght sepal width petal length petal width";
PROC CORR DATA=IRIS;
VAR SL SW PL PW;
RUN;


title "Average metrics";
PROC UNIVARIATE DATA=IRIS NOPRINT;
VAR SL SW PL PW;
CLASS flower;
OUTPUT OUT=IRISAVGS MEAN=AVG_SL AVG_SW AVG_PL AVG_PW;
RUN;


DATA IRIS_Output;
Set IRISAVGS;
RUN;


title "Average Metrics Output";
PROC PRINT DATA=IRIS_Output;
RUN;


title "Correlation of averages";
PROC CORR DATA=IRIS_Output;
VAR AVG_SL AVG_SW AVG_PL AVG_PW;
RUN;
