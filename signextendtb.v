`timescale 1ns / 1ps

module signextend_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg [15:0] in_data;
    
    // Outputs
    wire [31:0] out_data;

    // Instantiate the module
    signextend uut (
        .in_data(in_data),
        .out_data(out_data)
    );

    // Initialize Inputs
    initial begin
        in_data = 16'h0000; // Initialize input data to 0



        // Testcase 1: Positive input value
        #20;
        in_data = 16'h1234; // Example positive input value

        // Testcase 2: Negative input value
        #20;
        in_data = 16'hFFFF; // Example negative input value

        // Add more testcases as needed

        // End simulation
        #10;
        $finish;
    end

    // Display results
    always @(in_data) begin
        $display("Time=%t, in_data=%h, out_data=%h", $time, in_data, out_data);
    end

endmodule
