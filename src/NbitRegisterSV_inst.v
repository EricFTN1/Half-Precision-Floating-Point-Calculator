NbitRegisterSV NbitRegisterSV_inst
(
	.D(D_sig) ,	// input [N-1:0] D_sig
	.CLK(CLK_sig) ,	// input  CLK_sig
	.CLR(CLR_sig) ,	// input  CLR_sig
	.Q(Q_sig) 	// output [N-1:0] Q_sig
);

defparam NbitRegisterSV_inst.N = 4;
