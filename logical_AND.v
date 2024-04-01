`timescale 1ns / 1ps

// Design Name: Logical AND operation 
// Module Name: logical_AND
// Project Name: 32-bit ALU 



module logical_AND(
input [31:0]a,b,
output reg [31:0]c
    );
    
    always @(*)begin 
        c = a&&b;

    end 
endmodule
