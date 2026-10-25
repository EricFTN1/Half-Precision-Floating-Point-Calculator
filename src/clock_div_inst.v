clock_div clock_div_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.reset(reset_sig) ,	// input  reset_sig
	.clk_out(clk_out_sig) 	// output  clk_out_sig
);

defparam clock_div_inst.WIDTH = 32;
defparam clock_div_inst.DIV = 50;
