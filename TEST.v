`include "RISC-V-pipeline-CPU/src/top.v"
RISC-V-pipeline-CPU/src/top.v
`define CYCLE_TIME 20.0
module Pattern;
reg in_enable;
reg clk,rst_n;
reg [63:0]Addr;
reg [31:0]in_instruc;
real CYCLE = `CYCLE_TIME;
integer i,b,input_instruc;
wire [63:0]RD1ID,RD2ID,IMMID,ADDOUTID,ALUOUTEX,DMout,PC;
wire stall,equal,MEMTOREGWB,REGWRITEWB;
top top1(
    .in_enable(in_enable),
    .clk(clk),
    .rst_n(rst_n),
    .Addr(Addr),
    .in_instruc(in_instruc),
    .PC(PC),
    .stall(stall),
    .equal(equal),
    .RD1ID(RD1ID),
    .RD2ID(RD2ID),
    .IMMID(IMMID),
    .ADDOUTID(ADDOUTID),
    .ALUOUTEX(ALUOUTEX),
    .DMout(DMout),
    .MEMTOREGWB(MEMTOREGWB),
    .REGWRITEWB(REGWRITEWB)
);



initial 
begin
	clk = 0;
end
always #(CYCLE/2.0) clk = ~clk;
initial begin
    force clk = 0;
    reset_signal_task;
    in_enable=1;
    input_instruc=$fopen("../TEST/ControlHazardPattern.txt","r");
    input_instruct_task(15);
    $display("%b \n\n\n\n",top1.PCSRCID);
    for(i=0;i<20;i=i+1) begin
      $display("%d : %b %b %d %d %d",top1.PC,top1.stall,top1.INSTRUCID,top1.forward1.regrs1_ex,top1.forward1.wr_wb,top1.forward1.forwardA);
      @(negedge clk);
    end
    $display("output registers:\n");
    for(i=0;i<32;i=i+1)$display("%d : %b ",i,top1.registers1.Registers[i]);
    $display("\n");
    $display("output memory:\n");
    for(i=0;i<32;i=i+1) $display("%d : %b ",i,top1.dm1.memory[i]);
    $finish;
end


task reset_signal_task; 
begin 
  #(0.5);	rst_n=0;
  #(CYCLE/2);
  #(10);	rst_n=1;
  #(3);		release clk;
end 
endtask


task input_instruct_task(input [9:0]len);
begin
	in_enable = 1'b1;
	Addr=0;
  for(i=0;i<len;i=i+1)begin
	  b=$fscanf(input_instruc, "%b", in_instruc);
    @(negedge clk);
    Addr=Addr+4;
	end
  in_enable = 1'b0;
end
endtask
endmodule