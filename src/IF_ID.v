module IF_ID (
    clk,
    rst_n,
    pc,
    instruc,
    hazard,
    flush,
    out_pc,
    out_instruc
);
input clk,rst_n,hazard,flush;
input [63:0]pc;
input [31:0]instruc;
output reg [63:0]out_pc;
output reg [31:0]out_instruc;
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) out_pc <=64'b0;
    else if(flush)out_pc<=64'b0;
    else if(hazard)out_pc<=out_pc;
    else out_pc<=pc;
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) out_instruc<=32'b0;
    else if(flush) out_instruc<=32'b0;
    else if(hazard)out_instruc<=out_instruc;
    else out_instruc<=instruc;
end
endmodule