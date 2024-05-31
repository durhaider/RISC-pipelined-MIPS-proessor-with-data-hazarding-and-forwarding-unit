module ALUcontrol(input[5:0]instruction,
input [1:0]ALUOp, 
output reg[3:0] ALUcontrol
    );
reg [3:0] funct;

	always @(*) begin
		case(instruction[5:0])//for rtype
			6'b100000:  funct <= 4'd2;	/* add */
			6'b100010:  funct <= 4'd6;	/* sub */
			6'b100100:  funct <= 4'd0;	/* and */
			6'b100101:  funct <= 4'd1;	/* or */
			6'b101010: funct <= 4'd7;	/* slt */
			6'b101111: funct <= 4'd8;	/* shift */
			default: funct <= 4'd0;
		endcase
	end

	always @(*) begin
		case(ALUOp)
			2'b00: ALUcontrol <= 4'b0010;	/* lw & sw */
			2'b01: ALUcontrol <= 4'b0110;	/* beq */
			2'd2: ALUcontrol <= funct;//r-type
			
			default: ALUcontrol <= 0;
		endcase
	end


endmodule
