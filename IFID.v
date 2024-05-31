module IF_ID(input [31:0]pcregin,input [31:0]instructin, 
output reg[31:0]pcregout,output reg[31:0]instructout, input clk, input rst
  ,input IF_ID_sel, input flush);
  
 
	 always @(posedge clk  or posedge rst)
	 begin
	 if(rst)
	 begin
	 pcregout<=32'd0;
	 instructout<=32'd0;
	 end
	 else if(flush==1'b1)begin
	 pcregout<=32'd0;
	 instructout<=32'd0;
	 end
	 else if(IF_ID_sel==1'b0)begin
//do nothing
	 end
	 else if(IF_ID_sel==1'b1) begin
	 pcregout<=pcregin;
	 instructout<=instructin;
	 end
	 end


endmodule
