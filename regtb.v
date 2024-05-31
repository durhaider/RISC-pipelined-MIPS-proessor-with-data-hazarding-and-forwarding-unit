`timescale 1ns / 1ps

module regfile_tb;

    // Inputs
    reg [31:0] write_data;
    reg rst;
    reg clk;
    reg regwrite;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;

    // Outputs
    wire [31:0] rdata1;
    wire [31:0] rdata2;

    // Instantiate the Unit Under Test (UUT)
    regfile uut (
        .rdata1(rdata1),
        .rdata2(rdata2),
        .write_data(write_data),
        .rst(rst),
        .clk(clk),
        .regwrite(regwrite),
        .rs(rs),
        .rt(rt),
        .rd(rd)
    );

    initial begin
        // Initialize Inputs
        write_data = 0;
        rst = 0;
        clk = 0;
        regwrite = 0;
        rs = 0;
        rt = 0;
        rd = 0;

        // Apply a reset
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Read initial values
        rs = 5'd1;
        rt = 5'd2;
        #10;
        $display("rdata1: %d, rdata2: %d", rdata1, rdata2);

        // Write a value to register 3 and read it back
        rd = 5'd3;
        write_data = 32'd123;
        regwrite = 1;
        #10;
        clk = 1; #10; clk = 0; #10; // Generate a clock pulse
        regwrite = 0;
        #10;

        rs = 5'd3;
        rt = 5'd2;
        #10;
        $display("rdata1: %d, rdata2: %d", rdata1, rdata2);

        // Write a value to register 5 and read it back
        rd = 5'd5;
        write_data = 32'd456;
        regwrite = 1;
        #10;
        clk = 1; #10; clk = 0; #10; // Generate a clock pulse
        regwrite = 0;
        #10;

        rs = 5'd5;
        rt = 5'd2;
        #10;
        $display("rdata1: %d, rdata2: %d", rdata1, rdata2);

        // Add more test vectors if necessary

        // End of simulation
        #10; $stop;
    end

endmodule
