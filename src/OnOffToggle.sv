// Will start "off" then you turn it on.
// accepts initial clock
module OnOffToggle  
( 
	input OnOff, IN, 
	output OUT 
); 
	logic state, nextstate; 
	parameter ON = 1'b1, OFF = 1'b0; 
		always_ff @ (negedge OnOff)  
			state <= nextstate; 
		always @ (state) 
			case(state) 
				OFF: nextstate = ON;        //Pushing OnOff turns the switch on. 
				ON: nextstate = OFF;        //Pushing OnOff turns the switch off. 
			endcase 
	assign OUT = state*IN; 
endmodule
