module tbuia;

	// Inputs
	reg clxxk;
	reg rst;
	reg forward_btn_wire;
	reg hazard_btn_wire;
	reg [2:0] selectfpga;
	reg clk1;

	// Outputs
	wire [3:0] anodes;
	wire [7:0] cathods;
	wire [31:0] instruction_wire;
	wire [31:0] address_wire;
	wire [31:0] ALUout_wire;

	// Instantiate the Unit Under Test (UUT)
	integratemod uut (
		.clxxk(clxxk), 
		.rst(rst), 
		.forward_btn_wire(forward_btn_wire), 
		.hazard_btn_wire(hazard_btn_wire), 
		.selectfpga(selectfpga), 
		.anodes(anodes), 
		.cathods(cathods), 
		.clk1(clk1), 
		.instruction_wire(instruction_wire), 
		.address_wire(address_wire), 
		.ALUout_wire(ALUout_wire)
	);


always #1 clk1=~clk1;











	initial begin
		// Initialize Inputs
		clxxk = 1'b0;
		rst = 1'b1;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 0;
		clk1 = 1'b0;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		clxxk=0;
		#5;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b000;
		clk1 = 1'b1;
		#10;
		clxxk = 1'b1;
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b001;
				#10;
		
		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b010;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b011;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b100;
		
		#10;
		

		rst = 0;
		forward_btn_wire = 1'b1;
		hazard_btn_wire = 1'b1;
		selectfpga = 3'b101;
		
		#10;
		
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

