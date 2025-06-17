module ControlUnit(
  input [5:0] Opcode,
  output reg RegDst, RegWrite, ALUSrc,
  output reg MemToReg, MemRead, MemWrite,
  output reg [1:0]ALUOp
);
  always@(*)begin
    case(Opcode)
      6'b000000: begin //R-type
        RegDst <= 1;
        ALUSrc <= 0;
        MemToReg <= 0;
        RegWrite <= 1;
        MemRead <= 0;
        MemWrite <= 0;
        ALUOp <= 2'b10;
      end
      6'b100011: begin //lw
        RegDst <= 0;
        ALUSrc <= 1;
        MemToReg <= 1;
        RegWrite <= 1;
        MemRead <= 1;
        MemWrite <= 0;
        ALUOp <= 2'b00;
      end
      6'b101011: begin //SW
        RegDst <= 0;
        ALUSrc <= 1;
        MemToReg <= 0;
        RegWrite <= 0;
        MemRead <= 0;
        MemWrite <= 1;
        ALUOp <= 2'b00;
      end
      6'b001000: begin //addi
        RegDst <= 0;
        ALUSrc <= 1;
        MemToReg <= 0;
        RegWrite <= 1;
        MemRead <= 0;
        MemWrite <= 0;
        ALUOp <= 2'b10;
      end
      6'b001100: begin  //andi/slti/ori
        RegDst   <= 0;      
        ALUSrc   <= 1;     
        MemToReg <= 0;     
        RegWrite <= 1;     
        MemRead  <= 0;      
        MemWrite <= 0;     
        ALUOp    <= 2'b10;  
      end
    endcase
  end
endmodule