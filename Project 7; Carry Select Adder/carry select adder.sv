`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 01:24:13
// Design Name: 
// Module Name: carry select adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module carry_save_adder #(parameter N=4)(
input logic [N -1:0] a ,
 input logic [N -1:0] b ,
input logic [N -1:0] c ,
output logic [N -1:0] sum ,
output logic [N -1:0] carry
   );
   assign sum = a ^ b ^ c ;
 assign carry = ( a & b )| ( b & c )| ( c & a ) ;
endmodule
