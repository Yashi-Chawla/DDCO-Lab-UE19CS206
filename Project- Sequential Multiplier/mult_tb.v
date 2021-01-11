`timescale 1ns/1ns

module seq_mul_tb;
    reg reset;
	// Inputs
	reg clk;
	reg start;
	reg [7:0] a;
	reg [7:0] b;

    wire [15:0] op;
	mult_8 uut (
		.clk(clk), 
		.start(start), 
		.reset(reset),
		.a(a), 
		.b(b),
		.op(op)
	);
    initial begin $dumpfile("seq_mul_tb.vcd"); $dumpvars(0,seq_mul_tb); end
    initial begin reset = 1'b1; #25 reset = 1'b0; end
	initial clk = 1'b0; 
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		start = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#15;
        start = 1;
		a = 8'b1001;
		b = 8'b1101;
		#15;
		start = 0;

		#1000 $finish;
		// Add stimulus here

	end
      
endmodule