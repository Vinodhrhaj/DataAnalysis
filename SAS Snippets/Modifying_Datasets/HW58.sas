DATA GenderMale GenderFemale;
SET 'V:/SAS Programming for Business Analytics/Week4/blood.sas7bdat';
If CHOL>0 and CHOL<100 and Gender ='Male'
then output GenderMale;
If CHOL>0 and CHOL<100 and Gender ='Female'
then output GenderFemale;
run;

Proc print Data=GenderMale;
Title 'Male Blood group';
run;

Proc print Data=GenderFemale;
Title 'Female Blood group';
run;