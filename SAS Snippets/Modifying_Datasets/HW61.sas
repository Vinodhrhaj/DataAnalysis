data prob1;
 input (HT1-HT5)(2.) (WT1-WT5)(3.);
 array HT[5];
 array WT[5];
  array dens[5] dens1-dens5;
   do i = 1 to 5;
  dens{i} = WT[i]/HT[i]**2;
   end;
   drop i;
datalines;
6862727074150090208230240
64  68  70140   150   170
;

proc print data=prob1;
run;



