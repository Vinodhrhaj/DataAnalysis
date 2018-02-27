Data Bicycles;
set 'V:/SAS Programming for Business Analytics/Week4/bicycles.sas7bdat';
run;
Data MountainUSA;
Set bicycles;
If country='USA' and Model='Mountain Bike'
then Output;
run;
Data RoadFR;
Set bicycles;
If country='France' and Model='Road Bike'
then Output;
run;

proc print data=MountainUSA;
Title 'Mountain USA Bikes';
run;

proc print data=RoadFR;
Title 'Road France Bikes';
run;
