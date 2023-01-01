module d_ff(q, d, clk, reset);
    input d, clk, reset;
    output q;
    reg q;
    always @(posedge clk) begin
        if(!reset) q<=1'b0;
        else q<=d;
    end
endmodule

module reg_32bit(q, d, clk, reset);
    input[31:0] d;
    input clk, reset;
    output[31:0] q;
    genvar j;
    generate
        for(j=0; j<=31; j=j+1) begin: reg_loop
            d_ff k(q[j], d[j], clk, reset);
        end
    endgenerate
endmodule

// module tb32reg;
//     reg [31:0] d;
//     reg clk,reset;
//     wire [31:0] q;
//     reg_32bit R(q,d,clk,reset);
//     always @(clk)
//         #5 clk<=~clk;
//     initial
//     begin
//         $monitor(,$time, " q=%b, d=%b, reset = %b", q, d, reset);
//         clk= 1'b1;
//         reset=1'b0; //reset the register
//         #20 reset=1'b1;
//         #20 d=32'hAFAFAFAF;
//         #20 d=32'hAFCFBF0F; clk=1'b0;
//         #20 d=32'hAC043FAF; clk=1'b1;
//         #20 d=32'hAFAFA234;
//         #20 d=32'hAF245A6F;
//         #200 $finish;
//     end
// endmodule