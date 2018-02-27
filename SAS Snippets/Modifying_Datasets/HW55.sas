libname week5 'V:/SAS Programming for Business Analytics/Week5';

DATA week5.bread;
infile "V:/SAS Programming for Business Analytics/Week2/bread.txt" delimiter=',' firstobs=3;
input doughtype $ water oil sugar salt drymilk flour yeast wheat oregano eggs;
run;

data week5.eggless;
set week5.bread;
if eggs=0;
proc print data=week5.eggless;
run;

