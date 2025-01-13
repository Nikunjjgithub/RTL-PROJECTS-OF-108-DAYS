`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2024 11:18:56
// Design Name: 
// Module Name: tb_carry_bypass_adder
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


module tb_carry_bypass_adder;

    // Parameters
    parameter WIDTH = 16;
    parameter BLOCK_SIZE = 4;

    // Inputs
    logic [WIDTH-1:0] A, B;
    logic Cin;

    // Outputs
    logic [WIDTH-1:0] Sum;
    logic Cout;

    // Instantiate the Unit Under Test (UUT)
    carry_bypass_adder #(WIDTH, BLOCK_SIZE) uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Test stimulus
    initial begin
        // Test case 1
        A = 16'h1234;
        B = 16'h5678;
        Cin = 1'b0;
        #10;
        $display("TC1: A = %h, B = %h, Cin = %b -> Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // Test case 2
        A = 16'hFFFF;
        B = 16'h0001;
        Cin = 1'b0;
        #10;
        $display("TC2: A = %h, B = %h, Cin = %b -> Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // Test case 3
        A = 16'hAAAA;
        B = 16'h5555;
        Cin = 1'b1;
        #10;
        $display("TC3: A = %h, B = %h, Cin = %b -> Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // Test case 4
        A = 16'h0FFF;
        B = 16'hF000;
        Cin = 1'b0;
        #10;
        $display("TC4: A = %h, B = %h, Cin = %b -> Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // End simulation
        $stop;
    end

endmodule


