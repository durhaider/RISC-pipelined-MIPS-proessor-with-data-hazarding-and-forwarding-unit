`timescale 1ns / 1ps

module ALUcontrol_tb;

    // Inputs
    reg [5:0] instruction;
    reg [1:0] ALUOp;

    // Outputs
    wire [3:0] ALUcontrol;

    // Instantiate the Unit Under Test (UUT)
    ALUcontrol uut (
        .instruction(instruction),
        .ALUOp(ALUOp),
        .ALUcontrol(ALUcontrol)
    );

    initial begin
        // Initialize Inputs
        instruction = 6'd0;
        ALUOp = 2'd0;

        // Apply test vectors
        #10; instruction = 6'b100000; ALUOp = 2'b10; // R-type (add)
        #10; instruction = 6'b100010; ALUOp = 2'b10; // R-type (sub)
        #10; instruction = 6'b100100; ALUOp = 2'b10; // R-type (and)
        #10; instruction = 6'b100101; ALUOp = 2'b10; // R-type (or)
        #10; instruction = 6'b101010; ALUOp = 2'b10; // R-type (slt)
        #10; instruction = 6'b101111; ALUOp = 2'b10; // R-type (shift)

        #10; instruction = 6'bxxxxxx; ALUOp = 2'b00; // lw & sw
        #10; instruction = 6'bxxxxxx; ALUOp = 2'b01; // beq

        // Add more test vectors if necessary

        // End of simulation
        #10; $stop;
    end

endmodule
