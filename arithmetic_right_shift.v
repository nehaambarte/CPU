`timescale 1ns / 1ps


// Design Name: Arithmetic Right shift 
// Module Name: arithmetic_right_shift
// Project Name: 32-bit ALU 



module arithmetic_right_shift(
    input signed [31:0] operand,
    input [31:0] shift_amount,
    output reg signed [31:0] result
);

    always @* begin
            result <= operand >>> shift_amount ; 
        end
    

endmodule


