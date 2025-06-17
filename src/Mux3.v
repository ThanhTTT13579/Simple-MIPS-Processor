module Mux3(
  input [31:0]ReadData,
  input [31:0]ALUResult,
  input MemToReg,
  output reg [31:0]WD
);
  always@(MemToReg, ReadData, ALUResult)begin
    case(MemToReg)
      0 : WD <= ReadData;
      1 : WD <= ALUResult;
    endcase
  end
endmodule