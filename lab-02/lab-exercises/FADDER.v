`include "DECODER.v"

module FADDER(s,c,x,y,z);
    input x,y,z;
    wire d0,d1,d2,d3,d4,d5,d6,d7;
    output s,c;
    DECODER dec(d0,d1,d2,d3,d4,d5,d6,d7,x,y,z);
    assign s = d1 | d2 | d4 | d7, c = d3 | d5 | d6 | d7;
endmodule

// module testbench;
//     reg x,y,z;
//     wire s,c;
//     FADDER fl(s,c,x,y,z);
//     initial
//     $monitor(,$time,"x=%b,y=%b,z=%b,s=%b,c=%b",x,y,z,s,c);
//     initial
//     begin
//         #0 x=1'b0;y=1'b0;z=1'b0;
//         #4 x=1'b1;y=1'b0;z=1'b0;
//         #4 x=1'b0;y=1'b1;z=1'b0;
//         #4 x=1'b1;y=1'b1;z=1'b0;
//         #4 x=1'b0;y=1'b0;z=1'b1;
//         #4 x=1'b1;y=1'b0;z=1'b1;
//         #4 x=1'b0;y=1'b1;z=1'b1;
//         #4 x=1'b1;y=1'b1;z=1'b1;
//     end
// endmodule