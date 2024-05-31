module EX_MEM(
    input clk, 
    input [31:0] ALUoutin,
   
    input [31:0] rdata2in,
    input [4:0] rt_rdin,

    output reg [31:0] ALUoutout,
  
    output reg [31:0] rdata2out,
    output reg [4:0] rt_rdout,
 input rst,
 input Jumpin1, 
                       Memreadin1, MemtoRegin1, 
                           Memwritin1,  
            Regwritein1,

            output reg Jumpout1,
                        Memreadout1, MemtoRegout1, 
Memwritout1 ,
                             Regwriteout1

);



always @(posedge clk or posedge rst)
	 begin
	 if(rst)
	 begin
	    ALUoutout <= 32'd0;
    rdata2out <= 32'd0;
    rt_rdout <= 5'd0;
	
   Jumpout1<=1'd0;
                        Memreadout1<=1'd0; 
								MemtoRegout1<=1'd0; 
Memwritout1<=1'd0;
                             Regwriteout1<=1'd0;
	 end
	  else begin
    ALUoutout <= ALUoutin;
 
    rdata2out <= rdata2in;
    rt_rdout <= rt_rdin;
     Jumpout1<=Jumpin1; 
	  
	
	                        Memreadout1<=Memreadin1;
								MemtoRegout1<=MemtoRegin1; 
Memwritout1<=Memwritin1;
                             Regwriteout1<=Regwritein1;
end
end
endmodule
