keypad_input keypad_input_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.reset(reset_sig) ,	// input  reset_sig
	.row(row_sig) ,	// input [3:0] row_sig
	.col(col_sig) ,	// output [3:0] col_sig
	.out(out_sig) ,	// output [DIGITS*4-1:0] out_sig
	.value(value_sig) ,	// output [3:0] value_sig
	.trig(trig_sig) 	// output  trig_sig
);

defparam keypad_input_inst.DIGITS = 4;
