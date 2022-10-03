`include "FADDER.v"

module FADDER8BIT(s,i,o,a,b);
    input i;
    output o;
    output [0:7] s;
    input [0:7] a,b;
    wire d0,d1,d2,d3,d4,d5,d6;

    FADDER F0(s[0],d0,a[0],b[0],i);
    FADDER F1(s[1],d1,a[1],b[1],d0);
    FADDER F2(s[2],d2,a[2],b[2],d1);
    FADDER F3(s[3],d3,a[3],b[3],d2);
    FADDER F4(s[4],d4,a[4],b[4],d3);
    FADDER F5(s[5],d5,a[5],b[5],d4);
    FADDER F6(s[6],d6,a[6],b[6],d5);
    FADDER F7(s[7],o,a[7],b[7],d6);
endmodule

// module test_8BITFADDER; 
//     reg [0:7]a;
//     reg [0:7]b;
//     wire [0:7]s;
//     reg cin;
//     wire cout;    
//     FADDER8BIT add(s,cin,cout,a,b);
//     initial
//     begin
//         $monitor("a=%b | b=%b | cin=%b | sum=%b | cout=%b",a,b,cin,s,cout);
//     end
//     initial 
//     begin
//         a=8'b00000001; b=8'b00000001; cin=1'b0;
//         #3 a=8'b00001101; b=8'b00000111; cin=1'b1;
//         #3 a=8'b11101101; b=8'b10010100; cin=1'b0;
//         #3 a=8'b01000000; b=8'b11110011; cin=1'b0;
//         #3 a=8'b01010101; b=8'b10101010; cin=1'b0;
//     end
// endmodule