`timescale 1ns / 1ps


module EX_MEM_tb;

  // Inputs
  reg clk;
  reg [31:0] ALUoutin;
  reg zeroin;
  reg [31:0] addresultin;
  reg [31:0] rdata2in;
  reg [4:0] rt_rdin;
  reg rst;
  reg Jumpin1;
  reg Branchin1;
  reg Memreadin1;
  reg MemtoRegin1;
  reg Memwritin1;
  reg Regwritein1;

  // Outputs
  wire [31:0] ALUoutout;
  wire zeroout;
  wire [31:0] addresultout;
  wire [31:0] rdata2out;
  wire [4:0] rt_rdout;
  wire Jumpout1;
  wire Branchout1;
  wire Memreadout1;
  wire MemtoRegout1;
  wire Memwritout1;
  wire Regwriteout1;

  // Instantiate the Unit Under Test (UUT)
  EX_MEM uut (
    .clk(clk), 
    .ALUoutin(ALUoutin), 
    .zeroin(zeroin), 
    .addresultin(addresultin), 
    .rdata2in(rdata2in), 
    .rt_rdin(rt_rdin), 
    .ALUoutout(ALUoutout), 
    .zeroout(zeroout), 
    .addresultout(addresultout), 
    .rdata2out(rdata2out), 
    .rt_rdout(rt_rdout), 
    .rst(rst), 
    .Jumpin1(Jumpin1), 
    .Branchin1(Branchin1), 
    .Memreadin1(Memreadin1), 
    .MemtoRegin1(MemtoRegin1), 
    .Memwritin1(Memwritin1), 
    .Regwritein1(Regwritein1), 
    .Jumpout1(Jumpout1), 
    .Branchout1(Branchout1), 
    .Memreadout1(Memreadout1), 

    .MemtoRegout1(MemtoRegout1), 
    .Memwritout1(Memwritout1), 
    .Regwriteout1(Regwriteout1)
  );

  initial begin
    // Initialize Inputs
    clk = 0;
    ALUoutin = 32'd0;
    zeroin = 0;
    addresultin = 32'd0;
    rdata2in = 32'd0;
    rt_rdin = 5'd0;
    rst = 1;
    Jumpin1 = 0;
    Branchin1 = 0;
    Memreadin1 = 0;
    MemtoRegin1 = 0;
    Memwritin1 = 0;
    Regwritein1 = 0;

    // Wait 100 ns for global reset to finish
    #100;
    rst = 0;

    // Add stimulus here
    // Test case 1: Normal operation
    #10 ALUoutin = 32'd1234; zeroin = 1; addresultin = 32'd5678; rdata2in = 32'd4321; rt_rdin = 5'd10;
        Jumpin1 = 1; Branchin1 = 1; Memreadin1 = 1; MemtoRegin1 = 1; Memwritin1 = 1; Regwritein1 = 1;

    // Test case 2: Apply reset
    #10 rst = 1;
    #10 rst = 0;

    // Test case 3: Normal operation after reset
    #10 ALUoutin = 32'd8765; zeroin = 0; addresultin = 32'd4321; rdata2in = 32'd1234; rt_rdin = 5'd5;
        Jumpin1 = 0; Branchin1 = 0; Memreadin1 = 0; MemtoRegin1 = 0; Memwritin1 = 0; Regwritein1 = 0;

    // Finish simulation
    #10 $finish;
  end
  
  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Monitor changes
    $monitor("At time %0t: clk = %b, rst = %b, ALUoutin = %d, zeroin = %b, addresultin = %d, rdata2in = %d, rt_rdin = %d, 

Jumpin1 = %b, Branchin1 = %b, Memreadin1 = %b, MemtoRegin1 = %b, Memwritin1 = %b, Regwritein1 = %b, ALUoutout = %d, zeroout = %b, addresultout = %d, rdata2out = %d, rt_rdout = %d, Jumpout1 = %b, Branchout1 = %b, Memreadout1 = %b, MemtoRegout1 = %b, Memwritout1 = %b, Regwriteout1 = %b",
             $time, clk, rst, ALUoutin, zeroin, addresultin, rdata2in, rt_rdin, Jumpin1, Branchin1, Memreadin1, MemtoRegin1, Memwritin1, Regwritein1, ALUoutout, zeroout, addresultout, rdata2out, rt_rdout, Jumpout1, Branchout1, Memreadout1, MemtoRegout1, Memwritout1, Regwriteout1);
  end

endmodule
