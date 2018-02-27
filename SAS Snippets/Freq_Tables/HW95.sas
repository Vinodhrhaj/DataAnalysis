DATA Dogs1;
INFILE "V:/SAS Programming for Business Analytics/Week2/dogs1.txt" FIRSTOBS=2;
INPUT dog $1-8 conc 16 sex $ 17 age 31-32 haircoat $ 33-37 weight 38-48;
RUN;

TITLE "Dogs1 dataset";
PROC PRINT DATA=DOGS1;
RUN;

TITLE "Fishers exact test";
PROC FREQ DATA=Dogs1;
TABLES (SEX HAIRCOAT)* CONC / fisher;
RUN;