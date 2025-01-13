`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 23:10:48
// Design Name: 
// Module Name: tb_han_carlson_adder
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

module tb_han_carlson_adder;

    // Testbench signals
    logic [15:0] a;
    logic [15:0] b;
    logic cin;
    logic [15:0] sum;
    logic cout;

    // Instantiate the Han-Carlson adder
    han_carlson_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Stimulus process
    initial begin
        // Display header
        $display("A\tB\tCin\tSum\t\tCout");

        // Test case 1
        a = 16'h00FF; b = 16'h0001; cin = 0;
        #10;
        $display("%h\t%h\t%b\t%h\t%b", a, b, cin, sum, cout);

        // Test case 2
        a = 16'hFFFF; b = 16'hFFFF; cin = 1;
        #10;
        $display("%h\t%h\t%b\t%h\t%b", a, b, cin, sum, cout);

        // Test case 3
        a = 16'h1234; b = 16'hABCD; cin = 0;
        #10;
        $display("%h\t%h\t%b\t%h\t%b", a, b, cin, sum, cout);

        // Test case 4
        a = 16'h5678; b = 16'h9ABC; cin = 1;
        #10;
        $display("%h\t%h\t%b\t%h\t%b", a, b, cin, sum, cout);

        // End simulation
        $finish;
    end

endmodule

