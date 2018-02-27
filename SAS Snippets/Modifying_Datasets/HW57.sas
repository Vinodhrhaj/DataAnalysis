DATA Blood;
SET 'V:/SAS Programming for Business Analytics/Week4/blood.sas7bdat';
Combined = 0.001*WBC +RBC;
run;

Proc print Data=Blood;
where gender='Female' and BloodType='AB';
Title 'AB Blood group';
run;

Proc print Data=Blood;
where gender='Female' and BloodType='AB' and combined>=14;
Title 'AB Blood group over 14';
run;
