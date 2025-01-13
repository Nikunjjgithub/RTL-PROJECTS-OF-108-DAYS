module tb_ling_adder;

    parameter WIDTH = 4;
    
    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] b;
    logic cin;
    logic [WIDTH-1:0] sum;
    logic cout;

    // Instantiate the Ling Adder
    ling_adder #(.WIDTH(WIDTH)) uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Testbench stimulus
    initial begin
        // Apply test vectors
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        $display("Test Case 1: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        a = 4'b0011; b = 4'b0101; cin = 0; #10;
        $display("Test Case 2: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        a = 4'b1111; b = 4'b0001; cin = 1; #10;
        $display("Test Case 3: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        a = 4'b1010; b = 4'b1100; cin = 0; #10;
        $display("Test Case 4: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        a = 4'b0110; b = 4'b0011; cin = 1; #10;
        $display("Test Case 5: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);

        $stop;
    end

endmodule
