DATA soccer3;
 INFILE 'V:/SAS Programming for Business Analytics/Week2/soccer.txt';
Input @1 Number $ / FirstName $1-11 Lastname $12-21 / code $ /
 feet $1 @3inches #5 level  $ #6 jersey $;
 feet_metre = feet*0.3048 +inches*0.0254;
 format feet_metre COMMAw.2;
 run;
 
 proc print data=soccer3;
 var FirstName Lastname feet_metre jersey;
 Title 'Player Details';
 run;
 