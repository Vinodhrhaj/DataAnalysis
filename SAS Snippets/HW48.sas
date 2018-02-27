DATA ryan;
infile "V:/SAS Programming for Business Analytics/Week4/ryan.txt" firstobs=2 dlm='09'x;
input TITLE :$25. ROGER NYTIMES USAT :;
run;

options pageno=1 missing='.' skip=0 firstobs=1 obs=MAX;
run;

proc print data=ryan;
run;

/*options:SAS system options control how SAS formats output, handles files, processes data sets, interacts with the operating environment, 
and does other tasks that are not specific to a single SAS program or data set. The above command changes SAS session as follows*/
**PAGENO system option specifies a beginning page number for the next page (i.e.385) of output that SAS produces.
**MISSING Would replace the values given in quotations in the place of blank observation values 
**SKIP moves carriage control to the said position (e.g. 20 here)to begin every first line of new page. It helps to maintain consistancy in the new line of every page
**FIRSTOBS inform SAS to read input records starts at 5
**OBS informs SAS to read how many records to be read from the first observation within the input file. In this case(OBS=12) we read 12-5 = 7 observations.


