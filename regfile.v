module regfile (
    output reg [31:0] rdata1,
    output reg [31:0] rdata2,
    input [31:0] write_data,
    input rst,
    input clk,
    input regwrite,
	 input [4:0] rs,
	 input[4:0] rt,
   input [4:0] rd
	 
);

//rs=21-25 bits
//rt=16-20 bits
//rd=11-15 bitss

		//reg [31:0] Registers = new reg[32];
	reg [31:0] Registers [0:31];
	
	
	
	initial begin
    Registers[0] <= 32'd1;
    Registers[1] <= 32'd2;
    Registers[2] <= 32'd5;
    Registers[3] <= 32'd33;
    Registers[4] <= 32'd4;
    Registers[5] <= 32'd5;
    Registers[6] <= 32'd6;
    Registers[7] <= 32'd7;
    Registers[8] <= 32'd8;
    Registers[9] <= 32'd9;
    Registers[10] <= 32'd10000;
    Registers[11] <= 32'd11;
    Registers[12] <= 32'd12;
    Registers[13] <= 32'd13;
    Registers[14] <= 32'd14;
    Registers[15] <= 32'd15;
    Registers[16] <= 32'd16;
    Registers[17] <= 32'd17;
    Registers[18] <= 32'd18;
    Registers[19] <= 32'd19;
    Registers[20] <= 32'd20;
    Registers[21] <= 32'd21;
    Registers[22] <= 32'd22;
    Registers[23] <= 32'd23;


    Registers[24] <= 32'd24;
    Registers[25] <= 32'd25;
    Registers[26] <= 32'd26;
    Registers[27] <= 32'd27;
    Registers[28] <= 32'd28;
    Registers[29] <= 32'd252; // this value should point to the top of data memory, dont forget byte addressing
    Registers[30] <= 32'd30; // this value should point to the top of data memory, dont forget byte addressing
    Registers[31] <= 32'b0;
end

	

	always @(negedge clk) begin
	
	 

    if (regwrite == 1'b1) begin
        Registers[rd] <= write_data;//rd
    end
	 
   end

	always @( clk or rs or rt or Registers)begin
	rdata1 <= Registers[rs];
    rdata2 <= Registers[rt];
	end

	
	

endmodule




