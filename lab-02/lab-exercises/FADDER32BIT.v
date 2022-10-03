`include "FADDER8BIT.v"

module FADDER32BIT(s,cin,cout,a,b);
    input cin;
    output cout;
    output [0:31] s;
    input [0:31] a,b;
    wire d0,d1,d2;

    FADDER8BIT F0(s[0:7],cin,d0,a[0:7],b[0:7]);
    FADDER8BIT F1(s[8:15],d0,d1,a[8:15],b[8:15]);
    FADDER8BIT F2(s[16:23],d1,d2,a[16:23],b[16:23]);
    FADDER8BIT F3(s[24:31],d2,cout,a[24:31],b[24:31]);
endmodule

module test_32BITFADDER; 
    reg [0:31]a;
    reg [0:31]b;
    wire [0:31]s;
    reg cin;
    wire cout;    
    FADDER32BIT add(s,cin,cout,a,b);
    initial
    begin
        $monitor("a=%b | b=%b | cin=%b | sum=%b | cout=%b",a,b,cin,s,cout);
    end
    initial 
    begin
        a=32'b01010101010101010101010101010101; b=32'b00011010101010101010101010101010; cin=1'b0;
        #3 a=32'b00000000000000000000000000000000; b=32'b00000000000000000000000000001001; cin=1'b0;
        #3 a=32'b00000000000000000000000000000001; b=32'b00000000000000000000000000001111; cin=1'b1;
        #3 a=32'b00110000111100001111000011110000; b=32'b00111100001111000011110000111100; cin=1'b1;
    end
endmodule