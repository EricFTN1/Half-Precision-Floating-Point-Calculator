module twoSIGN #(parameter N = 5) (
    input [N-1:0] A,
    output [N-1:0] B
);
    wire [N-1:0] bits;   // inverted bits
    wire [N-1:0] C;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : bit_invert
            assign bits[i] = A[i] ^ 1;
        end
    endgenerate
    
    // Use HalfAdder module for 1
    halfadder ha0 (.s(B[0]), .cout(C[0]), .a(bits[0]), .b(1'b1)); 
    
    generate
        for (i = 1; i < N; i = i + 1) begin : half_adder_loop
            halfadder ha (.s(B[i]), .cout(C[i]), .a(bits[i]), .b(C[i-1]));
        end
    endgenerate

endmodule
