module decoder(input clk, input rst,
input [31:0]instruction, output reg[4:0] rs,
output reg[4:0] rt, output reg[4:0] rd, 
output reg[15:0] constant, output reg[5:0] opcode, output reg[4:0] shiftam
    );
	 always@(*)begin
	 if(rst)begin
	 rs<=5'd0;
	 rt<=5'd0;
	 rd<=5'd0;
	 constant<=16'd0;
	 opcode<=6'd0;
	 shiftam<=5'd0;
	 end
	 else begin
	 rt<=instruction[20:16];
	 rs<=instruction[25:21];
	 rd<=instruction[15:11];
	 constant <= instruction[15:0];
	 opcode<=instruction[31:26];
	 shiftam<=instruction[10:6];
	 end

end

endmodule
