DATA soccer2;
 INFILE 'V:/SAS Programming for Business Analytics/Week2/soccer.txt';
Input @1 Number $ / FirstName $1-11 Lastname $12-21 / code $ /
 feet $1 @3inches #5 level  $ #6 jersey $;


 Data _null_;
  set soccer2;
   file 'V:\SAS Programming for Business Analytics\Week4\SOCCDATA.txt';
    put FirstName lastname 'Wears Number' Number '.'
;
run;

Proc print data=soccer2;
run;