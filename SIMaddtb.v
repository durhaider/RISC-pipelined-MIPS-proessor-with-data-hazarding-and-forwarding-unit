`timescale 1ns / 1ps

module simpleadder_tb;

  // Inputs
  reg [31:0] a;
  reg [31:0] b;

  // Outputs
  wire [31:0] out;

  // Instantiate the Unit Under Test (UUT)
  simpleadder uut (
    .a(a),
    .b(b),
    .out(out)
  );

  initial begin
    // Initialize Inputs
    a = 32'd0;
    b = 32'd0;

    // Wait 100 ns for global reset to finish
    #100;

    // Add stimulus here
    // Test case 1: Add two small numbers
    #10 a = 32'd15; b = 32'd10;
    #10 $display("a = %d, b = %d, out = %d", a, b, out);

    // Test case 2: Add a positive and a negative number
    #10 a = 32'd20; b = -32'd5;
    #10 $display("a = %d, b = %d, out = %d", a, b, out);

    // Test case 3: Add two negative numbers
    #10 a = -32'd10; b = -32'd5;
    #10 $display("a = %d, b = %d, out = %d", a, b, out);

    // Test case 4: Add zero to a number
    #10 a = 32'd0; b = 32'd123;
    #10 $display("a = %d, b = %d, out = %d", a, b, out);

    // Test case 5: Add two large numbers
    #10 a = 32'd100000; b = 32'd200000;

    #10 $display("a = %d, b = %d, out = %d", a, b, out);

    // Test case 6: Add the maximum positive and negative 32-bit integers
    #10 a = 32'h7FFFFFFF; b = 32'h80000000;
    #10 $display("a = %h, b = %h, out = %h", a, b, out);

    // Finish simulation
    #10 $finish;
  end

endmodule
