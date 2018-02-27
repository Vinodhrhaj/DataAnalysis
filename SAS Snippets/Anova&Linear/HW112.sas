Data Exam;
Input program $ score;
datalines;
A 560 
A 520
A 530
A 525
A 575
A 527
A 580
A 620
B 565
B 522
B 520
B 530
B 510
B 522
B 600
B 590
C 512
C 518
C 555
C 502
C 510
C 520
C 516
D 505
D 508
D 512
D 520
D 543
D 523
D 517
;
run;

proc print data=exam;
Title 'Marks versus Exam';
run;

proc glm data=exam;
title "Exam programs comparison";
class program;
model score = program;
means program/ SNK alpha=0.05;
contrast ' A and B / C and D' Program -1 -1 1 1 ;
contrast ' A  B and  C / D' Program -1 -1 1 3	 ;
run;
