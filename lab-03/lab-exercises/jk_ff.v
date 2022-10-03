module jk_ff(j,k,q,clk);
	input j,k,clk;
	output q;
	reg q;
	always @ (posedge clk)
		begin
			q<=(j&~q)|(~k&q);				
		end
endmodule