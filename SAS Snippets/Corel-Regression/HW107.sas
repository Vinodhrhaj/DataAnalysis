data manyerr;
input x y z;
if x le 0 then x=1;
if y le 0 then y=1;
if z le 0 then z=1;
logx=log(x);
logy=log(y);
logz=log(z);
datalines;
  1 2 3
  . 7 8
  4 . 10
  7 8 11
;
  proc corr data=manyerr pearson spearman;
   var x logz ;
   
  run;
