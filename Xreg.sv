module Xreg (
			input logic Clk,load_en, Clear, A9, //9th bit = Cout
			output logic Xout
			);
	
		
	always_ff @ (posedge Clk)
	begin
		if( load_en )
			Xout <= A9;
		else if(Clear)
			Xout <= 0;
	end
	
endmodule
