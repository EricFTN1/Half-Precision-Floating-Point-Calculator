// the math portion of the look ahead 
module RCAddSubReg 
(
    input AddSub,          // Select addition (0) or subtraction (1)
    input clock,            // Clock for register loading
    input [3:0] A, B,      // 4-bit input operands
    output logic [3:0] S_out,  // 4-bit sum output (my register R in this case)
	 output logic Cout      // Carry-out (which is 1 bit) 
//	 
);
//
    reg [3:0] reg_A, reg_B, reg_S; // Input and output registers (each are 4 bits) 
    reg reg_C;                     // Register for carry out
    wire [3:0] B_XOR;               // XOR for 2’s complement subtraction (2's complement)
    wire [3:0] Sum;                 // Sum output from CLA (output of the R_register being 4 bits) 
    wire Cout_wire;                  // Carry out from CLA
//
    assign B_XOR = B ^ {4{AddSub}}; // B XOR AddSub: If AddSub=1, B is inverted
    assign Cout = reg_C;           // Assign carry out
    assign S_out = reg_S;          // Assign sum out
//
   // Register values on the falling edge of the clock
  always_ff @ (negedge clock) begin
       reg_A <= A; 
        reg_B <= B_XOR;  // Load XORed value of B
        reg_S <= Sum;    // Load sum result
       reg_C <= Cout_wire; // Load carry out
    end

    // Instantiate the Carry Look-Ahead Adder (CLA)
    carry_lookahead_adder CLA_inst (
        .A(reg_A),
        .B(reg_B),
        .Cin(AddSub),    // Carry-in is AddSub (1 for subtraction)
        .Sum(Sum),
        .Cout(Cout_wire)
    );

endmodule


//
//module RCAddSubReg 
//(
//    input AddSub,           // Select addition (0) or subtraction (1)
//    input clock,            // Clock for register loading
//    input [3:0] A, B,       // 4-bit input operands
//    output logic [3:0] S_out, // 4-bit sum output
//    output logic Cout,       // Carry-out
//    output logic Z,          // Zero flag
//    output logic N,          // Negative flag
//    output logic V           // Overflow flag
//);
//
//    reg [3:0] reg_A, reg_B, reg_S; 	// Input and output registers
//    reg reg_C, reg_Z, reg_N, reg_V; // Flags
//    wire [3:0] B_XOR, Sum;  			// Processed B input & sum output
//    wire Cout_wire;         			// Carry out from CLA
//
//    assign B_XOR = B ^ {4{AddSub}}; // 2's complement for subtraction
//
//    // Compute flags based on the sum result
//    wire Z_wire = (Sum == 4'b0000);         // Zero flag: sum is zero
//    wire N_wire = Sum[3];                   // Negative flag: MSB of sum
//    wire V_wire = (A[3] == B_XOR[3]) && (Sum[3] != A[3]); // Overflow flag
//
//    assign Cout = reg_C;  // Assign carry out
//    assign S_out = reg_S; // Assign sum out
//    assign Z = reg_Z;     // Assign zero flag
//    assign N = reg_N;     // Assign negative flag
//    assign V = reg_V;     // Assign overflow flag
//
//    // Register values on the falling edge of the clock
//    always_ff @ (negedge clock) begin
//        reg_A <= A; 
//        reg_B <= B_XOR;  	 // Load XORed value of B
//        reg_S <= Sum;     	 // Load sum result
//        reg_C <= Cout_wire; // Load carry out
//        reg_Z <= Z_wire;    // Load Zero flag
//        reg_N <= N_wire;    // Load Negative flag
//        reg_V <= V_wire;    // Load Overflow flag
//    end
//
//    // Instantiate the Carry Look-Ahead Adder (CLA)
//    carry_lookahead_adder CLA_inst (
//        .A(reg_A),
//        .B(reg_B),
//        .Cin(AddSub),    // Carry-in is AddSub (1 for subtraction)
//        .Sum(Sum),
//        .Cout(Cout_wire)
//    );
//
//endmodule

