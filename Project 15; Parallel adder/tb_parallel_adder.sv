`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gati Goyal
// 
// Create Date: 03.09.2024 21:54:04
// Design Name: 
// Module Name: tb_parallel_adder
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


module tb_parallel_adder;

    // Testbench signals
    logic [3:0] A_tb;
    logic [3:0] B_tb;
    logic       Cin_tb;
    logic [3:0] Sum_tb;
    logic       Cout_tb;

    // Instantiate the parallel adder
    parallel_adder uut (
        .A(A_tb),
        .B(B_tb),
        .Cin(Cin_tb),
        .Sum(Sum_tb),
        .Cout(Cout_tb)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        A_tb = 4'b0000;
        B_tb = 4'b0000;
        Cin_tb = 1'b0;
        #10;

        // Test case 1
        A_tb = 4'b0011; // 3
        B_tb = 4'b0101; // 5
        Cin_tb = 1'b0;
        #10;
        $display("Test Case 1: A=3, B=5, Cin=0 => Sum=%b, Cout=%b", Sum_tb, Cout_tb);

        // Test case 2
        A_tb = 4'b1111; // 15
        B_tb = 4'b0001; // 1
        Cin_tb = 1'b0;
        #10;
        $display("Test Case 2: A=15, B=1, Cin=0 => Sum=%b, Cout=%b", Sum_tb, Cout_tb);

        // Test case 3
        A_tb = 4'b1001; // 9
        B_tb = 4'b0110; // 6
        Cin_tb = 1'b1;
        #10;
        $display("Test Case 3: A=9, B=6, Cin=1 => Sum=%b, Cout=%b", Sum_tb, Cout_tb);

        // Test case 4
        A_tb = 4'b0110; // 6
        B_tb = 4'b0111; // 7
        Cin_tb = 1'b1;
        #10;
        $display("Test Case 4: A=6, B=7, Cin=1 => Sum=%b, Cout=%b", Sum_tb, Cout_tb);

        // Finish the simulation
        $stop;
    end

endmodule

