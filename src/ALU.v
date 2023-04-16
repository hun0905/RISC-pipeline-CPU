module ALU #(
    parameter WIDTH=64
)(
    clk,
    rst_n,
    aluctrl,
    in1,
    in2,
    result,
);
parameter AND=0;
parameter OR=1;
parameter ADD=2;
parameter SUB=6;
input clk,rst_n;
input [3:0]aluctrl;
input signed[WIDTH-1:0]in1,in2;
output reg signed[WIDTH-1:0]result;

always @(*) begin
    case(aluctrl)
        AND:result=in1&in2;
        OR:result=in1|in2;
        ADD:result=in1+in2;
        SUB:result=in1-in2;
        default:result=0;
    endcase
end
endmodule