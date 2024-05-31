`timescale 1ns / 1ps
module hazardunit(
  input ID_EX_memread,
  input [4:0] current_rs,
  input [4:0] current_rt,
  input forward_stall,
  input hazard_btn,
  input [4:0] ID_EX_Regrt,
  input [4:0] ID_EX_Regrd,
  output reg PCwrite,
  output reg IF_ID_write,
  output reg stall_select,
  input clk,
  input ID_EX_memwrite_sw, 
  input current_memwrite_sw,
  input current_memread
);
  reg [5:0] stall_detector;
  reg [5:0] counter;
  
  initial 
  begin
    stall_select = 1'b1;
    PCwrite = 1'b1;
    IF_ID_write = 1'b1;
    stall_detector = 6'd0;
    counter = 6'd0;
  end

  always @(posedge clk) 
  begin
    if (hazard_btn) 
    begin
      if (ID_EX_memread && (ID_EX_Regrt == current_rt || ID_EX_Regrt == current_rs)) 
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd2;
        counter <= 6'd0;
      end 
      else if (ID_EX_memwrite_sw && (ID_EX_Regrt == current_rt || ID_EX_Regrt == current_rs) && !current_memwrite_sw) 
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd1;
        counter <= 6'd0;
      end  
      else if(current_memwrite_sw && (ID_EX_Regrd == current_rt || ID_EX_Regrd == current_rs) && !ID_EX_memwrite_sw)
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd2;
        counter <= 6'd0;
      end
      else if (ID_EX_memread && current_memread) 
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd2;
        counter <= 6'd0;
      end  
      else if (current_memread && ID_EX_memread) 
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd2;
        counter <= 6'd0;
      end  
    end 
    else 
    begin
      if (ID_EX_memread && (ID_EX_Regrt == current_rt || ID_EX_Regrt == current_rs)) 
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd2;
        counter <= 6'd0;
      end 
      else if (ID_EX_memwrite_sw && (ID_EX_Regrt == current_rt || ID_EX_Regrt == current_rs) && !current_memwrite_sw) 
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd1;
        counter <= 6'd0;
      end  
      else if(current_memwrite_sw && (ID_EX_Regrd == current_rt || ID_EX_Regrd == current_rs) && !ID_EX_memwrite_sw)
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd2;
        counter <= 6'd0;
      end
      else if (ID_EX_memread && current_memread) 
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd2;
        counter <= 6'd0;
      end  
      else if (current_memread && ID_EX_memread) 
      begin
        stall_select <= 1'b0;
        PCwrite <= 1'b0;
        IF_ID_write <= 1'b0;
        stall_detector <= 6'd2;
        counter <= 6'd0;
      end 
    end

    if (forward_stall) 
    begin
      stall_select <= 1'b0;
      PCwrite <= 1'b0;
      IF_ID_write <= 1'b0;
      stall_detector <= 6'd3;
      counter <= 6'd0;
    end

    if (stall_detector > 1'b0) 
    begin
      counter <= counter + 6'd1;
      if (counter == stall_detector) 
      begin
        stall_select <= 1'b1;
        PCwrite <= 1'b1;
        IF_ID_write <= 1'b1;
        stall_detector <= 6'd0;
        counter <= 6'd0;
      end
    end
  end
endmodule
