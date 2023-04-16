module EX_MEM (
    clk,
    rst_n,
    aluout,
    writeregister,
    memread,
    memwrite,
    memtoreg,
    regwrite,
    readdata2,
    aluout_out,
    writeregister_out,
    memread_out,
    memwrite_out,
    memtoreg_out,
    regwrite_out,
    readdata2_out
);
input clk,rst_n;
input [4:0]writeregister;
input memread,memwrite,memtoreg,regwrite;
input [63:0]readdata2,aluout;
output reg memread_out,memwrite_out,memtoreg_out,regwrite_out;
output reg [4:0]writeregister_out;
output reg [63:0]readdata2_out,aluout_out;
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) aluout_out<=64'b0;
    else aluout_out<=aluout;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) writeregister_out<=4'b0;
    else writeregister_out<=writeregister;
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n) memread_out<=1'b0;
    else memread_out<=memread;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) memwrite_out<=1'b0;
    else memwrite_out<=memwrite;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) memtoreg_out<=1'b0;
    else memtoreg_out<=memtoreg;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) regwrite_out<=1'b0;
    else regwrite_out<=regwrite;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) readdata2_out<=1'b0;
    else readdata2_out<=readdata2;
end
endmodule