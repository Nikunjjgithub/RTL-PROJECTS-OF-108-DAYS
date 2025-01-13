`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 11:54:48
// Design Name: 
// Module Name: ling_adder
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


module ling_adder #(parameter WIDTH = 4) (
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,
    input logic cin,
    output logic [WIDTH-1:0] sum,
    output logic cout
);

    logic [WIDTH-1:0] g;  // Generate
    logic [WIDTH-1:0] p;  // Propagate
    logic [WIDTH-1:0] h;  // Ling's carry
    logic [WIDTH-1:0] c;  // Carry

    // Generate and Propagate
    assign g = a & b;
    assign p = a | b;

    // Ling's carry computation
    assign h = g | (p & {g[WIDTH-2:0], cin});

    // Carry computation
    assign c[0] = cin;
    assign c[WIDTH-1:1] = h[WIDTH-2:0];

    // Sum computation
    assign sum = a ^ b ^ c;
    assign cout = h[WIDTH-1];

endmodule

