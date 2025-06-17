module ALUControl (
	input [1:0] ALUOp,
	input [5:0] Funct,
	output reg [3:0] ALUCtl
);		
	always @(ALUOp, Funct) begin
	if(ALUOp == 2'b00)
		ALUCtl <= 2;   
	else if(ALUOp == 1)
		ALUCtl <= 6;		
	else
		case(Funct)
			6'b100000: ALUCtl <= 4'b0010; //add
			6'b100010: ALUCtl <= 4'b0110; //subtract		
			6'b100100: ALUCtl <= 4'b0000; //and	
			6'b100101: ALUCtl <= 4'b0001; //or	
			6'b100111: ALUCtl <= 4'b1100; //nor
			6'b101010: ALUCtl <= 4'b0111; //slt
			default: ALUCtl <= 4'b1111; //should not happen
		endcase
	end
endmodule
