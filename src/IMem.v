module IMem(
  input clk,
  input [31:0]address,
  output reg [31:0]inst
);
  reg [31:0] Mem[0:127];
  initial begin
    $readmemh("inst_mem.txt", Mem);
  end
  always@(posedge clk)begin
    inst <= Mem[address[31:2]];
  end
endmodule