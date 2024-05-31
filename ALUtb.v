`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg [3:0] opcode;
    reg [31:0] a;
    reg [31:0] b;
    reg [4:0] shamt;

    // Outputs
    wire [31:0] out;
    wire zero;

    // Instantiate the Unit Under Test (UUT)
    ALU uut (
        .opcode(opcode),
        .a(a),
        .b(b),
        .out(out),
        .zero(zero),
        .shamt(shamt)
    );

    initial begin
        // Initialize Inputs
        opcode = 0;
        a = 0;
        b = 0;
        shamt = 0;

        // Add stimulus here
        // Test Add
        opcode = 4'd2; a = 32'd10; b = 32'd15; #10;
        $display("ADD: a=%d, b=%d, out=%d, zero=%b", a, b, out, zero);

        // Test Subtract
        opcode = 4'd6; a = 32'd20; b = 32'd10; #10;
        $display("SUBTRACT: a=%d, b=%d, out=%d, zero=%b", a, b, out, zero);

        // Test AND
        opcode = 4'd0; a = 32'hFF00FF00; b = 32'h0F0F0F0F; #10;
        $display("AND: a=%h, b=%h, out=%h, zero=%b", a, b, out, zero);

        // Test OR
        opcode = 4'd1; a = 32'hFF00FF00; b = 32'h0F0F0F0F; #10;
        $display("OR: a=%h, b=%h, out=%h, zero=%b", a, b, out, zero);

        // Test SLT
        opcode = 4'd7; a = 32'd10; b = 32'd20; #10;
        $display("SLT: a=%d, b=%d, out=%d, zero=%b", a, b, out, zero);

        // Test BEQ
        opcode = 4'b0110; a = 32'd10; b = 32'd10; #10;
        $display("BEQ: a=%d, b=%d, out=%d, zero=%b", a, b, out, zero);

        // Test SW
        opcode = 4'b0100; a = 32'd100; b = 32'd4; #10;
        $display("SW: a=%d, b=%d, out=%d, zero=%b", a, b, out, zero);

        // Test Shift
        opcode = 4'd8; a = 32'd1; shamt = 5'd4; #10;
        $display("SHIFT: a=%d, shamt=%d, out=%d, zero=%b", a, shamt, out, zero);

        // Test default case
        opcode = 4'd15; a = 32'd123; b = 32'd456; #10;
        $display("DEFAULT: a=%d, b=%d, out=%h, zero=%b", a, b, out, zero);

        // End simulation
        $stop;
    end

endmodule
