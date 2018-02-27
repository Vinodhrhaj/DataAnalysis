                                                                                                                                        
                                                                                                                                        
         DATA dogs3;                                                                                                                    
         infile "C:\Users\vinodhvenugo\Downloads\hw6\dogs3.txt"  firstobs = 3;                                                           
         input Dogname $ Week0_EOS Week2_EOS Week4_EOS;                                                                                                        
         run;

		 Proc sort data=dogs3;
		 by Dogname;

		 Proc print data=dogs3;
		 run;

		proc transpose data=dogs3
		out=TransposeDog (rename=(_name_=Measured_Week col1=Eos_Count));
		by Dogname;
		var Week0_EOS Week2_EOS Week4_EOS;
		run;

		Proc print data=TransposeDog;
		 run;

