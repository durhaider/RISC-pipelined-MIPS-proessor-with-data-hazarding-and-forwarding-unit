`timescale 1ns / 1ps

module IF_ID_tb;

    // Inputs
    reg [31:0] pcregin;
    reg [31:0] instructin;
    reg clk;
    reg rst;
    reg IF_ID_sel;
    reg flush;

    // Outputs
    wire [31:0] pcregout;
    wire [31:0] instructout;

    // Instantiate the Unit Under Test (UUT)
    IF_ID uut (
        .pcregin(pcregin),
        .instructin(instructin),
        .pcregout(pcregout),
        .instructout(instructout),
        .clk(clk),
        .rst(rst),
        .IF_ID_sel(IF_ID_sel),
        .flush(flush)
    );

    initial begin
        // Initialize Inputs
        pcregin = 0;
        instructin = 0;
        clk = 0;
        rst = 0;
        IF_ID_sel = 0;
        flush = 0;

        // Apply a reset
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Load values and pass them through the pipeline register
        pcregin = 32'h00000010;
        instructin = 32'h12345678;
        IF_ID_sel = 1;
        #10;
        clk = 1; #10; clk = 0; #10; // Generate a clock pulse
        IF_ID_sel = 0;

        // Check outputs
        $display("pcregout: %h, instructout: %h", pcregout, instructout);

        // Flush the pipeline register
        flush = 1;
        #10;
        clk = 1; #10; clk = 0; #10; // Generate a clock pulse
        flush = 0;

        // Check outputs after flush
        $display("pcregout: %h, instructout: %h", pcregout, instructout);

        // Load new values without enabling IF_ID_sel
        pcregin = 32'h00000020;
        instructin = 32'h87654321;
        #10;
        clk = 1; #10; clk = 0; #10; // Generate a clock pulse

        // Check that outputs haven't changed
        $display("pcregout: %h, instructout: %h", pcregout, instructout);

        // Load new values with enabling IF_ID_sel
        IF_ID_sel = 1;
        #10;
        clk = 1; #10; clk = 0; #10; // Generate a clock pulse
        IF_ID_sel = 0;

        // Check outputs after IF_ID_sel
        $display("pcregout: %h, instructout: %h", pcregout, instructout);

        // End of simulation
        #10; $stop;
    end

endmodule
