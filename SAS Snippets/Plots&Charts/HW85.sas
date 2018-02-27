Data SATScore;
input @1 Year  4.
@6 Lower_quart 4.
@11 Upper_Quart 4.;
Datalines;
2015	1200	1360
2014 	1170	1330
2013	1170	1330
2012	1140	1330
2011	1130	1320
2010	1110	1310
2009	1140	1310
2008	1120	1290
2007	1130	1300
2006	1150	1310
;
run;
title 'Upper and Lower Quartile';
Proc gplot data = SATScore;
plot  Lower_quart*Year='V' Upper_Quart*Year='A'/overlay;
run;

Proc gplot data = SATScore;
plot  Lower_quart*Year='A';
run;
quit;

