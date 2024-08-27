`timescale 1ns / 1ps

module Test_Brent_kung_adder;

    parameter N = 32;
    logic [N-1:0] a, b;      // Test inputs
    logic [N-1:0] sum;       // Test output for the sum
    logic carry_out;         // Test output for the carry-out

    // Instantiate the Brent-Kung Adder
    brent_kung_adder #(N) bka (
        .a(a), 
        .b(b), 
        .sum(sum), 
        .carry_out(carry_out)
    );

    initial begin
        // Test case 1
        a = 32'h12345678; 
        b = 32'h87654321; 
        #10;
        $display("A = %h, B = %h, SUM = %h, Carry Out = %b", a, b, sum, carry_out);

        // Test case 2
        a = 32'hFFFFFFFF; 
        b = 32'h00000001; 
        #10;
        $display("A = %h, B = %h, SUM = %h, Carry Out = %b", a, b, sum, carry_out);

        // Test case 3
        a = 32'h0; 
        b = 32'h0; 
        #10;
        $display("A = %h, B = %h, SUM = %h, Carry Out = %b", a, b, sum, carry_out);
 a = 32'hFFFFFFFF; 
        b = 32'h00000001; 
        #10;
        $display("A = %h, B = %h, SUM = %h, Carry Out = %b", a, b, sum, carry_out);

        $finish;
    end 

endmodule
