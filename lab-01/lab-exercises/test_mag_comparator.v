`include "mag_comparator.v"

module testbench;
	reg [3:0]a, b;
	wire [2:0]c;
	
	mag_comparator mag_comp(a, b, c);
	initial
		begin
			$monitor(, $time, " a=%4b, b=%4b, c=%3b", a, b, c);
			#0 a=4'b0000; b=4'b0000;
			#2 a=4'b0001; b=4'b0000;
			#2 a=4'b0000; b=4'b0001;
			#10 $finish;
		end
		
endmodule