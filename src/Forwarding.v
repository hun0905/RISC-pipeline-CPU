module Forwarding (
    regwrite_wb,
    wr_wb,
    regwrite_mem,
    wr_mem,
    regrs1_ex,
    regrs2_ex,
    forwardA,
    forwardB
);
input regwrite_wb,regwrite_mem;
input [4:0]wr_wb,wr_mem,regrs1_ex,regrs2_ex;
output reg [1:0]forwardA,forwardB;
always@(*)begin
    if( regwrite_mem && wr_mem!=0 &&(wr_mem==regrs1_ex)) forwardA=2'b01; // for EX hazard
    else if(regwrite_wb && (wr_wb!=0) && (wr_wb==regrs1_ex)) forwardA=2'b10;//for MEM hazard
    else forwardA=2'b00;
end

always@(*)begin
    if( regwrite_mem && wr_mem!=0 &&(wr_mem==regrs2_ex))  forwardB=2'b01;
    else if(regwrite_wb && (wr_wb!=0) && (wr_wb==regrs2_ex)) forwardB=2'b10;
    else forwardB=2'b00;
end
endmodule