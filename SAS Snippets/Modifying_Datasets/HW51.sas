DATA cats1;
infile "V:/SAS Programming for Business Analytics/Week4/cats1.txt" ;
input Name $ Side $ @@;
run;

DATA CATS2;
infile "V:/SAS Programming for Business Analytics/Week4/cats2.txt" firstobs=2;
input Name$ @9 Side$ LWeek0 LWeek1 LWeek2 ;
run;

data cats3;
infile "V:/SAS Programming for Business Analytics/Week2/cats3.txt" firstobs=2;
input Name$ Side$ RWeek0 RWeek1 RWeek2 ;
run;

Proc sort data=cats1 out=sortedcats1;
by Name;
run;

Proc sort data=cats2 out=sortedcats2;
by Name;
run;

Proc sort data=cats3 out=sortedcats3;
by Name;
run;

Data mergcat;
merge sortedcats1 sortedcats2 sortedcats3;
by Name;
if Side='Left' THEN
DO;
treated=LWeek0;
Untreated=RWeek0;
END;
ELSE;
DO;
treated=RWeek0;
Untreated=LWeek0;
END;
run;
proc print data=mergcat;
var Name treated Untreated;
Title 'CATS Dataset - Merged';
run;
