`timescale 1ns / 1ps

module brent_kung_adder #(parameter N = 32) (
    input  logic [N-1:0] a,
    input  logic [N-1:0] b, 
    output logic [N-1:0] sum,
    output logic carry_out
);

    logic [N-1:0] g, p; 
    logic [N:0] c; 
    
    // Generate and Propagate signals
    assign g = a & b; 
    assign p = a ^ b; 
    
    // Initial carry-in
    assign c[0] = 0;

    // Prefix sum computation using the Brent-Kung method
    genvar i;
    for (i = 0; i < N; i++) begin
        assign c[i+1] = g[i] | (p[i] & c[i]);
    end

    // Sum calculation
    assign sum = p ^ c[N-1:0];

    // Final carry-out
    assign carry_out = c[N];
endmodule
