module MEM_WB(input [31:0]memrdatain,input [31:0] ALUresultin,input[4:0] rt_rddin,
output reg[31:0]memrdataout,output reg [31:0] ALUresultout, 

   output reg[4:0] rt_rddout, input clk, input rst,input MemtoRegin2, 
Regwritein2,
output reg MemtoRegout2, 
Regwriteout2);


	 always @(posedge clk or posedge rst)
	 begin
	 if(rst)
	 begin
	memrdataout<=32'd0;
	ALUresultout<=32'd0; 

 rt_rddout<=5'd0;
 Regwriteout2<=1'd0;
MemtoRegout2<=1'd0; 

	 end
	  else begin
	 memrdataout<=memrdatain;
	 ALUresultout<=ALUresultin;
	 rt_rddout<=rt_rddin;



MemtoRegout2<= MemtoRegin2;
Regwriteout2<=Regwritein2;
	 end
	 
end

endmodule
