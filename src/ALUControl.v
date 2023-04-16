module ALUControl (
    ALUop,
    func7,
    func3,
    Op
);
input [2:0]ALUop;
input [6:0]func7;
input [2:0]func3;
output [3:0]Op;
assign Op=(ALUop==3'b000)?4'b0010:
          (ALUop==3'b010||ALUop==3'b110)?4'b0110: 
          (ALUop==3'b001&&func3==3'b110)?4'b0001: //ori
          (ALUop==3'b001&&func3==3'b111)?4'b0000: //andi
          (ALUop==3'b001&&func3==3'b000)?4'b0010: //addi
          ({func7,func3}==10'b0000000_000)?4'b0010:
          ({func7,func3}==10'b0100000_000)?4'b0110:
          ({func7,func3}==10'b0000000_111)?4'b0000:
          ({func7,func3}==10'b0000000_110)?4'b0001:4'b0000;

endmodule