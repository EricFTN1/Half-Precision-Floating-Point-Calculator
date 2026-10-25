module TwoToOneMux #(parameter N = 5)  // Parameterized width
(
    input logic sel,               // Select line
    input logic [N-1:0] D0,        // Data input 0
    input logic [N-1:0] D1,        // Data input 1
    output logic [N-1:0] Y         // Output
);
    always_comb begin
        if (sel) begin
            Y = D1;  // If sel is 1, output D1
        end else begin
            Y = D0;  // If sel is 0, output D0
        end
    end
endmodule


//module TwoToOneMux 
//(
// input A, B,
// input S,
// output Z
// );
//
// assign Z = S==0 ? A : B; //select input
// endmodule
