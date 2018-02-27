DATA usedcars;
infile "V:/SAS Programming for Business Analytics/Week4/usedcars.txt" firstobs=2;
/* Miles and Price are converted from comma embedded number to numeric format */
input @1 Year 2. @9 Manufacturer $11. @24 Model $12.  @38 Miles comma6.  @50 Price comma6.
@61 Dealer $23.;
label Price='Economy';
run;
proc sort data=usedcars out=sorted;
by Dealer Price;
run;

data temp;
set sorted;
by Dealer;
LowPrice = first.Dealer;
run;

Proc Print data=temp NoOBS;
Var Year Manufacturer Model Price Dealer;
Where LowPrice=1;
Title 'Dealer most economical models';
run;
 


