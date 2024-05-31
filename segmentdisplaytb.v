`timescale 1ns / 1ps

module svenn_tb;

    // Inputs
    reg clk;
    reg [31:0] instruction;
    reg [31:0] pc_out;
    reg [31:0] alu_out;
    reg [2:0] sel;

    // Outputs
    wire [3:0] anodes;
    wire [7:0] cathods;

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Instantiate the svenn module
    svenn svenn_inst (
        .anodes(anodes),
        .clk(clk),
        .cathods(cathods),
        .instruction(instruction),
        .pc_out(pc_out),
        .alu_out(alu_out),
        .sel(sel)
    );

    // Stimulus
    initial begin
        clk = 0;
        instruction = 32'h12345678;
        pc_out = 32'hABCDEF01;
        alu_out = 32'h87654321;
        sel = 3'b000;

        #10;
        sel = 3'b001;

        #10;
        sel = 3'b010;

        #10;
        sel = 3'b011;

        #10;
        sel = 3'b100;

        #10;
        sel = 3'b101;

        #100;
        $finish;
    end

endmodule
