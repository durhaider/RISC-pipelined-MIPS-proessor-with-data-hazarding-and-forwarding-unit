`timescale 1ns / 1ps

module PCm (pc_in, pc_out,   clk, rst,PC_write); 
		
	input clk, rst,PC_write;
		input [31:0] pc_in;
		output reg [31:0] pc_out; 
		
		always @(posedge clk or posedge rst)
		begin
			if (rst)begin
				pc_out <=32'd0; 
				end
			else if(PC_write==1'b0) begin
//				 pc_out <= pc_out ; do nothing
				 end
				 else if(PC_write==1'b1) begin
				 if(pc_in)begin
				  pc_out<=pc_in;
				 end
				 else 
				 begin
				 pc_out <= pc_out + 1'b1; 
				 end
				 end
			end
			
			endmodule
