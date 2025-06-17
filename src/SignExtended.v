module SignExtended(
  input [15:0] in,
  output reg [31:0] out
);
  always@(in) begin
    out[31:0] <= in[15:0];
  end
endmodule