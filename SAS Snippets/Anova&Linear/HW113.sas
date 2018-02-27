Data drugtest;
Length Group $11 Condition $20;
input group $ drug $ depression;
condition = trim(group) ||'-'||DRUG;
DATALINES;
G_Deficient Drug 9
G_Deficient Placebo 9
G_Deficient Drug 11
G_Deficient Placebo 6
G_Deficient Drug 10
G_Deficient Placebo 6 
G_Deficient Drug 10
G_Deficient Placebo 7
Normal Plan 5
Normal Placebo 12
Normal Plan 4
Normal Placebo 11
Normal Plan 7
Normal Placebo 10
Normal Plan 7
Normal Placebo 11
;
run;

proc print data=drugtest;
title 'Drug test Data';
run;

proc anova data = drugtest;
Title ' Drug versus depression';
class group drug;
model depression=group|drug;
means group|drug/SNK;
run;

proc anova data = drugtest;
Title ' One Way - Drug versus depression';
class condition;
model depression=condition;
means condition/SNK;
run;


