data hockey2;
infile "V:/SAS Programming for Business Analytics/Week3/hockey.csv" 
delimiter=',' dsd firstobs=2 ; 
input Date :mmddyy10. Team :$29.  City :$43. State :$53.  OSU OPP  ; 
format date MMDDYY10. ;
run;

proc print data=hockey2;
Title "Hockey Dataset";
run;

 Data _null_;
  set hockey2;
   file 'V:\SAS Programming for Business Analytics\Week4\HCKYDATA.TXT';
    put Date': ' 'Ohio State ' OSU ', ' Team OPP
;
run;

Proc print data=soccer2;
run;