module fadder(a,b,sum,cout,cin);

	input a,b,cin;
	output cout,sum;
	wire w1,w2,w3;
	assign sum=((a^b)^cin);
	assign cout=((a&b)|((a^b)&cin));

endmodule