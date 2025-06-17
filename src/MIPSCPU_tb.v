`timescale 1ns / 1ps

module MIPSCPU_tb;

  reg clk;
  reg rst;
  reg [31:0] address;

  wire [31:0] inst;
  wire RegDst, RegWrite, ALUSrc, MemToReg, MemRead, MemWrite;
  wire [1:0] ALUOp;
  wire [4:0] WriteReg;
  wire [31:0] ReadData1, ReadData2, Extend32, ALU_in2;
  wire [3:0] ALUCtl;
  wire zero;
  wire [31:0] ALUResult, ReadData, WD;

  // Instantiate MIPSCPU
  MIPSCPU uut (
    .clk(clk),
    .rst(rst),
    .address(address),
    .inst(inst),
    .RegDst(RegDst),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemToReg(MemToReg),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .ALUOp(ALUOp),
    .WriteReg(WriteReg),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .Extend32(Extend32),
    .ALU_in2(ALU_in2),
    .ALUCtl(ALUCtl),
    .zero(zero),
    .ALUResult(ALUResult),
    .ReadData(ReadData),
    .WD(WD)
  );

  // Clock generation: 10ns clock period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    rst = 1;
    address = 0;
    #15;
    rst = 0;

    // Run through 100 instructions (address increases by 4 each cycle)
    repeat (100) begin
      #10;
      address = address + 4;
    end

    #100; // Wait for final instructions to settle
    $display("Simulation completed.");
    $stop;
  end

endmodule
