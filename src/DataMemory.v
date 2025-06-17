module DataMemory(
  input clk,
  input [6:0] address,
  input MemWrite, MemRead,
  input [31:0] WriteData,
  
  output reg [31:0] ReadData
);
  reg [31:0] Mem[0:255];
  initial begin
    Mem[0]=5;
    Mem[1]=6;
    Mem[2]=7;
  end
  always@(posedge clk)begin
    if(MemWrite)
      Mem[address[6:2]] <= WriteData;
  end
  always@(negedge clk)begin
    if(MemRead)
      ReadData <= Mem[address[6:2]];
  end
endmodule