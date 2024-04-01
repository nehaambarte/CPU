`timescale 1ns / 1ps

// Design Name: bitwise xor operation 
// Module Name: bitwise_xor
// Project Name: 32-bit ALU 



module bitwise_xor(
input [31:0]a,b,
output reg [31:0]c
    );
    
   always @(*)begin 
    c = a ^ b;   // bitwise xor operation 
   end 
endmodule
