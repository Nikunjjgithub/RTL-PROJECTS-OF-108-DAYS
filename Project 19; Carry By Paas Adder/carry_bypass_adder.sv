`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 11:18:05
// Design Name: 
// Module Name: carry_bypass_adder
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


module carry_bypass_adder #(parameter WIDTH = 16, parameter BLOCK_SIZE = 4) (
    input  logic [WIDTH-1:0] A, B,   // Inputs: A and B are binary numbers
    input  logic Cin,                // Carry in
    output logic [WIDTH-1:0] Sum,    // Output: Sum of A and B
    output logic Cout                // Carry out
);

    // Internal signals for carry, propagate, generate
    logic [WIDTH-1:0] P, G;  
    logic [(WIDTH/BLOCK_SIZE)-1:0] carry_skip; // Signals for carry skip condition
    logic [WIDTH:0] carry;    // Carry signals (including final carry out)

    assign carry[0] = Cin;  // Initial carry input

    // Step 1: Generate and propagate signals
    always_comb begin
        for (int i = 0; i < WIDTH; i++) begin
            P[i] = A[i] ^ B[i];  // Propagate signal
            G[i] = A[i] & B[i];  // Generate signal
        end
    end

    // Step 2: Ripple carry and bypass carry logic
    always_comb begin
        for (int i = 0; i < WIDTH; i++) begin
            if (i % BLOCK_SIZE == 0) begin
                // First bit of the block: carry ripple from the previous block or Cin
                carry[i+1] = G[i] | (P[i] & carry[i]);
            end else begin
                // Ripple carry within the block
                carry[i+1] = G[i] | (P[i] & carry[i]);
            end
        end

        // Carry bypass for each block
        for (int j = 0; j < (WIDTH / BLOCK_SIZE); j++) begin
            carry_skip[j] = &P[j*BLOCK_SIZE +: BLOCK_SIZE];  // Skip condition: all bits propagate
            if (carry_skip[j]) begin
                carry[(j+1)*BLOCK_SIZE] = carry[j*BLOCK_SIZE];  // Skip carry to the next block
            end
        end
    end

    // Step 3: Compute the sum bits
    always_comb begin
        for (int i = 0; i < WIDTH; i++) begin
            Sum[i] = P[i] ^ carry[i];  // Sum = Propagate XOR Carry
        end
    end

    assign Cout = carry[WIDTH];  // Final carry-out

endmodule



