//TOP LEVEL
module TEST_LCD 
(
	input           clk_sig, 			// 50MHz Clock
	input           clr_sig, 			// Clear
	input    [0:11] LCD_Board_PB, 		// LCD Board Push Buttons
	input    [0:4]  LCD_Board_SW, 		// LCD Board Switches
	inout    [7:0]  lcd_data_sig, 			// LCD Data Bus
	input			Operation_sig,	    // plus and minus change
	input 			select_sig			//selects register
	input    [3:0] 	row_sig,
	output   [3:0] 	col_sig,
	output   [0:7]  LCD_Board_LED, 		// LCD Board LEDs
	output   [0:9]  DE10_LED, 			// DE10_Lite Red LEDs
	output          lcd_rs_sig, 			// LCD Register Select
	output          lcd_rw_sig, 			// LCD Read Write Select
	output          lcd_e_sign         		// LCD Execute
);

	logic [15:0] Q_sig;
	logic [15:0] Result_sig;

	
keypad_input keypad_inst
(
	.clk(clk_sig) ,			   			// input  clk_sig
	.reset(lcd_reset) ,					// input  reset_sig
	.row(row_sig) ,						// input [3:0] row_sig
	.col(col_sig) ,						// output [3:0] col_sig
	.out(out_sig) ,						// output [DIGITS*4-1:0] out_sig
	.value(value_sig) ,					// output [3:0] value_sig
	.trig(trig_sig) 					// output  trig_sig
);

NBitRegister_SV  RegisterA
(
	.sel(select_sig),						// input select_sig
	.D(value_sig) ,							// input [N-1:0] D_sig
	.CLK(clk_sig) ,							// input  CLK_sig
	.CLR(CLR_sig) ,							// input  CLR_sig
	.Q(A_sig) 								// output [N-1:0] Q_sig
);

NBitRegister_SV RegisterB (
	.sel(select_sig),						// input select_sig
	.D(value_sig) ,							// input [N-1:0] D_sig
	.CLK(clk_sig) ,							// input  CLK_sig
	.CLR(CLR_sig) ,							// input  CLR_sig
	.Q(B_sig) 								// output [N-1:0] Q_sig
);

FLoatingPoint_Calc FLoatingPoint_Calc_inst
(
	.A(A_sig) ,									// input [15:0] A_sig
	.B(B_sig) ,							// input [15:0] B_sig
	.Result(Result_sig),						// output [15:0] B_sig
);

LCD
(
	.WIDTH(16), // someone told me it needs to be 16 bits
	.DIGITS(16),
	.FLOAT(0),
	.MODE(1),
	.LINES(4),
	.CHARS(20),
	.LINE_STARTS({7'h00, 7'h40, 7'h14, 7'h54})
	
	LCD_inst (
	.clk(clk_sig) ,					// input  clk_sig
	.lcd_data(lcd_data_sig) ,		// inout [7:0] lcd_data_sig
	.lcd_rs(lcd_rs_sig) ,			// output  lcd_rs_sig
	.lcd_rw(lcd_rw_sig) ,			// output  lcd_rw_sig
	.lcd_e(lcd_e_sig) ,				// output  lcd_e_sig
	.lcd_reset(clr_sig) ,		 // input  lcd_reset_sig
	.A(A_sig) ,						// input [WIDTH-1:0] A_sig
	.B(B_sig) ,						// input [WIDTH-1:0] B_sig
	.C(C_sig) ,						// input [WIDTH-1:0] C_sig
	.Operation(Operation_sig) 		// input [1:0] Operation_sig
);
endmodule
