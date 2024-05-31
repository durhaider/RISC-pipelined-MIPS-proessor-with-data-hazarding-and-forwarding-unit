module hazardunit_tb;

    // Inputs
    reg clk;
    reg ID_EX_memread;
    reg [4:0] current_rs;
    reg [4:0] current_rt;
    reg forward_stall;
    reg hazard_btn;
    reg [4:0] ID_EX_Regrt;
    reg [4:0] ID_EX_Regrd;
    reg ID_EX_memwrite_sw;
    reg current_memwrite_sw;
    reg current_memread;

    // Outputs
    wire PCwrite;
    wire IF_ID_write;
    wire stall_select;

    // Instantiate the hazardunit module
    hazardunit hazardunit_inst (
        .ID_EX_memread(ID_EX_memread),
        .current_rs(current_rs),
        .current_rt(current_rt),
        .forward_stall(forward_stall),
        .hazard_btn(hazard_btn),
        .ID_EX_Regrt(ID_EX_Regrt),
        .ID_EX_Regrd(ID_EX_Regrd),
        .PCwrite(PCwrite),
        .IF_ID_write(IF_ID_write),
        .stall_select(stall_select),
        .clk(clk),
        .ID_EX_memwrite_sw(ID_EX_memwrite_sw),
        .current_memwrite_sw(current_memwrite_sw),
        .current_memread(current_memread)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Stimulus
    initial begin
        clk = 0;
        ID_EX_memread = 0;
        current_rs = 0;
        current_rt = 0;
        forward_stall = 0;
        hazard_btn = 1;
        ID_EX_Regrt = 0;
        ID_EX_Regrd = 0;
        ID_EX_memwrite_sw = 0;
        current_memwrite_sw = 0;
        current_memread = 0;

        // Test case 1
        #10;
        hazard_btn = 1;

        // Test case 2
        #10;
        ID_EX_memread = 1;

        // Test case 3
        #10;
        ID_EX_memwrite_sw = 1;

        // Test case 4
        #10;
        current_memwrite_sw = 1;

        // Test case 5
        #10;
        current_memread = 1;

        // Test case 6
        #10;
        forward_stall = 1;

        // Test case 7
        #10;
        hazard_btn = 1;

        // Add more test cases as needed

        #100;
        $finish;
    end

endmodule
