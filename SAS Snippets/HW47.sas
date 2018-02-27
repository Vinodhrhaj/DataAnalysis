/*Sepal width ordered*/
data iris; 
infile "V:/SAS Programming for Business Analytics/Week4/iris.txt";
input CLASS $11. SL SW PL PW;
label CLASS='Class' SL='SepalLength' SW='SepalWidth' PL= 'PetalLength' PW= 'PetalWidth';
proc SORT DATA=iris;
by descending sw ;
run;
PROC PRINT data=iris (firstobs=1 obs=50)label;
run; 
