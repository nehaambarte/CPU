`timescale 1ns / 1ps

// Design Name: 
// Module Name: modulo_op
// Project Name: 


module modulo_op(
input [31:0]a,b,
input reset,
output [31:0] result 
    );

 division (  .rst(reset),.dividend(a), .divisor(b),.remainder(result));
   
    

endmodule
