module DM (
    clk,
    rst_n,
    Addr,
    WriteData,
    ReadData,
    MemWrite,
    MemRead
);
input clk,rst_n,MemRead,MemWrite;
input [63:0]WriteData;
input [63:0]Addr;
output reg[63:0]ReadData;
reg [63:0]memory[63:0];
integer i;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) for(i=0;i<64;i=i+1) memory[i]<=63'b0;
    else if(MemWrite) memory[Addr]<= WriteData;
end
always@(*)begin
    if(MemRead) ReadData=memory[Addr];
    else ReadData=63'b0;
end
endmodule