module MEM_WB (
    clk,
    rst_n,
    dmout,
    aluout,
    writeregister,
    memtoreg,
    regwrite,
    dmout_out, 
    aluout_out, 
    writeregister_out, 
    memtoreg_out, 
    regwrite_out
);
input clk, rst_n;
input memtoreg,regwrite;
input [4:0]writeregister;
input [63:0]dmout,aluout;
output reg  memtoreg_out, regwrite_out;
output reg [63:0]dmout_out,aluout_out;
output reg [4:0]writeregister_out;
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) dmout_out<=64'b0;
    else dmout_out<=dmout;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) aluout_out<=64'b0;
    else aluout_out<=aluout;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) writeregister_out<=4'b0;
    else writeregister_out<=writeregister;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) memtoreg_out<=1'b0;
    else memtoreg_out<=memtoreg;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) regwrite_out<=1'b0;
    else regwrite_out<=regwrite;
end
endmodule