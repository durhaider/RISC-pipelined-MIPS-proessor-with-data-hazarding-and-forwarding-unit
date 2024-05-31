module svenn(

 output reg [3:0] anodes,     

    input clk,
    output reg [7:0] cathods,
	 input [31:0] instruction,
	 input [31:0] pc_out, input [31:0] alu_out,
	 input[2:0] sel


);
reg[15:0]in;

reg [3:0] anodeval;//anode display at output
reg [3:0] counter = 4'b0000;//at which output display depends
reg [17:0] clk_counter = 18'b0;//cycles counter
reg [2:0] digit_number = 3'b000;//anode display counter

always @(posedge clk) begin//keep on counting till reach 100000 
    clk_counter <= clk_counter + 1;
    if (clk_counter >= 18'd100000) begin
        clk_counter <= 18'b0;//resetted counter
        digit_number <= digit_number + 1;// increment anode display
        if (digit_number >= 4) begin
            digit_number <= 3'b000;//after reavhing max reset to 0
        end
    end
end

always @(digit_number) begin//display anode changer
    case (digit_number)
        3'b000: anodeval <= 4'b1110;
        3'b001: anodeval <= 4'b1101;
        3'b010: anodeval <= 4'b1011;
        3'b011: anodeval <= 4'b0111;
        default: anodeval <= 4'b1111;
    endcase
end

always @(*) begin
case(sel)
3'b000: in<=instruction[15:0];
3'b001: in<=instruction[31:16];

3'b010: in<=pc_out[15:0];
3'b011: in<=pc_out[31:16];

3'b100: in<=alu_out[15:0];
3'b101: in<=alu_out[31:16];
default: in <= 16'd0000;
endcase

end

always @(digit_number or in) begin
    case (digit_number)//assignment of input bits as hex
        3'b000: counter <= in[3:0];
        3'b001: counter <= in[7:4];
        3'b010: counter <= in[11:8];
        3'b011: counter <= in[15:12];
        default: counter <= 4'b0000;
  

  endcase
end

always @(counter) begin
    case (counter)//displaying of cathodes dp, a, b, c, d, e, f, g.
        4'd0: cathods <= 8'b10000001; // 0
        4'd1: cathods <= 8'b11001111; // 1
        4'd2: cathods <= 8'b10010010; // 2
        4'd3: cathods <= 8'b10000110; // 3
        4'd4: cathods <= 8'b11001100; // 4
        4'd5: cathods <= 8'b10100100; // 5
        4'd6: cathods <= 8'b10100000; // 6
        4'd7: cathods <= 8'b10001111; // 7
        4'd8: cathods <= 8'b10000000; // 8
        4'd9: cathods <= 8'b10000100; // 9
        4'd10: cathods <=8'b10001000; // 10
        4'd11: cathods <=8'b11100000; // 11
        4'd12: cathods <= 8'b10110001; // 12
        4'd13: cathods <= 8'b11000010; // 13
        4'd14: cathods <= 8'b10110000; // 14
        4'd15: cathods <= 8'b10111000; // 15
        
        default: cathods <= 8'b0000000; // Default to all segments off
    endcase
end
always @(anodeval)begin
 anodes<= anodeval;
 end//saving value back

endmodule
