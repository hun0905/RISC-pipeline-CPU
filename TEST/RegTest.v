`include "../RTL/Registers.v"


module test();
integer i;
reg [4:0]ReadReg1,ReadReg2,WriteReg;
reg [31:0]WriteData;
reg RegWriteEnable;
wire [31:0]ReadData1,ReadData2;
reg Write;
reg clk,rst_n;
real CYCLE = 20;
initial 
begin
	clk = 0;
end
always #(CYCLE/2.0) clk = ~clk;


Registers Regs1(.clk(clk),.rst_n(rst_n),.ReadReg1(ReadReg1),.ReadReg2(ReadReg2)
                ,.WriteReg(WriteReg),.WriteData(WriteData),.RegWriteEnable(RegWriteEnable),.ReadData1(ReadData1),.ReadData2(ReadData2));
initial begin
    force clk = 0;
    reset;
    for(i=0;i<32;i=i+1)begin
        RegWriteEnable=1;
        WriteReg=i;
        WriteData=$random;
        @(negedge clk);
        RegWriteEnable=0;
    end

    for(i=0;i<32;i=i+1)begin
        ReadReg1=i;
        ReadReg2=31-i;
        @(negedge clk);
        $display("%d %d",ReadData1,ReadData2);
    end
    $finish;
end


task reset; 
begin 
  #(1);	
  rst_n=0;
  #(CYCLE/2);
  rst_n=1;
  #(3);		
  release clk;
end 
endtask

endmodule