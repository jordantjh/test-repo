module multiplier_8_2(
					input logic[7:0] S,
					input  logic Clk, Reset, Run, ClearA_LoadB,
					output logic[6:0] AhexU, AhexL, BhexU, BhexL,
					output logic[7:0] Aval, Bval,
					output logic X);

		logic Reset_SH,Run_SH,ClearA_LoadB_SH;
		logic [7:0] S_S;
		
					
		logic ClearXandA;
		logic load_B_register;
		logic Shift_XAB;
		logic Addition,Subtraction;
		logic Xout_middle;
		
		assign X = Xout_middle;
		
		logic [7:0]Bvalue,Avalue;
		logic [8:0]Adder_out;
		assign Bval = Bvalue;
		assign Aval = Avalue;
		
		logic Load_A_register;
		assign Load_XA = Addition | Subtraction;
		

					
		control control_unit (.Clk(Clk), .Reset(Reset_SH), .Run(Run_SH), .ClearA_LoadB(ClearA_LoadB_SH),
										.M0(Bvalue[0]), .M1(Bvalue[1]),
										.ClearXA(ClearXandA), .LdB(load_B_register), .Shift(Shift_XAB), .AddS(Addition),
										.Subtract(Subtraction));
						
		reg_16 a_and_b ( .Clk(Clk) , .Reset(ClearXandA) , .Ld_B(load_B_register) , .Shift_En(Shift_XAB), .Shift_In(Xout_middle),
							.Ld_A(Load_XA), .Ain(Adder_out[7:0]), .Bin(S_S), .Aout(Avalue),
							.Bout(Bvalue) );
			
		ADD_SUB9 adder (.A(Avalue), .B(S_S), .Subtract(Subtraction), .S(Adder_out));		
				
		Xreg x_register(.Clk(Clk), .load_en(Load_XA) , .Clear(ClearXandA), .A9(Adder_out[8]) , .Xout(Xout_middle));
		
		HexDriver A_hex_U ( .In0(Avalue[7:4]), .Out0(AhexU));
	
		HexDriver A_hex_L ( .In0(Avalue[3:0]), .Out0(AhexL));
	
		HexDriver B_hex_U ( .In0(Bvalue[7:4]), .Out0(BhexU));
	
		HexDriver B_hex_L ( .In0(Bvalue[3:0]), .Out0(BhexL));
	
		sync button_sync[2:0] (Clk, {~Reset, ~Run, ~ClearA_LoadB}, {Reset_SH, Run_SH, ClearA_LoadB_SH});
		sync Switch_sync[7:0] (Clk, S, S_S);
					
endmodule
