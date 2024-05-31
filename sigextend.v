module signextend(
  
    input [15:0] in_data,
    output reg [31:0] out_data
);

always @(*) begin
    if (in_data[15] == 1) begin
        // Sign extension: fill upper 16 bits with 1s
        out_data = {16'b1111111111111111, in_data};
    end else begin
       

 // Zero extension: fill upper 16 bits with 0s
        out_data = {16'b0000000000000000, in_data};
    end
end

endmodule
