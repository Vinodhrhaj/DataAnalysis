
         DATA W6Hockey;
          infile "C:\Users\vinodhvenugo\Downloads\hw6\hockey.csv"
		  delimiter=',' dsd firstobs=2 ;
          input Date :mmddyy10. Team :$29.  City :$43. State :$53.  OSU OPP  ;
          
         if (Team = 'Boston College') then
         do
         OSU=5;
         OPP=2;
         END;     
			if (OSU>OPP) then
			W+1;
				else if (OPP<OSU) then
			L+1;
				else
			T+1 ;
		run;

		proc print data=W6Hockey;
		title'Hockey dataset';
		format DATE mmddyy8.;
		run;

