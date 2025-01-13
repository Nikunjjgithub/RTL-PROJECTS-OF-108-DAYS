`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 11:37:24
// Design Name: 
// Module Name: tb_ladner_fischer_adder
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


module tb_ladner_fischer_adder();

    parameter WIDTH = 16;

    logic [WIDTH-1:0] A, B;    // Test inputs
    logic Cin;                 // Carry-in
    logic [WIDTH-1:0] Sum;     // Test output sum
    logic Cout;                // Carry-out

    // Instantiate the Ladner-Fischer Adder
    ladner_fischer_adder #(WIDTH) dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test Case 1
        A = 16'h1234; B = 16'h5678; Cin = 1'b0;
        #10;
        $display("A = %h, B = %h, Cin = %b, Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // Test Case 2
        A = 16'hFFFF; B = 16'h0001; Cin = 1'b0;
        #10;
        $display("A = %h, B = %h, Cin = %b, Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // Test Case 3
        A = 16'hAAAA; B = 16'h5555; Cin = 1'b1;
        #10;
        $display("A = %h, B = %h, Cin = %b, Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // Add more test cases as needed

        $stop;
    end

endmodule

