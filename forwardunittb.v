module forwardunit_tb;

    // Inputs
    reg [4:0] ID_EX_Regrs;
    reg [4:0] ID_EX_Regrt;
    reg [4:0] EX_MEM_Regrd;
    reg [4:0] MEM_WB_Regrd;
    reg EX_MEM_Regwrite;
    reg forward_btn;
    reg MEM_WB_Regwrite;
    reg clk;

    // Outputs
    wire [1:0] forward_rs;
    wire [1:0] forward_rt;
    reg forward_stallstrt;

    // Instantiate the forwardunit module
    forwardunit forwardunit_inst (
        .ID_EX_Regrs(ID_EX_Regrs),
        .ID_EX_Regrt(ID_EX_Regrt),
        .EX_MEM_Regrd(EX_MEM_Regrd),
        .MEM_WB_Regrd(MEM_WB_Regrd),
        .EX_MEM_Regwrite(EX_MEM_Regwrite),
        .forward_btn(forward_btn),
        .forward_rs(forward_rs),
        .forward_rt(forward_rt),
        .MEM_WB_Regwrite(MEM_WB_Regwrite),
        .clk(clk),
        .forward_stallstrt(forward_stallstrt)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Stimulus
    initial begin
        clk = 0;
        ID_EX_Regrs = 0;
        ID_EX_Regrt = 0;
        EX_MEM_Regrd = 0;
        MEM_WB_Regrd = 0;
        EX_MEM_Regwrite = 0;
        forward_btn = 0;
        MEM_WB_Regwrite = 0;

        // Test case 1
        #10;
        forward_btn = 1;
        MEM_WB_Regwrite = 1;
        MEM_WB_Regrd = ID_EX_Regrt;

        // Test case 2
        #10;
        forward_btn = 1;
        EX_MEM_Regwrite = 1;
        EX_MEM_Regrd = ID_EX_Regrt;

        // Test case 3
        #10;
        forward_btn = 1;
        MEM_WB_Regwrite = 1;
        MEM_WB_Regrd = ID_EX_Regrs;

        // Test case 4
        #10;
        forward_btn = 1;
        EX_MEM_Regwrite = 1;
        EX_MEM_Regrd = ID_EX_Regrs;

        // Test case 5
        #10;
        forward_btn = 0;
        MEM_WB_Regwrite = 1;
        MEM_WB_Regrd = ID_EX_Regrt;

        // Test case 6
        #10;
        forward_btn = 0;
        EX_MEM_Regwrite = 1;
        EX_MEM_Regrd = ID_EX_Regrt;

        // Test case 7
        #10;
        forward_btn = 0;
        MEM_WB_Regwrite = 1;
        MEM_WB_Regrd = ID_EX_Regrs;

        // Test case 8
        #10;
        forward_btn = 0;
        EX_MEM_Regwrite = 1;
        EX_MEM_Regrd = ID_EX_Regrs;

        #100;
        $finish;
    end

endmodule
