// iverilog -o testbench.vvp testbench.v
// vvp testbench.vvp
//     0 a=0, b=1, s=x, f=x
//     2 a=0, b=1, s=1, f=0
//     7 a=0, b=1, s=0, f=1
//    17 a=1, b=0, s=0, f=0
//    32 a=1, b=0, s=1, f=1
//    52 a=1, b=0, s=0, f=0

`include "mux2to1_df.v"

module testbench;
    reg a,b,s;
    wire f;
    mux2to1_df mux_df (a,b,s,f);
    initial begin
        $monitor(,$time, " a=%b, b=%b, s=%b, f=%b", a, b, s, f);
        #0 a=1'b0;b=1'b1;
        #2 s=1'b1;
        #5 s=1'b0;
        #10 a=1'b1;b=1'b0;
        #15 s=1'b1;
        #20 s=1'b0;
        #100 $finish;
    end
endmodule