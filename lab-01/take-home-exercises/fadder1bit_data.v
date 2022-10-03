module fadder1bit_data(a,b,sum,cout,cin);
	input a,b,cin;
	output cout,sum;
	wire w1,w2,w3;
	assign sum=((a^b)^cin);
	assign cout=((a&b)|((a^b)&cin));

endmodule

// module tb_fadder1bit;
// 	reg a,b,cin;
// 	wire cout,sum;
// 	fadder1bit_data f1b(a,b,sum,cout,cin);
// 	initial
// 		begin
// 			$monitor(,$time," a=%b , b=%b, cin=%b, sum=%b, cout=%b",a,b,cin,sum,cout);
// 			#0 a=1'b0;b=1'b0;cin=1'b0;
// 			#2 a=1'b0;b=1'b0;cin=1'b1;
// 			#2 a=1'b0;b=1'b1;cin=1'b0;
// 			#2 a=1'b0;b=1'b1;cin=1'b1;
// 			#2 a=1'b1;b=1'b0;cin=1'b0;
// 			#2 a=1'b1;b=1'b0;cin=1'b1;
// 			#2 a=1'b1;b=1'b1;cin=1'b0;
// 			#2 a=1'b1;b=1'b1;cin=1'b1;
// 			$finish;
// 		end
// endmodule