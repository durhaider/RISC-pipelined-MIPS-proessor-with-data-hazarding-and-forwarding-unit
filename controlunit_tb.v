`timescale 1ns / 1ps

module controlunit_tb;

    // Inputs
    reg [5:0] opcode;

    // Outputs
    wire Regdst;
    wire Jump;
    wire Branch;
    wire Memread;
    wire MemtoReg;
    wire Memwrite;
    wire ALUSrc;
    wire Regwrite;
    wire [1:0] ALUOp;
    wire flush;

    // Instantiate the Unit Under Test (UUT)
    controlunit uut (
        .opcode(opcode),
        .Regdst(Regdst),
        .Jump(Jump),
        .Branch(Branch),
        .Memread(Memread),
        .MemtoReg(MemtoReg),
        .Memwrite(Memwrite),
        .ALUSrc(ALUSrc),
        .Regwrite(Regwrite),
        .ALUOp(ALUOp),
        .flush(flush)
    );

    initial begin
        // Initialize Inputs
        opcode = 6'b000000;

        // Wait for global reset to finish
        #10;

        // Apply test vectors
        // Test R-type instructions
        opcode = 6'b100000; #10;
        opcode = 6'b100010; #10;
        opcode = 6'b100100; #10;
        opcode = 6'b100101; #10;
        opcode = 6'b101010; #10;

        // Test lw instruction
        opcode = 6'b100011; #10;

        // Test sw instruction
        opcode = 6'b101011; #10;

        // Test beq instruction
        opcode = 6'b000100; #10;

        // Test jump instruction
        opcode = 6'b000010; #10;

        // Test default case
        opcode = 6'b111111; #10;

        // End of simulation
        $stop;
    end
endmodule
