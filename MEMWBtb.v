`timescale 1ns / 1ps

module MEM_WB_tb;

  // Inputs
  reg [31:0] memrdatain;
  reg [31:0] ALUresultin;
  reg [4:0] rt_rddin;
  reg clk;
  reg rst;
  reg MemtoRegin2;
  reg Regwritein2;

  // Outputs
  wire [31:0] memrdataout;
  wire [31:0] ALUresultout;
  wire [4:0] rt_rddout;
  wire MemtoRegout2;
  wire Regwriteout2;

  // Instantiate the Unit Under Test (UUT)
  MEM_WB uut (
    .memrdatain(memrdatain),
    .ALUresultin(ALUresultin),


    .rt_rddin(rt_rddin),
    .memrdataout(memrdataout),
    .ALUresultout(ALUresultout),
    .rt_rddout(rt_rddout),
    .clk(clk),
    .rst(rst),
    .MemtoRegin2(MemtoRegin2),
    .Regwritein2(Regwritein2),
    .MemtoRegout2(MemtoRegout2),
    .Regwriteout2(Regwriteout2)
  );

  initial begin
    // Initialize Inputs
    memrdatain = 32'd0;
    ALUresultin = 32'd0;
    rt_rddin = 5'd0;
    clk = 0;
    rst = 1;
    MemtoRegin2 = 0;
    Regwritein2 = 0;

    // Wait 100 ns for global reset to finish
    #100;
    rst = 0;

    // Add stimulus here
    // Test case 1: Normal operation
    #10 memrdatain = 32'd1234; ALUresultin = 32'd5678; rt_rddin = 5'd10; MemtoRegin2 = 1; Regwritein2 = 1;

    // Test case 2: Apply reset
    #10 rst = 1;
    #10 rst = 0;

    // Test case 3: Normal operation after reset
    #10 memrdatain = 32'd8765; ALUresultin = 32'd4321; rt_rddin = 5'd5; MemtoRegin2 = 0; Regwritein2 = 0;

    // Finish simulation
    #10 $finish;
  end
  
  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Monitor changes
    $monitor("At time %0t: clk = %b, rst = %b, memrdatain = %d, ALUresultin = %d, rt_rddin = %d, MemtoRegin2 = %b, Regwritein2 = %b, memrdataout = %d, ALUresultout = %d, rt_rddout = %d, MemtoRegout2 = %b, Regwriteout2 = %b",

             $time, clk, rst, memrdatain, ALUresultin, rt_rddin, MemtoRegin2, Regwritein2, memrdataout, ALUresultout, rt_rddout, MemtoRegout2, Regwriteout2);
  end

endmodule
