module Hazard (
    memread_ex,
    memread_mem,
    wr_ex,
    wr_mem,
    regrs1_id,
    regrs2_id,
    Opcode,
    stall,
);
input memread_ex,memread_mem;
input [4:0]wr_ex,wr_mem,regrs1_id,regrs2_id;
input [6:0]Opcode;
parameter SB=7'b1100011;
output reg stall;
always @(*) begin
    if(memread_ex&& ( (wr_ex==regrs1_id)||(wr_ex==regrs2_id))) stall=1'b1;
    else if(memread_mem && ( (wr_mem==regrs1_id)||(wr_mem==regrs2_id)) && Opcode==SB) stall=1'b1;
    else stall=1'b0;
end
endmodule