module ID_EX 
(
    clk,rst_n,
    readdata1,readdata2,imm,pc,writeregister,aluop1,aluop2,aluop3,alusrc,memread,memwrite,memtoreg,regwrite,func7,
    func3,regrs1,regrs2,readdata1_out,readdata2_out,imm_out,pc_out,writeregister_out,aluop1_out,aluop2_out,aluop3_out,
    alusrc_out,memread_out,memwrite_out,memtoreg_out,regwrite_out,func7_out,func3_out,regrs1_out,regrs2_out
);
input clk,rst_n;
input [63:0]readdata1,readdata2,imm,pc;
input aluop1,aluop2,aluop3,alusrc,memread,memwrite,memtoreg,regwrite;
input [4:0]writeregister,regrs1,regrs2;
input [6:0]func7;
input [2:0]func3;
output reg [63:0]readdata1_out,readdata2_out,imm_out,pc_out;
output reg aluop1_out,aluop2_out,aluop3_out,alusrc_out,memread_out,memwrite_out,memtoreg_out,regwrite_out;
output reg [4:0]writeregister_out,regrs1_out,regrs2_out;
output reg [6:0]func7_out;
output reg [2:0]func3_out;
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)readdata1_out<=64'b0;
    else readdata1_out<=readdata1;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)readdata2_out<=64'b0;
    else readdata2_out<=readdata2;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)imm_out<=63'b0;
    else imm_out<=imm;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)pc_out<=63'b0;
    else pc_out<=pc;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)writeregister_out<=1'b0;
    else writeregister_out<=writeregister;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)aluop1_out<=1'b0;
    else aluop1_out<=aluop1;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)aluop2_out<=1'b0;
    else aluop2_out<=aluop2;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)alusrc_out<=1'b0;
    else alusrc_out<=alusrc;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)memread_out<=1'b0;
    else memread_out<=memread;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)memwrite_out<=1'b0;
    else memwrite_out<=memwrite;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)memtoreg_out<=1'b0;
    else memtoreg_out<=memtoreg;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)regwrite_out<=1'b0;
    else regwrite_out<=regwrite;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)func7_out<=7'b0;
    else func7_out<=func7;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)func3_out<=3'b0;
    else func3_out<=func3;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)regrs1_out<=5'b0;
    else regrs1_out<=regrs1;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)regrs2_out<=5'b0;
    else regrs2_out<=regrs2;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)aluop3_out<=1'b0;
    else aluop3_out<=aluop3;
end
endmodule