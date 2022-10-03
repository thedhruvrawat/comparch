`include "jk_ff.v"

module synccounter4bit(clk,q);
	input clk;
	output q;
	wire [3:0]c;	
	jk_ff jf1(1'b1,1'b1,c[0],clk);
	jk_ff jf2(c[0],c[0],c[1],clk);
	jk_ff jf3((c[1]&c[0]),(c[1]&c[0]),c[2],clk);
	jk_ff jf4((c[2]&(c[1]&c[0])),(c[2]&(c[1]&c[0])),c[3],clk);
	assign q=c[3];
endmodule

module tb_synccounter4bit;
	reg clk;
	wire q;
	synccounter4bit c1b(clk,q);	
	initial 
	begin
        c1b.jf1.q=1'b0;
        c1b.jf2.q=1'b0;
        c1b.jf3.q=1'b0;
        c1b.jf4.q=1'b0;
	end
	always @(posedge clk) 
		begin
			$monitor("clk=%b, q=%b",clk,q);
		end
	initial begin
		clk=0;
		forever 
		begin
		    #5 clk=~clk;
		end
	end
	initial 
		begin
			#200 $finish;
		end
endmodule