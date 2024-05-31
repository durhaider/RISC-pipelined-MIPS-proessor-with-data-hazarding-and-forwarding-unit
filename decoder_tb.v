`timescale 1ns / 1ps

module decoder_tb;

    // Inputs
    reg clk;
    reg rst;
    reg [31:0] instruction;

    // Outputs
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [15:0] constant;
    wire [5:0] opcode;
    wire [4:0] shiftam;

    // Instantiate the Unit Under Test (UUT)
    decoder uut (
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .constant(constant),
        .opcode(opcode),
        .shiftam(shiftam)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 0;
        instruction = 32'd0;

        // Apply reset
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Apply test vectors
        instruction = 32'b000000_10001_10010_10011_00000_100000; // Example R-type instruction
        #10;

        instruction = 32'b100011_10001_10010_0000000000000100; // Example I-type instruction (lw)
        #10;

        instruction = 32'b000010_00000000000000000000000010; // Example J-type instruction (jump)
        #10;

        instruction = 32'b000100_10001_10010_0000000000000001; // Example beq instruction
        #10;

        // End of simulation
        $stop;
    end
endmodule
