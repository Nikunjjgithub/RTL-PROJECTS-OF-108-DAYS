`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 11:35:37
// Design Name: 
// Module Name: ladner_fischer_adder
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


module ladner_fischer_adder #(parameter WIDTH = 16) (
    input  logic [WIDTH-1:0] A, B,     // Input operands
    input  logic             Cin,      // Carry-in
    output logic [WIDTH-1:0] Sum,      // Sum output
    output logic             Cout      // Carry-out
);

    logic [WIDTH-1:0] G, P;            // Generate and propagate
    logic [WIDTH-1:0] carry;           // Carry signals

    // Generate and propagate signals
    assign G = A & B;                  // Generate: G[i] = A[i] & B[i]
    assign P = A ^ B;                  // Propagate: P[i] = A[i] ^ B[i]

    // Carry lookahead logic using Ladner-Fischer structure
    assign carry[0] = Cin;
    
    genvar i;
    generate
        for (i = 1; i < WIDTH; i = i + 1) begin
            assign carry[i] = G[i-1] | (P[i-1] & carry[i-1]);
        end
    endgenerate

    // Sum and carry-out
    assign Sum = P ^ carry;
    assign Cout = G[WIDTH-1] | (P[WIDTH-1] & carry[WIDTH-1]);

endmodule

