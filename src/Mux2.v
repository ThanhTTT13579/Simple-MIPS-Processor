module Mux2(
  input [31:0]ReadData2,
  input [31:0]signextended_out,
  input ALUSrc,
  output reg [31:0]ALU_in2
);
  always@(ALUSrc, ReadData2, signextended_out)begin
    case(ALUSrc)
      0 : ALU_in2 <= ReadData2;
      1 : ALU_in2 <= signextended_out;
    endcase
  end
endmodule