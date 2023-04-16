module IM (
    clk,
    rst_n,
    in_enable,
    in, // input of instruc
    in_addr,
    PCAddr,//just used for test
    instruc,
);
input clk,rst_n,in_enable;
input [63:0]PCAddr,in_addr;
input [31:0]in;
output reg[31:0]instruc;
reg [31:0]instrucmem[31:0];
integer i;
always@(*) begin
    if(in_enable)instruc=32'b0;
    else instruc=instrucmem[PCAddr>>2];
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n) for(i=0;i<32;i=i+1) instrucmem[i]<=32'd0;
    else if(in_enable) instrucmem[in_addr>>2]<=in; 
end
endmodule