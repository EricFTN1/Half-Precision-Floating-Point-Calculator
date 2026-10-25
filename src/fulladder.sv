module fulladder
(
	input a, b, cin,
	output s, cout
);

always_comb
{cout,s} = a + b + cin;
endmodule 