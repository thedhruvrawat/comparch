//$ iverilog -o test_bcd_to_gray.vvp test_bcd_to_gray.v
//$ vvp testbench_bcd.vvp

`include "bcd_to_gray.v"

module testbench;
	wire [0:3]gray;
	reg [0:3]bcd;
	bcd_to_gray bcdgrayconvert (bcd, gray);
		initial
			begin
				$monitor(,$time,": %b -> %b", bcd, gray);
				#0 bcd = 4'b0000; //Use 4'd0 for defining in decimal, shorter
				#1 bcd = 4'b0001;
				#1 bcd = 4'b0010;
				#1 bcd = 4'b0011;
				#1 bcd = 4'b0100;				
				#1 bcd = 4'b0101;
				#1 bcd = 4'b0110;
				#1 bcd = 4'b0111;
				#1 bcd = 4'b1000;
				#1 bcd = 4'b1001;
				#5 $finish;
			end
endmodule