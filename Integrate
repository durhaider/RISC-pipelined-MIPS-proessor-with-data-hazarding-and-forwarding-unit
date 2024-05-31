`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:13 05/04/2024 
// Design Name: 
// Module Name:    integratemod 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    RISC pipelined processor with hazard detection and forwarding unit
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////

module integratemod (
  input wire clxxk,           // Clock signal
  input wire rst,             // Reset signal
  input wire forward_btn_wire, // Forwarding enable signal
  input wire hazard_btn_wire,  // Hazard detection enable signal
  input [2:0] selectfpga,      // Selection signal for FPGA
  output wire [3:0] anodes,    // Output for anodes (seven-segment display control)
  output wire [7:0] cathods,   // Output for cathodes (seven-segment display control)
  input wire clk1,             // Secondary clock signal
  output wire [31:0] instruction_wire, // Output instruction wire
  output wire [31:0] address_wire,     // Output address wire
  output wire [31:0] ALUout_wire       // Output ALU result wire
);

// Internal wire declarations
wire Regdst_wire, Branch_wire, Memread_wire, MemtoReg_wire, Memwrite_wire, ALUSrc_wire, Regwrite_wire;
wire [31:0] pcregout_wire1, rdata1_wire1, rdata2_wire1, extended1;
wire [4:0] rd_wire1, rt_wire1, rs_wire1;
wire [5:0] opcode_wire1;
wire Regdst_wire1, Branch_wire1, Memread_wire1, MemtoReg_wire1, Memwrite_wire1, ALUSrc_wire1, forward_stallstrt_wire, Regwrite_wire1, flush_wire;
wire [1:0] ALUOp_wire1, forward_rt_wire, forward_rs_wire;
wire instructout_wire1;
wire [1:0] ALUOp_wire;
wire [15:0] constant_wire;
wire [3:0] ALUcontrol_wire;
wire [5:0] opcode_wire, ALUcontrol_wiress;
wire [4:0] rt_wire, rs_wire, rd_wire;
wire [31:0] address_wire1, address_wire2, rdata1_wire, rdata2_wire, RD_wire, extended, pcregout_wire, instructout_wire;
wire [31:0] ALUout_wire1, adderout1_wire, rdata2_wire2;
wire zero_wire1;
wire [4:0] selected_rt_rd;
wire Jump_wire2, Branch_wire2, Memread_wire2, MemtoReg_wire2, Memwrite_wire2, Regwrite_wire2, memwrite_sw_wire;
reg [31:0] forward_A, forward_B;
wire [31:0] RD_wire1, ALUout_wire2;
wire MemtoReg_wire3, Regwrite_wire3;
wire [31:0] adderout1;
wire [4:0] selected_rt_rd1;
wire ID_EX_memread_wire, PCwrite_wire, IF_ID_write_wire, stall_select_wire;
wire [4:0] shiftam_wire1, shiftam_wire;
wire [4:0] ID_EX_Regrt_wire, current_rs_wire, current_rt_wire;
reg [31:0] selected3;
reg [31:0] selected2;
reg [31:0] selected1;
reg [31:0] ALUInput;
reg [4:0] selected;
reg [31:0] alu_b;
reg [31:0] write_data;
reg [31:0] instruction_wire1;
reg [5:0] select_opcode_wire;

// Initialize selected2 to zero
initial begin
  selected2 = 32'd0;
end

// Hazard unit instantiation
hazardunit hzrd(
  .ID_EX_memread(Memread_wire1), 
  .current_rs(rs_wire),
  .current_rt(rt_wire), 
  .forward_stall(forward_stallstrt_wire),
  .ID_EX_Regrt(rt_wire1),
  .PCwrite(PCwrite_wire),
  .IF_ID_write(IF_ID_write_wire), 
  .clk(clxxk),
  .stall_select(stall_select_wire), 
  .hazard_btn(hazard_btn_wire),
  .ID_EX_memwrite_sw(Memwrite_wire1),
  .current_memwrite_sw(Memwrite_wire), 
  .current_memread(Memread_wire),
  .ID_EX_Regrd(rd_wire1)
);

// PC module instantiation
PCm mod1(
  .pc_in(selected2),
  .pc_out(address_wire),
  .clk(clxxk), 
  .rst(rst),
  .PC_write(PCwrite_wire)
);

// Simple adder module instantiation
simpleadder mode(
  .a(address_wire),
  .b(32'd0),
  .out(address_wire1)
);

// Instruction memory module instantiation
instruct_memory mod2 (
  .address(address_wire),
  .instruction(instruction_wire),
  .clk(clxxk), 
  .rst(rst)
);

// Control logic for handling jump and branch instructions
always @(instruction_wire[5:0] or address_wire1 or rdata2_wire or rdata1_wire or opcode_wire or adderout1 or instruction_wire[25:0]) begin
  if (instruction_wire[31:26] == 6'b000010) begin
    selected2 <= {address_wire1[31:28], (instruction_wire[25:0] << 2)};
  end
  else if (rdata2_wire == rdata1_wire && opcode_wire == 6'b000100) begin
    selected2 <= adderout1;
  end
end

// IF/ID pipeline register instantiation
IF_ID reg1(
  .pcregin(address_wire1),
  .instructin(instruction_wire),
  .pcregout(pcregout_wire),
  .instructout(instructout_wire),
  .clk(clxxk),
  .rst(rst),
  .flush(flush_wire), 
  .IF_ID_sel(IF_ID_write_wire)
);

// Instruction decoder module instantiation
decoder mod3 (
  .clk(clxxk), 
  .rst(rst), 
  .instruction(instructout_wire), 
  .rs(rs_wire), 
  .rt(rt_wire), 
  .rd(rd_wire),
  .constant(constant_wire), 
  .opcode(opcode_wire),
  .shiftam(shiftam_wire)
);

// Control unit module instantiation
controlunit moder(
  .opcode(opcode_wire), 
  .Regdst(Regdst_wire),
  .Jump(Jump_wire), 
  .Branch(Branch_wire),
  .Memread(Memread_wire), 
  .MemtoReg(MemtoReg_wire), 
  .Memwrite(Memwrite_wire), 
  .ALUSrc(ALUSrc_wire), 
  .Regwrite(Regwrite_wire),
  .ALUOp(ALUOp_wire),
  .flush(flush_wire)
);

// Stall control logic
always @(stall_select_wire or select_opcode_wire) begin
  if (stall_select_wire == 1'b0) begin
    select_opcode_wire <= 6'd0;
  end else if (stall_select_wire == 1'b1) begin
    select_opcode_wire <= 6'd1;
  end
end

// Register file module instantiation
regfile mod4 (
  .rdata1(rdata1_wire), 
  .rdata2(rdata2_wire), 
  .write_data(selected1), 
  .clk(clxxk), 
  .rst(rst), 
  .regwrite(Regwrite_wire3), 
  .rs(rs_wire), 
  .rt(rt_wire), 
  .rd(selected_rt_rd1)
);

// Sign-extend module instantiation
signextend mox(
  .in_data(constant_wire), 
  .out_data(extended)
);

// Simple adder for branch target address
simpleadder modett(
  .a(pcregout_wire),
  .b(extended),
  .out(adderout1)
);

// ID/EX pipeline register instantiation
ID_EX idex(
  .shiftam_wireout(shiftam_wire1),
  .shiftam_wirein(shiftam_wire),
  .rdata1in(rdata1_wire), 
  .rdata2in(rdata2_wire),  
  .rdin(rd_wire), 
  .rtin(rt_wire),
  .rsin(rs_wire),
  .rdata1out(rdata1_wire1),
  .rdata2out(rdata2_wire1), 
  .rdout(rd_wire1), 
  .clk(clxxk),  
  .rtout(rt_wire1),
  .rsout(rs_wire1),
  .rst(rst),
  .opcodein(opcode_wire),
  .opcodeout(opcode_wire1),
  .ALUcontrol(instructout_wire[5:0]),
  .ALUcontrolout(ALUcontrol_wiress),
  .Regdstin(Regdst_wire),
  .Jumpin(Jump_wire),
  .Memreadin(Memread_wire), 
  .MemtoRegin(MemtoReg_wire), 
  .Memwritin(Memwrite_wire), 
  .ALUSrcin(ALUSrc_wire), 
  .Regwritein(Regwrite_wire), 
  .ALUOpin(ALUOp_wire),
  .Regdstout(Regdst_wire1),
  .Jumpout(Jump_wire2),
  .Branchout(Branch_wire2), 
  .Memreadout(Memread_wire1), 
  .MemtoRegout(MemtoReg_wire1), 
  .Memwritout(Memwrite_wire1), 
  .ALUSrcout(ALUSrc_wire1), 
  .Regwriteout(Regwrite_wire1),
  .ALUOpout(ALUOp_wire1),
  .extendedin(extended),
  .extendedout(extended1),
  .adderout(adderout1_wire)
);

// ALU control unit module instantiation
ALUcontrolunit mod4r(
  .ALUOp(ALUOp_wire1), 
  .ALUcontrol(ALUcontrol_wire), 
  .func(extended1[5:0])
);

// Forwarding unit module instantiation
forwardingunit modr(
  .EX_MEM_Regrd(rd_wire1), 
  .MEM_WB_Regrd(rd_wire), 
  .ID_EX_Regrs(rs_wire1),
  .ID_EX_Regrt(rt_wire1),
  .EX_MEM_Regwrite(Regwrite_wire2), 
  .MEM_WB_Regwrite(Regwrite_wire3),
  .forward_rs(forward_rs_wire),
  .forward_rt(forward_rt_wire),
  .forward_btn(forward_btn_wire)
);

// ALU input selection logic
always @(rdata2_wire1 or extended1 or ALUSrc_wire1 or rdata1_wire1 or forward_A or forward_B or forward_rs_wire or forward_rt_wire) begin
  alu_b <= ALUSrc_wire1 ? extended1 : forward_B;
  forward_A <= (forward_rs_wire == 2'b00) ? rdata1_wire1 :
               (forward_rs_wire == 2'b01) ? selected1 : RD_wire;
  forward_B <= (forward_rt_wire == 2'b00) ? rdata2_wire1 :
               (forward_rt_wire == 2'b01) ? selected1 : RD_wire;
end

// ALU input selection for shift instructions
always @(shiftam_wire1 or extended1 or ALUSrc_wire1 or forward_A) begin
  ALUInput <= (ALUcontrol_wire == 4'b0011) ? shiftam_wire1 : forward_A;
end

// ALU output selection
always @(ALUcontrol_wire or ALUInput or alu_b) begin
  case (ALUcontrol_wire)
    4'b0000: selected <= ALUInput + alu_b;  // Add
    4'b0001: selected <= ALUInput - alu_b;  // Subtract
    4'b0010: selected <= ALUInput & alu_b;  // AND
    4'b0011: selected <= ALUInput << alu_b; // Shift left logical
    4'b0100: selected <= ALUInput >> alu_b; // Shift right logical
    4'b0101: selected <= (ALUInput < alu_b) ? 1 : 0; // Set less than
    4'b0110: selected <= ALUInput ^ alu_b;  // XOR
    4'b0111: selected <= ~(ALUInput | alu_b); // NOR
    default: selected <= 32'd0;  // Default case
  endcase
end

// EX/MEM pipeline register instantiation
EX_MEM reg2(
  .clk(clxxk),
  .rst(rst),
  .forward_stall(forward_stallstrt_wire),
  .Branchin(Branch_wire1), 
  .Memreadin(Memread_wire1), 
  .MemtoRegin(MemtoReg_wire1), 
  .Memwritin(Memwrite_wire1),
  .Regwritein(Regwrite_wire1),
  .Branchout(Branch_wire2), 
  .Memreadout(Memread_wire2), 
  .MemtoRegout(MemtoReg_wire2), 
  .Memwritout(memwrite_sw_wire), 
  .Regwriteout(Regwrite_wire2),
  .zero(zero_wire1),
  .zero1(zero_wire1),
  .adderout(adderout1_wire),
  .adderout1(adderout1),
  .aluout(ALUout_wire),
  .aluout1(ALUout_wire1),
  .write_data(forward_B),
  .write_data1(rdata2_wire2),
  .selected_rt_rd(selected_rt_rd1),
  .selected_rt_rd1(rd_wire1),
  .rd(rd_wire1), 
  .rdout(rd_wire), 
  .selected(selected1),
  .selected1(ALUout_wire1),
  .instructout(instructout_wire1)
);

// Data memory module instantiation
data_memory modd(
  .clk(clxxk), 
  .rst(rst),
  .address(ALUout_wire1), 
  .write_data(forward_B),
  .read_data(RD_wire),
  .memwrite(memwrite_sw_wire), 
  .memread(Memread_wire2)
);

// MEM/WB pipeline register instantiation
MEM_WB reg3(
  .clk(clxxk),
  .rst(rst),
  .MemtoRegin(MemtoReg_wire2),
  .Regwritein(Regwrite_wire2),
  .MemtoRegout(MemtoReg_wire3),
  .Regwriteout(Regwrite_wire3),
  .aluout(ALUout_wire1),
  .aluout1(ALUout_wire2),
  .RDin(RD_wire),
  .RDout(RD_wire1),
  .selected_rt_rd(rd_wire),
  .selected_rt_rd1(selected_rt_rd1)
);

// Final data selection for writing back to register file
always @(MemtoReg_wire3 or RD_wire1 or ALUout_wire2) begin
  write_data <= MemtoReg_wire3 ? RD_wire1 : ALUout_wire2;
end

endmodule
