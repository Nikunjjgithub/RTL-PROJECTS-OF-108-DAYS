`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 01:42:44
// Design Name: 
// Module Name: tb_carry_save_adder
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


module tb_carry_save_adder;
parameter N = 4;
 logic [N -1:0] a , b , c ;
 logic [N -1:0] sum , carry ;

carry_save_adder #( N ) csa (. a ( a ) , . b ( b ) , . c ( c ) , . sum ( sum ) ,
. carry ( carry ) ) ;
initial begin
//Test cases
 a = 4'b0011 ; b = 4'b0101 ; c = 4'b0110 ; #10;
 $display(" A=%b , B=%b , C=%b , SUM=%b , CARRY=%b", a,b,c,sum,carry);
   
 a = 4'b1111 ; b = 4'b0001 ; c = 4'b0001 ; #10;
 $display(" A=%b , B=%b , C=%b , SUM=%b , CARRY=%b", a,b,c,sum,carry);
 a = 4'b1001 ; b = 4'b1001 ; c = 4'b1001 ; #10;
 $display(" A=%b , B=%b , C=%b , SUM=%b , CARRY=%b", a,b,c,sum,carry);
 
 $finish;

 end
 endmodule

    

