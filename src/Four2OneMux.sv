module Four2OneMux 
(
	input A,B,
	input [3:0]D0,
	input [3:0]D1,
	input [3:0]D2,
	input [3:0]D3,
	output reg [3:0]Y
);

	always @ (A,B,D0,D1,D2,D3)
		case ({B,A})
			2'b00: Y = D0;
			2'b01: Y = D1;
			2'b10: Y = D2;
			2'b11: Y = D3;
		endcase
endmodule
 