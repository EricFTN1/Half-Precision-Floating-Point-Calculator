module barrel_shifter #(parameter N = 24)
(
	input reg [N-1:0] Input,
	input clock, onOff, set, clear,
	output reg [N-1:0] out_final, out,
	output [0:6] SEV
);

	logic [7:0] out_value;
	assign out_value = Input;
	assign out = out_value;
	
	wire [2:0] shift_value;

	
	
shifter_tester ShifterTester
(
	.OnOff(onOff) ,	// input  OnOff_sig
	.Clock(clock) ,	// input  Clock_sig
	.Set(set) ,			// input  Set_sig
	.Clear(clear) ,	// input  Clear_sig
	.B(shift_value) ,	// output [2:0] B_sig
	.SEV(SEV) 			// output [6:0] SEV_sig
);

	
right_barrel_shifter right_barrel_shifter_inst
(
	.initial_value(Input) ,	// input [7:0] initial_value_sig
	.ctrl(shift_value) ,	// input [2:0] ctrl_sig
	.shifted(out_final) 	// output [7:0] shifted_sig
);

endmodule
