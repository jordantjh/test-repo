module reg_8 (input  logic Clk, Reset, Shift_In, Load, 
                            Shift_En,
                      input  logic [7:0]  D, 
                      output logic Shift_Out, 
                      output logic [7:0]  A);

								
	logic A_out;
							 
	blahblah
second line more
    reg_4  reg_A_first_four_bits (.*, .D(D[7:4]) , .Shift_In(Shift_In), .Shift_Out(A_out), .Data_Out(A[7:4]) );
    reg_4  reg_A_last_four_bits (.*, .D(D[3:0]), .Shift_In(A_out), .Data_Out(A[3:0]) );
					
		
endmodule
