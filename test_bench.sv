module test_bench();

		timeunit 10ns ;
		timeprecision 1ns;
	
		logic [7:0] S;
		logic Clk = 0;
		logic Reset, Run, ClearA_LoadB;
		logic[6:0] AhexU, AhexL, BhexU, BhexL;
		logic[7:0] Aval, Bval;
		logic X;

		
		logic Correct_Reset;
		assign Reset = !Correct_Reset ;
		logic Correct_ClearA_LoadB;
		assign ClearA_LoadB = !Correct_ClearA_LoadB;
		logic Correct_Run;
		assign Run = !Correct_Run ;
		
	 	multiplier_8_2 mult(.*);

		always begin : CLOCK_GENERATOR
		#1 Clk = ~Clk;
		end
		
		
		initial begin : CLOCK_INITIALIZATION
			Clk = 0;
		end
		
	
		
	 	initial begin : TEST_VECTORS
		Correct_Reset = 0;
		Correct_Run = 0;
		Correct_ClearA_LoadB = 0;
		
		//after 2 seconds
		#2 Correct_Reset = 1;
		
		#2 Correct_Reset = 0;
		
		#2 S = 8'hFF;
		
		#2 Correct_ClearA_LoadB = 1;
		#2 Correct_ClearA_LoadB = 0;
		
		
		#2 Correct_Run = 1;
		
		
		end
		
endmodule

	 