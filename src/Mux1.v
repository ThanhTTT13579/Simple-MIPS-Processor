module Mux1(
  input [20:16]inst20_16,
  input [15:11]inst15_11,
  input RegDst,
  output reg [4:0]WriteRegister
);
  always@(RegDst, inst20_16, inst15_11) begin
    case(RegDst)
      0 : WriteRegister <= inst20_16;
      1 : WriteRegister <= inst15_11;
    endcase
  end
endmodule