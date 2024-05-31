`timescale 1ns / 1ps

module ID_EX_tb;

    // Inputs
    reg [4:0] shiftam_wirein;
    reg [31:0] rdata1in;
    reg [31:0] rdata2in;
    reg [4:0] rdin;
    reg [4:0] rtin;
    reg [4:0] rsin;
    reg clk;
    reg rst;
    reg [5:0] opcodein;
    reg Regdstin;
    reg Jumpin;
    reg Memreadin;
    reg MemtoRegin;
    reg Memwritin;
    reg ALUSrcin;
    reg Regwritein;
    reg [1:0] ALUOpin;
    reg [5:0] muxcond;
    reg [31:0] extendin;
    reg [5:0] ALUcontrol;

    // Outputs
    wire [4:0] shiftam_wireout;
    wire [31:0] rdata1out;
    wire [31:0] rdata2out;
    wire [4:0] rdout;
    wire [4:0] rtout;
    wire [4:0] rsout;
    wire [5:0] opcodeout;
    wire Regdstout;
    wire Jumpout;
    wire Memreadout;
    wire MemtoRegout;
    wire Memwritout;
    wire ALUSrcout;
    wire Regwriteout;
    wire [1:0] ALUOpout;
    wire [31:0] extendout;
    wire [5:0] ALUcontrolout;

    // Instantiate the Unit Under Test (UUT)
    ID_EX uut (
        .shiftam_wireout(shiftam_wireout),
        .shiftam_wirein(shiftam_wirein),
        .rdata1in(rdata1in),
        .rdata2in(rdata2in),
        .rdin(rdin),
        .rtin(rtin),
        .rsin(rsin),
        .rdata1out(rdata1out),
        .rdata2out(rdata2out),
        .rdout(rdout),
        .rtout(rtout),
        .rsout(rsout),
        .clk(clk),
        .rst(rst),
        .opcodein(opcodein),
        .opcodeout(opcodeout),
        .Regdstin(Regdstin),
        .Jumpin(Jumpin),
        .Memreadin(Memreadin),
        .MemtoRegin(MemtoRegin),
        .Memwritin(Memwritin),
        .ALUSrcin(ALUSrcin),
        .Regwritein(Regwritein),
        .ALUOpin(ALUOpin),
        .Regdstout(Regdstout),
        .Jumpout(Jumpout),
        .Memreadout(Memreadout),
        .MemtoRegout(MemtoRegout),
        .Memwritout(Memwritout),
        .ALUSrcout(ALUSrcout),
        .Regwriteout(Regwriteout),
        .ALUOpout(ALUOpout),
        .muxcond(muxcond),
        .extendin(extendin),
        .extendout(extendout),
        .ALUcontrol(ALUcontrol),
        .ALUcontrolout(ALUcontrolout)
    );

    initial begin
        // Initialize Inputs
        shiftam_wirein = 0;
        rdata1in = 0;
        rdata2in = 0;
        rdin = 0;
        rtin = 0;
        rsin = 0;
        clk = 0;
        rst = 0;
        opcodein = 0;
        Regdstin = 0;
        Jumpin = 0;
        Memreadin = 0;
        MemtoRegin = 0;
        Memwritin = 0;
        ALUSrcin = 0;
        Regwritein = 0;
        ALUOpin = 0;
        muxcond = 0;
        extendin = 0;
        ALUcontrol = 0;

        // Apply a reset
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Apply some values with muxcond == 6'd1
        shiftam_wirein = 5'd5;
        rdata1in = 32'h12345678;
        rdata2in = 32'h87654321;
        rdin = 5'd10;
        rtin = 5'd11;
        rsin = 5'd12;
        opcodein = 6'b101010;
        Regdstin = 1;
        Jumpin = 0;
        Memreadin = 1;
        MemtoRegin = 0;
        Memwritin = 1;
        ALUSrcin = 1;
        Regwritein = 1;
        ALUOpin = 2'b10;
        muxcond = 6'd1;
        extendin = 32'hABCDEFFF;
        ALUcontrol = 6'b100000;

        // Generate clock pulses
        #10; clk = 1; #10; clk = 0; #10;

        // Check outputs
        $display("rdata1out: %h, rdata2out: %h", rdata1out, rdata2out);
        $display("rdout: %d, rtout: %d, rsout: %d", rdout, rtout, rsout);
        $display("opcodeout: %b, Regdstout: %b", opcodeout, Regdstout);
        $display("Jumpout: %b, Memreadout: %b, MemtoRegout: %b", Jumpout, Memreadout, MemtoRegout);
        $display("Memwritout: %b, ALUSrcout: %b, Regwriteout: %b", Memwritout, ALUSrcout, Regwriteout);
        $display("ALUOpout: %b, extendout: %h", ALUOpout, extendout);
        $display("ALUcontrolout: %b, shiftam_wireout: %d", ALUcontrolout, shiftam_wireout);

        // Change muxcond to 6'd0 and check that outputs do not change
        muxcond = 6'd0;
        #10; clk = 1; #10; clk = 0; #10;

        // Check outputs again
        $display("After muxcond == 6'd0:");
        $display("rdata1out: %h, rdata2out: %h", rdata1out, rdata2out);
        $display("rdout: %d, rtout: %d, rsout: %d", rdout, rtout, rsout);
        $display("opcodeout: %b, Regdstout: %b", opcodeout, Regdstout);
        $display("Jumpout: %b, Memreadout: %b, MemtoRegout: %b", Jumpout, Memreadout, MemtoRegout);
        $display("Memwritout: %b, ALUSrcout: %b, Regwriteout: %b", Memwritout, ALUSrcout, Regwriteout);
        $display("ALUOpout: %b, extendout: %h", ALUOpout, extendout);
        $display("ALUcontrolout: %b, shiftam_wireout: %d", ALUcontrolout, shiftam_wireout);

        // End of simulation
        #10; $stop;
    end

endmodule
