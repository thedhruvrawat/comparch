`include "FADDER.v"

module ADDSUB(a,b,m,s,c,v);
    input [0:3] a,b;
    input m;
    output c, v;
    output [0:3] s;
    wire b0,b1,b2,b3;
    assign b0 = b[0]^m;
    assign b1 = b[1]^m;
    assign b2 = b[2]^m;
    assign b3 = b[3]^m;
    wire c1,c2,c3;
    FADDER f1(s[0],c1,a[0],b0,m);
    FADDER f2(s[1],c2,a[1],b1,m);
    FADDER f3(s[2],c3,a[2],b2,m);
    FADDER f4(s[3],c,a[3],b3,m);
    assign v = c^c3;
endmodule

module test_addsub; 
    reg [3:0]a;
    reg [3:0]b;
    wire [3:0]s;
    reg m;
    wire c,v;    
    ADDSUB add(a,b,m,s,c,v);
    initial
    begin
        $monitor("a=%b | b=%b | m=%b | s=%b | cout=%b | v=%b",a,b,m,s,c,v);
    end
    initial 
    begin
        a=4'b0000; b=4'b0001; m=1'b0;
        #3 a=4'b1111; b=4'b1000; m=1'b1;
        #3 a=4'b1111; b=4'b0010; m=1'b1;
        #3 a=4'b1111; b=4'b1111; m=1'b1;
        #3 a=4'b0001; b=4'b1100; m=1'b1;
    end
endmodule