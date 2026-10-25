//
//// math for the carry look ahead
//module carry_lookahead_adder 
//(
//    input  logic [3:0] A, B,   // 4-bit inputs for the register A & B
//    input  logic       Cin,    // Carry input
//    output logic [3:0] Sum,    // 4-bit Sum output
//    output logic       Cout    // Carry out
//);
//
//    logic [3:0] G, P, C; // Generate, Propagate, Carry
//
//    // Generate and Propagate Logic
//    assign G = A & B;  // Generate: Gi = Ai * Bi
//    assign P = A ^ B;  // Propagate: Pi = Ai ⊕ Bi
//
//    // Carry Look-Ahead Logic
//    assign C[0] = Cin;
//    assign C[1] = G[0] | (P[0] & Cin);
//    assign C[2] = G[1] | (P[1] & C[1]);
//    assign C[3] = G[2] | (P[2] & C[2]);
//    assign Cout = G[3] | (P[3] & C[3]); // Final carry out
//
//    // Sum Computation
//    assign Sum = P ^ C; // Sum = Propagate ⊕ Carry
//
//endmodule

// math for the carry look ahead
module carry_lookahead_adder 
(
    input  logic [3:0] A, B,   // 4-bit inputs for the register A & B
    input  logic       Cin,    // Carry input
    output logic [3:0] Sum,    // 4-bit Sum output
    output logic       Cout    // Carry out
);

    logic [3:0] G, P, C; // Generate, Propagate, Carry

    // Generate and Propagate Logic
    assign G = A & B;  // Generate: Gi = Ai * Bi
    assign P = A ^ B;  // Propagate: Pi = Ai ⊕ Bi
	 

//	 wire cout, ovr, neg, zero; // DO NOT MODIFY 
//	 assign C[0] = Add_Subtract; // DO NOT MODIFY 

    // Carry Look-Ahead Logic
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign Cout = G[3] | (P[3] & C[3]); // Final carry out

    // Sum Computation
    assign Sum = P ^ C; // Sum = Propagate ⊕ Carry
	 
	 
	 

//
//assign cout = C[8]; // Modify output flag and implement cout logic 
//assign ovr = C[7] ^ C[8]; // Modify output flag to implement ovr logic 
//assign neg = S[7]; // Modify output flag to implement neg logic 
//assign zero = ~(|S); // Modify output flag to implement zero logic 



endmodule




