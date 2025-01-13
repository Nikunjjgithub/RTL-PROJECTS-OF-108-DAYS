`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gati Goyal
// 
// Create Date: 03.09.2024 21:52:28
// Design Name: 
// Module Name: parallel_adder
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

module parallel_adder (
    input  logic [3:0] A,   // 4-bit input A
    input  logic [3:0] B,   // 4-bit input B
    input  logic       Cin, // Carry-in
    output logic [3:0] Sum, // 4-bit Sum output
    output logic       Cout // Carry-out
);

    // Intermediate signals for carry
    logic [3:0] carry;

    // Full adder for each bit
    assign {carry[0], Sum[0]} = A[0] + B[0] + Cin;
    assign {carry[1], Sum[1]} = A[1] + B[1] + carry[0];
    assign {carry[2], Sum[2]} = A[2] + B[2] + carry[1];
    assign {carry[3], Sum[3]} = A[3] + B[3] + carry[2];

    // Final carry-out
    assign Cout = carry[3];

endmodule

