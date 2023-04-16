module PC (
    clk,
    rst_n,
    next_pc,
    hazard,
    PC
);
input clk,rst_n,hazard;
input [63:0]next_pc;
output reg [63:0]PC;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) PC<=64'b0;
    else if(hazard)PC<=PC;
    else PC<=next_pc;
end
endmodule