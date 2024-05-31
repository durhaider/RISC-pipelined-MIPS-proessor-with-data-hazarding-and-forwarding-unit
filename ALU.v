module ALU (
    input [3:0] opcode,
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] out,
    output reg zero, input [4:0]shamt
);

always @(opcode or a or b) begin
    case (opcode)
        4'd2: begin // Add (R-type)
            out <= a + b;
            zero <= 1'b0; // Set zero flag if result is zero
        end
        4'd6: begin // Subtract (R-type)
            out <= a - b;
            zero <= 1'b0;
        end
		  4'd0: begin // AND (R-type)
            out <= a & b;
            zero <= 1'b0;
        end
		  4'd1: begin // OR (R-type)
            out <= a | b;
            zero <= 1'b0;
       
 end
		  4'd7: begin
            if (a < b) begin
                out <= 32'd1; // Set output to 1 if a < b
            end else begin
                out <= 32'd0; // Set output to 0 if a >= b
            end
            zero <= 0; // Zero flag is not set for SLT
        end
        4'b0110: begin // Beq (branch if equal)
            zero <= (a == b); // Set zero flag for comparison
            out <= a + b; // Out register not used for beq
        end
        4'b0100: begin // Store word (sw)
            out <= a+b; // Out register not used for sw
            zero <= 1'b0; // Zero flag not relevant for sw
        end
		4'd8: begin // shift ()
            out <= (a<<shamt); // 
            zero <= 1'b0; // 
        end
      default:begin
        out <= 32'h00000000; // Set output to 0 if no operation matches
        zero <= 1'b0; // Zero flag is not set
    end
    endcase
	  
end

endmodule
