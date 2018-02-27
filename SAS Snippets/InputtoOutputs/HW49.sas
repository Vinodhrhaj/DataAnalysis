data colors;
input Color : $1. @@;
datalines;
R R B G Y Y . . B G R B G Y P O O V V B
;
proc format;
value $Color 'R' = 'Group 1' 'G' = 'Group 1' 'B' = 'Group 1' 'Y' = 'Group 2'
'O' = 'Group 2'   ' ' = 'Not Given'        other = 'Group 3'
;
proc print data=colors label;
format Color $Color.;
run;
proc freq data=colors;
format Color $Color.;
title Frequencies of Colour Groups;
run; 
