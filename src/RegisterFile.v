module RegisterFile (
    input clk,
    input rw,
    input [4:0] rs, rt, rd,
    input [31:0] WriteData,
    output [31:0] ReadData1,
    output [31:0] ReadData2
);

    reg [31:0] Registers[0:4];
    initial begin
      Registers[0] <= 0;
    	 Registers[1] <= 8;
      Registers[2] <= 20;
      Registers[3] <= 5;
      Registers[4] <= 12;
    end
    assign ReadData1 = Registers[rs];
    assign ReadData2 = Registers[rt];
    always @(posedge clk) begin
        if (rw==1) 
            Registers[rd] <= WriteData;
    end

endmodule



