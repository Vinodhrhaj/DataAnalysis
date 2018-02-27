DATA cats2;
infile "V:/SAS Programming for Business Analytics/Week4/cats2.txt" firstobs=2;
/* Miles and Price are converted from comma embedded number to numeric format */
input Cat$ 0-8 Side$ 9-20 Week0 21-28 Week1 29-36  Week2 37-40;
run;
Proc sort data=cats2 out=sortedcats2
sortseq=linguistic(strength=primary);
by Week0;
run;

proc print data=sortedcats2;
var Cat Week0;
run;

