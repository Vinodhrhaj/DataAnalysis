DATA OLD;
   INFORMAT STATE1-STATE5 $2.;
   INPUT ID STATE1-STATE5;
DATALINES;
1   NY   NJ   PA   TX   GA
2   NJ   NY   CA   XX   XX
3   PA   XX   XX   XX   XX
;
run;
data NEW;
SET OLD;
array STATE[5] STATE1-STATE5;
do i = 1 to 5;
if STATE[i] = 'XX' then STATE[i] = '';
	end;
keep id state1-state5;
run;

proc print data=new;
title 'Replace XX code with blank space';
run;

proc transpose data=new
out=TransposeState (rename=(col1=STATE)
drop=_name_);
by id;
var STATE1-STATE5;
run;
proc print data=TransposeState;
title 'State table transpose';
run;

proc freq data=TransposeState order=freq;
tables state/nocum nopercent;
run;
