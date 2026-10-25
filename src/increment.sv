
module increment
(
    input enable,
    input [7:0] data_in,
    output [7:0] data_out
);

logic [7:0] carry_generate;
logic [7:0] carry_in;

assign carry_generate = (enable == 1'b1) ? 1 : 0;

halfadder half_stage
(
    data_in[0],
    carry_generate[0],
    data_out[0],
    carry_in[0]
);

genvar i;
generate
    for (i = 1; i < 8; i = i + 1)
    begin: adder_chain
        fulladder add_stage
        (
            data_in[i],
            carry_generate[i],
            carry_in[i-1],
            data_out[i],
            carry_in[i]
        );
    end
endgenerate 

endmodule
