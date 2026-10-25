
// Ripple Carry Subtractor

module RIPCarrySub #(parameter N = 5)  // Parameterized width
(
	input [N-1:0] A, B, //declare input ports	
	input Add_Subtract,
	output [N-1:0] R, //declare output ports for sum
	output Cout //declare carry-out port
); 

	wire [N:0] C; //declare internal carries
	assign C[0] = Add_Subtract; //Add 0 for addition, 1 for subtraction
	assign Cout = C[N]; //rename carry out port
	
	//instantiate the full adder module for each stage of the ripple carry adder
	FAbehave s0 (A[0], Add_Subtract^B[0], C[0], R[0], C[1]); //stage 0
	FAbehave s1 (A[1], Add_Subtract^B[1], C[1], R[1], C[2]); //stage 1
	FAbehave s2 (A[2], Add_Subtract^B[2], C[2] ,R[2], C[3]); //stage 2
	FAbehave s3 (A[3], Add_Subtract^B[3], C[3], R[3], C[4]); //stage 3
	FAbehave s4 (A[4], Add_Subtract^B[4], C[4], R[4], C[5]); //stage 4
//	FAbehave s5 (A[5], B[5]^C[0], C[5], S[5], C[6]); // Add FAbehav s5 
//	FAbehave s6 (A[6], B[6]^C[0], C[6], S[6], C[7]); // Add FAbehav s6 
//	FAbehave s7 (A[7], B[7]^C[0], C[7], S[7], C[8]); // Add FAbehav s7 

endmodule 
