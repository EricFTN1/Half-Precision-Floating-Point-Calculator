
TwoToOneMux TwoToOneMux_inst
(
	.sel(sel_sig) ,	// input  sel_sig
	.D0(D0_sig) ,	// input [N-1:0] D0_sig
	.D1(D1_sig) ,	// input [N-1:0] D1_sig
	.Y(Y_sig) 	// output [N-1:0] Y_sig
);

defparam TwoToOneMux_inst.N = 5;
