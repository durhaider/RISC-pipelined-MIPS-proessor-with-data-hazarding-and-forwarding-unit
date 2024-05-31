      module controlunit(input [5:0]opcode,
output reg Regdst, Jump, Branch, Memread, MemtoReg, 
Memwrite, ALUSrc, Regwrite,
output reg[1:0] ALUOp, output reg flush
    );
	 always @(*)begin
	 case(opcode)
	 6'b100000 ,6'b100010, 6'b100100, 6'b100101
	


 , 6'b101010:begin//r-type
	 Regdst<=1'b1;
	 ALUSrc<=1'b0;
	 Jump<=1'b0;
	 Branch<=1'b0;
	 Memread<=1'b0;
	 MemtoReg<=1'b0;
	 Memwrite<=1'b0; 
	 Regwrite<=1'b1;
	 ALUOp<=2'b10;
	 flush<=1'b0;
	 
	 end
	 
	 
	 
	 6'b100011:begin//lw
	 Regdst<=1'b0;
	 ALUSrc<=1'b1;
	 Jump<=1'b0;
	 Branch<=1'b0;
	 Memread<=1'b1;
	 MemtoReg<=1'b1;
	 Memwrite<=1'b0; 
	 Regwrite<=1'b1;
	 ALUOp<=2'b00;
	 flush<=1'b0;
	 end
	 6'b101011:begin//sw
	 Regdst<=1'b0;
	 ALUSrc<=1'b1;
	 Jump<=1'b0;
	 Branch<=1'b0;
	 Memread<=1'b0;
	 MemtoReg<=1'b0;
	 Memwrite<=1'b1; 
	 Regwrite<=1'b0;
	 ALUOp<=2'b00;
	 flush<=1'b0;
	 end
	 6'b000100:begin//beq
	 Regdst<=1'b0;
	 ALUSrc<=1'b0;
	 Jump<=1'b0;
	 Branch<=1'b1;
	 Memread<=1'b0;
	 MemtoReg<=1'b0;
	 Memwrite<=1'b0; 
	 Regwrite<=1'b0;
	 ALUOp<=2'b01;
	 flush<=1'b1;
	 end
	 6'b000010:begin//jump
	 Regdst<=1'b0;
	 ALUSrc<=1'b0;
	 Jump<=1'b1;
	 Branch<=1'b0;
	 Memread<=1'b0;
	 MemtoReg<=1'b0;
	
flush<=1'b0;

 Memwrite<=1'b0; 
	 Regwrite<=1'b0;
	 ALUOp<=2'b11;
	 end
	 default:begin // default case
        Regdst<=1'b0;
        ALUSrc<=1'b0;
        Jump<=1'b0;
        Branch<=1'b0;
        Memread<=1'b0;
        MemtoReg<=1'b0;
        Memwrite<=1'b0;
        Regwrite<=1'b0;
        ALUOp<=2'b00; // or whatever default value you want for ALUOp
		  flush<=1'b0;
    end
	 endcase
	 end


endmodule
