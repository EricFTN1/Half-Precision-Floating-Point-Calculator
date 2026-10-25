ClockLadder ClockLadder_inst
(
	.COUNT(COUNT_sig) ,	// input  COUNT_sig
	.CLEAR(CLEAR_sig) ,	// input  CLEAR_sig
	.y(y_sig) 	// output [N-1:0] y_sig
);

defparam ClockLadder_inst.N = 32;
