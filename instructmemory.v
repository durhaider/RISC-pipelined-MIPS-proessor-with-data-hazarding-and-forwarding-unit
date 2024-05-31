module instruct_memory (
  input [31:0] address,
  output reg [31:0] instruction,
  input clk,
  input rst
);

  reg [31:0] memory [0:1023]; 

  // any instructionss
  //you have to put always an NOP instructon after beq instruct
  initial begin
  
  memory[0]  = 32'b100000_00011_00001_00010_00000_100010; // R-type instruction (Subtract)
  memory[1]  = 32'b100000_00010_00101_01100_00000_100100; // R-type instruction (AND)
  memory[2]  = 32'b100000_00010_00110_01101_00000_100101; // R-type instruction (OR)
  memory[3]  = 32'b100000_00010_00010_01110_00000_100000; // R-type instruction (add)
  memory[4]  = 32'b101011_01111_00010_0000000000000001; // sw instruction
  memory[5]=32'b00000000000000000000000000000000; // NOP instruction
  memory[6]=32'b00000000000000000000000000000000; // NOP instruction
  memory[7]=32'b00000000000000000000000000000000; // NOP instruction
  memory[8]=32'b00000000000000000000000000000000; // NOP instruction
  memory[9]=32'b00000000000000000000000000000000; // NOP instructionx
  memory[10]=32'b00000000000000000000000000000000; // NOP instruction
    memory[11]  = 32'b100000_00011_00001_00100_00000_100000; // R-type instruction (add)
    memory[12]  = 32'b100000_00100_00101_01100_00000_101010; // R-type instruction (Set on less than)
    memory[13]  = 32'b100000_00100_00001_00010_00001_101111; // R-type instruction (shamt)

  
    memory[14]  = 32'b100011_00100_10000_0000000000000001; // lw instruction
	 memory[15]  = 32'b000100_00100_01101_0000000000000100; // beq instruction

 /*forwarding instructions
 sub $2, $3, $1
and $12, $2, $5
or $13, $2, $6
add $14, $2, $2
sw $2, 1($15)
 
add $4, $3, $1
slt $12, $4, $5
shamt $2, $4, 1
lw $16, 1($4)
beq $13, $4, address
*/
  
/*    memory[0]  = 32'b100000_00000_00001_00010_00000_100000; // R-type instruction (add)
    memory[1]  = 32'b100000_00011_10001_01010_00000_100010; // R-type instruction (Subtract)
    memory[2]  = 32'b100000_00000_00001_00010_00000_100100; // R-type instruction (AND)
memory[3]  = 32'b100000_00000_00001_00010_00000_100101; // R-type instruction (OR)
memory[4]  = 32'b100000_00000_00001_00010_00000_101010; // R-type instruction (Set on less than)
    memory[5]  = 32'b100011_01011_00010_0000000000000111; // lw instruction
    memory[6]  = 32'b101011_01001_00011_0000000000001001; // sw instruction
    memory[7]  = 32'b000100_00101_00110_0000000000000100; // beq instruction
    memory[8]=   32'b00000000000000000000000000000000; // NOP instruction
    memory[9]  = 32'b000010_00000000000000000000000010; // jump instruction
	 
	 
 add $2, $0, $1
	 sub $10, $3, $17
	 and $2, $0, $1
	 or $2, $0, $1
	 slt $2, $0, $1
	 
	 
	 lw $2, 7($11)
	 sw $3, 9($9)
	 beq $5, $6, address
	 j address
	 */
	
	 
	 
	// first 10 instructions
 
 // memory[1]  = 32'b100011_00011_00100_0000000000000001; // lw instruction 
 
 
/*     memory[0]  = 32'b100011_00001_00000_0000000000000001; // lw instruction
     memory[1]  = 32'b100000_00000_00010_00011_00000_100000; // R-type instruction (add)
	 */
	  //lw and r-type = lw $0 ,$1 (1) 
//lw and r-type = add $3 ,$0 ,$2, data dependency  


//change for sw hazard instruct to memreadwire1 in instruct mem
				 //.memread(Memread_wire1)

//add abreak between data dependency intructions
 /* 
	memory[0]  = 32'b100000_01011_01100_00111_00000_100000; // R-type instruction (add)
    memory[1]  = 32'b101011_10000_00111_0000000000000000; //sw
	*/
//add $7 ,$11 ,$12, data dependency  
 //sw $7 ,$16 (0)

/* memory[0]  = 32'b100011_01000_01011_0000000000000000; // 2nd lw instruction
 memory[1]  = 32'b100011_01011_01001_0000000000000010; // lw instruction
 //lw and lw
 
 //lw $11, 0($8)
 //lw $9, 2($11)*/
  
 
/*
	 memory[0]  = 32'b100011_01100_00011_0000000000000010; // lw instruction
	   memory[1]  = 32'b101011_01111_00011_0000000000000010; //sw
	 
	// lw & sw
//	lw $3, 2($12)
//	sw $3, 2($15)
	 
	memory[0]  = 32'b100011_01110_01111_0000000000000000; // lw instruction
	memory[1]  = 32'b100000_01111_00011_00111_00000_101010; // R-type instruction (SLT)
	lw $15, 0($14)
	slt $7, $15, $3*/

	//beq followed by lw with hazard btn=1
/*	memory[0]=32'b000100_00111_00111_0000000000000100; // beq instruction
	memory[1]=32'b00000000000000000000000000000000; // NOP instruction
	memory[2]=32'b00000000000000000000000000000000; // NOP instruction
	memory[3]=32'b00000000000000000000000000000000; // NOP instruction
	memory[4]=32'b00000000000000000000000000000000; // NOP instruction
	memory[5]  = 32'b100011_11110_01111_0000000000000000; // lw instruction
	memory[6]=32'b00000000000000000000000000000000; // NOP instruction
	 
	 beq $7, $7, jumptolwinstruct
	 NOP cycles as they will be missed in between
	 lw $15, 0($30)*/
/*
memory[0]=32'b000100_00111_00111_0000000000000100; // beq instruction
	memory[1]=32'b00000000000000000000000000000000; // NOP instruction
	memory[2]=32'b00000000000000000000000000000000; // NOP instruction
	memory[3]=32'b00000000000000000000000000000000; // NOP instruction
	memory[4]=32'b00000000000000000000000000000000; // NOP instruction
	memory[5]=32'b000010_00000000000000000000000011; // jump instruction
memory[6] = 32'b00000000000000000000000000000000; // NOP instruction
	memory[7]=32'b00000000000000000000000000000000; // NOP instruction
	memory[8]=32'b00000000000000000000000000000000; // NOP instruction
	memory[9]=32'b00000000000000000000000000000000; // NOP instruction
	memory[10]=32'b00000000000000000000000000000000; // NOP instruction
	memory[11]=32'b00000000000000000000000000000000; // NOP instruction
	memory[12]  = 32'b100011_11110_01111_0000000000000000; // lw instruction
	*//*beq $7, $7, jumptojumpinstruct
	 NOP cycles as they will be missed in between
	 jump lwaddress
	 lw $15, 0($30)*/
	
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      instruction <= 32'b00000000000000000000000000000000; // Reset instruction to 0
    end 
	 else 

	 begin
      instruction <= memory[address];
end		// Read instruction from memory based on address
  // end
  end

endmodule

