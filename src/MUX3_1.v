module MUX3_1 (
    in1,
    in2,
    in3,
    sel,
    out
);
input [63:0]in1,in2,in3;
input [1:0]sel;
output reg[63:0]out;
always @(*) begin
    case(sel)
        2'b01:out=in2;
        2'b10:out=in3;
        default:out=in1;
    endcase
end
endmodule