`timescale 1ns / 1ps

module datamem_tb;

    // Inputs
    reg clk;
    reg WE;
    reg memread;
    reg [31:0] A;
    reg [31:0] WD;

    // Outputs
    wire [31:0] RD;

    // Instantiate the Unit Under Test (UUT)
    datamem uut (
        .clk(clk),
        .WE(WE),
        .memread(memread),
        .A(A),
        .WD(WD),
        .RD(RD)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        WE = 0;
        memread = 0;
        A = 0;
        WD = 0;

        // Apply initial reset values
        #5;
        A = 32'd0; 
        WE = 0;
        memread = 1; // Reading initial value from address 0
        #10;
        $display("RD at address 0: %d", RD);
        
        // Writing values to memory
        WE = 1;
        memread = 0;
        A = 32'd50;
        WD = 32'd12345;
        #10;
        clk = 1; #10; clk = 0; #10;
        WE = 0;

        // Reading back the value
        memread = 1;
        A = 32'd50;
        #10;
        clk = 1; #10; clk = 0; #10;
        $display("RD at address 50: %d", RD);

        // Further memory writes and reads
        WE = 1;
        memread = 0;
        A = 32'd100;
        WD = 32'd67890;
        #10;
        clk = 1; #10; clk = 0; #10;
        WE = 0;

        memread = 1;
        A = 32'd100;
        #10;
        clk = 1; #10; clk = 0; #10;
        $display("RD at address 100: %d", RD);

        // Reset memory read signal
        memread = 0;
        #10;

        // End of simulation
        $stop;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule
