`timescale 1ns/1ns
module mult_8(clk,start,reset,a,b,op);
input [7:0] a,b;
input clk,start,reset;
output reg [15:0] op;

reg [7:0]a1,b1;
reg [16:0]sum;
wire temp;
reg [3:0]i;
assign temp = b1[0];
wire [15:0]temp2;
assign temp2 = {a1[7]&temp,a1[6]&temp,a1[5]&temp,a1[4]&temp,a1[3]&temp,a1[2]&temp,a1[1]&temp,a1[0]&temp}<<i;
always @(posedge clk)begin
	if (reset) begin
	a1 <= a;
	b1 <= b;
	sum <= 0;
	i <= 0;
	end else begin 
		sum <= sum + temp2;
		b1 <= b1 >>1;
		i <= i+1;
		if(i>=8)begin
			op <=sum;
		end
	end
end
endmodule
