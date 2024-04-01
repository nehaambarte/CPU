`timescale 1ns / 1ps

// Design Name: Logical Right shift 
// Module Name: logical_r_shift
// Project Name: 32-bit ALU 


module logical_r_shift(
input [31:0]a ,
input [31:0]b,
output reg[31:0] result
    );
    
    always @(*)begin 
        result <= a >> b;   
    end 
    
    
endmodule
