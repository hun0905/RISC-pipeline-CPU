module Registers (
    clk,
    rst_n,
    ReadReg1,
    ReadReg2,
    WriteReg,
    WriteData,
    RegWriteEnable,
    ReadData1,
    ReadData2,
);
input clk,rst_n;
input [4:0]ReadReg1,ReadReg2,WriteReg;
input [63:0]WriteData;
input RegWriteEnable;
output reg [63:0]ReadData1,ReadData2;
reg [63:0]Registers[31:0];
integer i;
always@(posedge clk or negedge rst_n)begin 
    if(!rst_n) begin
        for(i=0;i<32;i=i+1) Registers[i]<=64'd0;
    end
    else if(RegWriteEnable) Registers[WriteReg]<=WriteData;
end
always @(*) begin
    if(WriteReg==ReadReg1) ReadData1=WriteData;
    else ReadData1=Registers[ReadReg1];
end
always @(*) begin
    if(WriteReg==ReadReg2) ReadData2=WriteData;
    else ReadData2=Registers[ReadReg2];
end
endmodule