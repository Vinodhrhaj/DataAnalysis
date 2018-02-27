
DATA BICYLES;
SET "V:\SAS Programming for Business Analytics\Week4\bicycles.sas7bdat";
RUN;

goptions reset=all
	ftext='arial'
	htext=1.5
	
	ftitle='arial/bo'
	htitle=2
	colors=(black);
title "Country and Model Distribution";
	pattern value=empty;

proc GCHART data=bIcyles;
	vbar Country Model;
	*hbar Model /Barwidth=1.0;
run;


