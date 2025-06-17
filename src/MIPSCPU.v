module MIPSCPU(
  input clk,
  input rst,
  input [31:0]address,
  output wire [31:0]inst,
  output wire RegDst, RegWrite, ALUSrc, MemToReg, MemRead, MemWrite,
  output wire [1:0]ALUOp,
  output wire [4:0] WriteReg,
  output wire [31:0] ReadData1,
  output wire [31:0] ReadData2,
  output wire [31:0] Extend32,
  output wire [31:0] ALU_in2,
  output wire [3:0] ALUCtl,
  output wire zero,
  output wire [31:0]ALUResult,
  output wire [31:0] ReadData,
  output wire [31:0] WD
);
  IMem IMem_0(
    .clk(clk),
    .address(address),
    .inst(inst)
  );
  ControlUnit CU_0(
    .Opcode(inst[31:26]),
    .RegDst(RegDst),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemToReg(MemToReg),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUOp(ALUOp)
  );
  Mux1 Mux1_0(
    .inst20_16(inst[20:16]),
    .inst15_11(inst[15:11]),
    .RegDst(RegDst),
    .WriteRegister(WriteReg)
  );
  RegisterFile regfile_0(
    .clk(clk),
    .rs(inst[25:21]),
    .rt(inst[20:16]),
    .rw(RegWrite),
    .rd(WriteReg),
    .WriteData(WD),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2)
  );
  SignExtended se_0(
    .in(inst[15:0]),
    .out(Extend32)
  );
  Mux2 Mux2_0(
    .ALUSrc(ALUSrc),
    .ReadData2(ReadData2),
    .signextended_out(Extend32),
    .ALU_in2(ALU_in2)
  );
  ALUControl AlUCtl_0(
    .ALUOp(ALUOp),
    .Funct(inst[5:0]),
    .ALUCtl(ALUCtl)
  );
  ALU alu_0(
    .A(ReadData1),
    .B(ALU_in2),
    .ALUCtl(ALUCtl),
    .ALUResult(ALUResult),
    .zero(zero)
  );
  DataMemory dtm_0(
    .clk(clk),
    .address(ALUResult),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .WriteData(ReadData2),
    .ReadData(ReadData)
  );
  Mux3 mux3_0(
    .ReadData(ReadData),
    .ALUResult(ALUResult),
    .MemToReg(MemToReg),
    .WD(WD)
  );
endmodule
    
  