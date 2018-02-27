DATA Mantees;
infile "V:/SAS Programming for Business Analytics/Week2/manatees.txt" FIRSTOBS=2 EXPANDTABS;
input YEAR  WATERC  LOCK    RELAT   PERIN   NATUR   UNDET;
/* Adding Label information*/
label YEAR='Year' WATERC='Water Cubic' LOCK = 'WaterStructure' RELAT = 'Relation'
  PERIN ='Perin_Mantee' NATUR='Nature' UNDET='Undetermined';
proc print data=Mantees label;
 title 'Mantee results';
 footnote 'End of Report';
run;
