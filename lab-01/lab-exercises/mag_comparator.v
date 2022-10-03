module mag_comparator(input [3:0]a, input [3:0]b, output [2:0]c);
	reg c;
	always@ (a or b)
		begin
			if(a==b) c=3'b100;
			else if(a>b) c=3'b010;
			else if(a<b) c=3'b001;
		end
endmodule