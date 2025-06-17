module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUCtl,
    output reg [31:0] ALUResult,
    output zero
);

    always @(*) begin
        case (ALUCtl)
            4'b0010: ALUResult = A + B;   
            4'b0110: ALUResult = A - B;   
            4'b0000: ALUResult = A & B;   
            4'b0001: ALUResult = A | B;
            4'b0111: ALUResult = (A < B) ? 32'b1 : 32'b0; // SLT
            default: ALUResult = 32'b0;
        endcase
    end

    assign zero = (ALUResult == 0);

endmodule

