module ID_EX(
  output reg [4:0] shiftam_wireout,
  input [4:0] shiftam_wirein,
  input [31:0] rdata1in, 
  input [31:0] rdata2in,
  input [4:0] rdin, 
  input [4:0] rtin,
  input [4:0] rsin,
  output reg [31:0] rdata1out,
  output reg [31:0] rdata2out,
  output reg [4:0] rdout,
  input clk,
  output reg [4:0] rtout,
  output reg [4:0] rsout,
  input rst, 
  input [5:0] opcodein,
  output reg [5:0] opcodeout,
  input Regdstin,
  input Jumpin,
  input Memreadin, 
  input MemtoRegin, 
  input Memwritin, 
  input ALUSrcin, 
  input Regwritein,
  input [1:0] ALUOpin,
  output reg Regdstout,
  output reg Jumpout, 
  output reg Memreadout, 
  output reg MemtoRegout, 
  output reg Memwritout, 
  output reg ALUSrcout, 
  output reg Regwriteout,
  output reg [1:0] ALUOpout, 
  input [5:0] muxcond, 
  input [31:0] extendin, 
  output reg [31:0] extendout,
  output reg [5:0] ALUcontrolout,
  input [5:0] ALUcontrol
); 

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      rdata1out <= 32'd0;
      rdata2out <= 32'd0;
      rdout <= 5'd0;
      rtout <= 5'd0;
      rsout <= 5'd0;
      opcodeout <= 6'd0;
      Regdstout <= 1'd0;
      Jumpout <= 1'd0;
      Memreadout <= 1'd0;
      MemtoRegout <= 1'd0;
      Memwritout <= 1'd0;
      ALUSrcout <= 1'd0;
      Regwriteout <= 1'd0;
      ALUOpout <= 2'd0;
      extendout <= 32'd0;
      ALUcontrolout <= 6'd0;
      shiftam_wireout <= 5'd0;
    end 
    else if (muxcond == 6'd1) begin
      rdata1out <= rdata1in;
      rdata2out <= rdata2in;
      rdout <= rdin;
      rtout <= rtin;
      rsout <= rsin;
      opcodeout <= opcodein;
      Regdstout <= Regdstin;
      Jumpout <= Jumpin;
      Memreadout <= Memreadin;
      MemtoRegout <= MemtoRegin;
      Memwritout <= Memwritin;
      ALUSrcout <= ALUSrcin;
      Regwriteout <= Regwritein;
      ALUOpout <= ALUOpin;
      extendout <= extendin;
      ALUcontrolout <= ALUcontrol;
      shiftam_wireout <= shiftam_wirein;
    end
  end

endmodule
