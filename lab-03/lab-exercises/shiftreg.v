module shiftreg(EN, in, CLK, Q,f);

	parameter n=4; 
	input EN;
	input in;
	input CLK;
	output [n-1:0] Q; 
	reg [n-1:0] Q;
	output f;
	reg f;

	initial
	Q=4'b0000;

	always @ (posedge CLK) 
		begin
			if (EN) 
				Q={in,Q[n-1:1]};
				f=Q[3];
		end

endmodule