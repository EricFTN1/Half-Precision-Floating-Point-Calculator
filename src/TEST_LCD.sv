//TOP LEVEL
module TEST_LCD 
(
	input [15:0] Ainput,Binput, 
	output [15:0] Result
);

	logic Cout, CarryLookAheadCout;
	logic [10:0] MantissaShifterMuxOut, MantissaAdderMUXOut, MantissaRightShifterOut;
	logic [4:0] ModularExponentSubtractorOut, ExponentINCMuxOut;
	logic [10:0] GLCAOut;
	
keypad_input
(
	.A(Ainput[9:0]) ,						// input [9:0] A_sig
	.B(Binput[9:0]) ,						// input [9:0] B_sig
	.switch(Cout) ,					// input  switch_sig
	.C(MantissaShifterMuxOut) 		// output [9:0] C_sig
);

MantissaAdderMux MantissaAdderMux_inst
(
	.A(Ainput[9:0]) ,					// input [9:0] A_sig
	.B(Binput[9:0]) ,					// input [9:0] B_sig
	.switch(Cout) ,				// input  switch_sig
	.C(MantissaAdderMUXOut) 	// output [9:0] C_sig
);

SubtractorTopLevel SubtractorTopLevel_inst
(
	.A(Ainput[14:10]) ,							// input [4:0] A_sig
	.B(Binput[14:10]) ,							// input [4:0] B_sig
	.solution(ModularExponentSubtractorOut) ,	// output [4:0] solution_sig
	.Cout(Cout) 										// output  Cout_sig
);
endmodule
