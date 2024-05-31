`timescale 1ns / 1ps

module PCm_tb;

    // Inputs
    reg clk;
    reg rst;
    reg PC_write;
    reg [31:0] pc_in;

    // Outputs
    wire [31:0] pc_out;

    // Instantiate the Unit Under Test (UUT)
    PCm uut (
        .pc_in(pc_in),
        .pc_out(pc_out),
        .clk(clk),
        .rst(rst),
        .PC_write(PC_write)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 0;
        PC_write = 0;
        pc_in = 0;

        // Reset the system
        rst = 1;
        #10;
        rst = 0;

        // Apply test vectors
        #10;
        PC_write = 1;
        pc_in = 32'd100;
        #10;
        PC_write = 0;
        #10;
        PC_write = 1;
        pc_in = 0;
        #10;
        PC_write = 1;
        pc_in = 32'd200;
        #10;
        PC_write = 1;
        pc_in = 0;
        #10;
        PC_write = 1;
        pc_in = 0;
        #10;
        PC_write = 0;
        #10;

        // End of simulation
        $stop;
    end
endmodule
