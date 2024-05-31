`timescale 1ns / 1ps

module instruct_memory_tb;

  // Inputs
  reg [31:0] address;
  reg clk;
  reg rst;

  // Outputs
  wire [31:0] instruction;

  // Instantiate the Unit Under Test (UUT)
  instruct_memory uut (
    .address(address), 
    .instruction(instruction), 
    .clk(clk), 
    .rst(rst)
  );

  initial begin
    // Initialize Inputs
    address = 0;
    clk = 0;
    rst = 1;


    // Wait 100 ns for global reset to finish
    #100;
    rst = 0;

    // Add stimulus here
    address = 32'd0;
    #10;
    address = 32'd1;
    #10;

    address = 32'd2;
    #10;
    address = 32'd3;
    #10;
    address = 32'd4;
    #10;
    address = 32'd9; // Out of range address
    #10;
    
    // Test reset functionality
    rst = 1;
    #10;
    rst = 0;
    address = 32'd2;
    #10;
  end
  
  // Clock generation
  always #5 clk = ~clk;

endmodule
