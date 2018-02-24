//Two-always example for state machine

module control (input  logic Clk, Reset, Run, ClearA_LoadB, M0,M1,
                output logic ClearXA, LdB, Shift, AddS, Subtract);
	 
	 // 20 states
	 enum logic [4:0] {
		RESET, CLRA_LDB, PRERUN, // in prerun state, Clea XA.
		SHIFT1, SHIFT2, SHIFT3, SHIFT4, SHIFT5, SHIFT6, SHIFT7, SHIFT8,
		ADDS1, ADDS2, ADDS3, ADDS4, ADDS5, ADDS6, ADDS7,
		SUBT,
		HOLD}   curr_state, next_state;
	

	//Sequential: Clk and Reset
    always_ff @ (posedge Clk or posedge Reset)  
    begin
        if (Reset)  //asynchronous
            curr_state <= RESET;
				
        else 
            curr_state <= next_state;
    end

    //Combinational: outputs and state transitions
	 always_comb
    begin
        
		  //state transitions
		  next_state  = curr_state;	//default stay in the current state
        unique case (curr_state) 

            RESET :	if(Run) next_state = PRERUN;
									else if(ClearA_LoadB) next_state = CLRA_LDB;
				PRERUN :    if(M0 == 0) next_state = SHIFT1;
								else if (M0 == 1) next_state = ADDS1;
				ADDS1 :    next_state = SHIFT1;
            SHIFT1 :    if(M1 == 0) next_state = SHIFT2;
								else if (M1 == 1) next_state = ADDS2;
				ADDS2 :    next_state = SHIFT2;
				SHIFT2 :    if(M1 == 0) next_state = SHIFT3;
								else if (M1 == 1) next_state = ADDS3;
				ADDS3 :    next_state = SHIFT3;
				SHIFT3 :    if(M1 == 0) next_state = SHIFT4;
								else if (M1 == 1) next_state = ADDS4;
				ADDS4 :    next_state = SHIFT4;
				SHIFT4 :    if(M1 == 0) next_state = SHIFT5;
								else if (M1 == 1) next_state = ADDS5;
				ADDS5 :    next_state = SHIFT5;
				SHIFT5 :    if(M1 == 0) next_state = SHIFT6;
								else if (M1 == 1) next_state = ADDS6;
				ADDS6 :    next_state = SHIFT6;
				SHIFT6 :    if(M1 == 0) next_state = SHIFT7;
								else if (M1 == 1) next_state = ADDS7;
				ADDS7 :    next_state = SHIFT7;
				SHIFT7 :    if(M1 == 1) next_state = SUBT;
								else if (M1 == 0) next_state = SHIFT8;
				SUBT :    next_state = SHIFT8;
				SHIFT8 :    next_state = HOLD;
				CLRA_LDB : if(!ClearA_LoadB) next_state = RESET;
				HOLD : 	 if (~Run) next_state = RESET;
				
							  
        endcase
   
		  // Assign outputs based on ‘state’  this input  logic Clk, Reset, Run, ClearA_LoadB, M0,M1
            //    output logic ClearXA, LdB, Shift, AddS, Subtract);
        case (curr_state) 
	   	   RESET: 
	         begin
                ClearXA = 1'b0;
                LdB = 1'b0;
                Shift = 1'b0;
					 AddS = 1'b0;
					 Subtract = 1'b0;
		      end
	   	   PRERUN: 
		      begin
                ClearXA = 1'b1;
                LdB = 1'b0;
                Shift = 1'b0;
					 AddS = 1'b0;
					 Subtract = 1'b0;
		      end
				CLRA_LDB:	
		      begin
                ClearXA = 1'b1;
                LdB = 1'b1;
                Shift = 1'b0;
					 AddS = 1'b0;
					 Subtract = 1'b0;
		      end
				ADDS1, ADDS2, ADDS3, ADDS4, ADDS5, ADDS6, ADDS7: 
		      begin
                ClearXA = 1'b0;
                LdB = 1'b0;
                Shift = 1'b0;
					 AddS = 1'b1;
					 Subtract = 1'b0;
		      end
				SUBT: 
		      begin
                ClearXA = 1'b0;
                LdB = 1'b0;
                Shift = 1'b0;
					 AddS = 1'b0;
					 Subtract = 1'b1;
		      end
				HOLD:
		      begin
                ClearXA = 1'b0;
                LdB = 1'b0;
                Shift = 1'b0;
					 AddS = 1'b0;
					 Subtract = 1'b0;
		      end
	   	   default:  //default for shift states
		      begin 
                ClearXA = 1'b0;
                LdB = 1'b0;
                Shift = 1'b1;
					 AddS = 1'b0;
					 Subtract = 1'b0;
		      end
        endcase
		  
		  
    end

endmodule
