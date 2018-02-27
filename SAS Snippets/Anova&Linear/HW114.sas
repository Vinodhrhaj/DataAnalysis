data speed;
input Age $ Strain $ Speed;
Datalines;
3 A 12
3 A 4
3 A 9
3 A 17
3 A 10
3 A 11
3 A 9
3 A 10
3 B 24
3 B 17
3 B 22
3 B 16
3 B 18
6 A 22
6 A 20
6 A 12
6 A 12
6 A 17
6 A 14
6 A 17
6 B 23
6 B 26
6 B 34
6 B 20
9 A 14
9 A 14
9 A 10
9 A 15
9 A 17
9 A 12
9 A 19
9 B 27
9 B 29
9 B 27
9 B 23
;
run;

proc print data=speed;
title "Given details on rat speed in the maze";
run;

proc glm data=speed;
title "Two Way Analysis of given speed data";
run;
class Age strain;
model speed= Age|strain;
means Age|strain;
run;
