DATA usedcars;
infile "V:/SAS Programming for Business Analytics/Week4/usedcars.txt" firstobs=2;
/* Miles and Price are converted from comma embedded number to numeric format */
input @1 Year 2. @9 Manufacturer $11. @24 Model $12.  @38 Miles comma6.  @50 Price comma6.
@61 Dealer $23.;
label Price='Economy';
run;

/* Format statement to handle Miles and Price within ranges*/
proc format;
 value Mileage 0 - <  50000 = '<50,000' 50000 -	high = '>=50,000' other = 'Unknown' ;
value Economy 0 - 5000 = 'Economy'5000 - 10000 = 'Moderate' 10001 - high= 'Expensive' ;

proc print data=usedcars label;
 var Year Manufacturer Model Miles Price;
 format Miles Mileage. Price Economy.;
 title 'Usedcars';
 footnote 'Report End';
run;
