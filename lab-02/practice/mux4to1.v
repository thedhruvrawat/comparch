module mux4to1(out, in, sel);
    input [0:3] in;
    input [0:1] sel;
    output out;
    wire n1,n2,a1,a2,a3,a4;
    not n(n1,sel[1]);
    not nn(n2,sel[0]);
    and (a1, in[0],n1,n2);
    and (a2,in[1],n2,sel[1]);
    and (a3,in[2],sel[0],n1);
    and (a4,in[3],sel[0],sel[1]);
    or or1(out,a1,a2,a3,a4);
endmodule

// module test_mux4to1; 
//     reg [0:3] in;
//     reg [0:1] sel;
//     wire out;    
//     mux4to1 mux(out,in,sel);
//     initial
//     begin
//         $monitor("in=%b | sel=%b | out=%b",in,sel,out);
//     end
//     initial 
//     begin
//         in=4'b1000; sel=1'b0;
//         #3 in=4'b0100; sel=1'b0; 
//         #3 in=4'b0010; sel=1'b0;
//         #3 in=4'b0001; sel=1'b0; 
//         #3 in=4'b1000; sel=1'b1;
//         #3 in=4'b0100; sel=1'b1; 
//         #3 in=4'b0010; sel=1'b1;
//         #3 in=4'b0001; sel=1'b1; 
//     end
// endmodule