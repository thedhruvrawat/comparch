 module mux_4to1 (output [31:0] regData, input [31:0] q0, input [31:0] q1, input [31:0] q2, input [31:0] q3, input [1:0] reg_no);
    reg regData;
    always @(reg_no) begin
        case (reg_no)
            2'b00: regData = q0;
            2'b01: regData = q1;
            2'b10: regData = q2;
            2'b11: regData = q3;
        endcase
    end
endmodule

module decoder2_4 (register, reg_no);
    input [1:0] reg_no;
    output reg [3:0] register;
    always @(reg_no) begin
        case (reg_no)
            2'b00 : assign register = 4'b0001;
            2'b01 : assign register = 4'b0010;
            2'b10 : assign register = 4'b0100;
            2'b11 : assign register = 4'b1000;
        endcase
    end
    
endmodule