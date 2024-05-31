module forwardunit(input [4:0] ID_EX_Regrs,input [4:0] ID_EX_Regrt,
input [4:0]EX_MEM_Regrd,input [4:0] MEM_WB_Regrd,input EX_MEM_Regwrite,
input forward_btn, output reg forward_stallstrt,
input MEM_WB_Regwrite, output reg[1:0] forward_rs,output reg[1:0] forward_rt
,input clk

    );
	 always @( forward_btn or   MEM_WB_Regwrite or   MEM_WB_Regrd or   ID_EX_Regrt or   EX_MEM_Regrd
	 or   EX_MEM_Regwrite or   ID_EX_Regrs )begin//following block is for setting mux value of rt
	 
	 if(forward_btn==1'b1)begin
	 if((MEM_WB_Regwrite==1'b1) && (MEM_WB_Regrd==ID_EX_Regrt) /*&& (EX_MEM_Regrd!=ID_EX_Regrt || EX_MEM_Regwrite==1'b0)*/)begin
	 forward_rt<=2'd1;
	 end
	 else if((EX_MEM_Regwrite==1'b1) && (EX_MEM_Regrd==ID_EX_Regrt))begin//for forwarding r type
	 forward_rt<=2'd2;
	 end
	 
	 else
	 begin
	 forward_rt<=2'd0;
	 end
	 end
	  else if(forward_btn==1'b0)
	 begin
	 
	  if((MEM_WB_Regwrite==1'b1) && (MEM_WB_Regrd==ID_EX_Regrt) /*&& (EX_MEM_Regrd!=ID_EX_Regrt || EX_MEM_Regwrite==1'b0)*/)begin
	 forward_rt<=2'd1;
	 end
	 else if((EX_MEM_Regwrite==1'b1) && (EX_MEM_Regrd==ID_EX_Regrt))begin//for forwarding r type
	 forward_rt<=2'd2;
	 end
	 
	 else
	 begin
	 forward_rt<=2'd0;
	 end
	 
	 end
	 end
	 
	 always @( forward_btn  or  MEM_WB_Regwrite  or   MEM_WB_Regrd or  ID_EX_Regrs  or  EX_MEM_Regrd
	 or   EX_MEM_Regwrite ) begin
	 if(forward_btn==1'b1)begin//following block is for setting mux value of rs
	 if((MEM_WB_Regwrite==1'b1) && (MEM_WB_Regrd==ID_EX_Regrs) && 
	 ( EX_MEM_Regwrite==1'b0 || EX_MEM_Regrd!=ID_EX_Regrs))begin
	 forward_rs<=2'd1;
	 end
	 else if((EX_MEM_Regwrite==1'b1) && (EX_MEM_Regrd==ID_EX_Regrs))begin//for forwarding r type
	 forward_rs<=2'd2;
	 end
	else
	begin
	forward_rs<=2'd0;
	end
	 
	 end
	 else if(forward_btn==1'b0)
	 begin
	
	 
	 if((MEM_WB_Regwrite==1'b1) && (MEM_WB_Regrd==ID_EX_Regrs) && 
	 ( EX_MEM_Regwrite==1'b0 || EX_MEM_Regrd!=ID_EX_Regrs))begin
	 forward_rs<=2'd1;
	 end
	 else if((EX_MEM_Regwrite==1'b1) && (EX_MEM_Regrd==ID_EX_Regrs))begin//for forwarding r type
	 forward_rs<=2'd2;
	 end
	else
	begin
	forward_rs<=2'd0;
	end
	 
	 end
	 end
	
	 
	


endmodule
