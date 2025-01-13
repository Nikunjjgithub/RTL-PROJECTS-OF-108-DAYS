`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 23:10:05
// Design Name: 
// Module Name: han_carlson_adder
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

module han_carlson_adder (
    input  logic [15:0] a,      // 16-bit input A
    input  logic [15:0] b,      // 16-bit input B
    input  logic         cin,    // Carry-in
    output logic [15:0] sum,    // 16-bit sum
    output logic         cout    // Carry-out
);

    logic [15:0] p, g;           // Propagate and Generate
    logic [15:0] c;              // Carry

    // Generate and propagate signals
    assign p = a ^ b;            // Propagate signal
    assign g = a & b;            // Generate signal

    // Carry calculation using Han-Carlson logic
    assign c[0] = cin;
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin : carry_gen
            assign c[i] = g[i-1] | (p[i-1] & c[i-1]);
        end
    endgenerate

    // Sum calculation
    assign sum = p ^ c;

    // Carry-out
    assign cout = g[15] | (p[15] & c[15]);

endmodule

