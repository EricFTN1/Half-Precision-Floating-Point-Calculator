
two2one two2one_inst
(
	.A(A_sig) ,	// input [N-1:0] A_sig
	.B(B_sig) ,	// input [N-1:0] B_sig
	.S(S_sig) ,	// input  S_sig
	.Z(Z_sig) 	// output [N-1:0] Z_sig
);

defparam two2one_inst.N = 4;
