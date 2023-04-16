`include "../RTL/ALU.v"


module test();
integer i;

reg clk,rst_n;
real CYCLE = 20;
reg [3:0]aluctrl;
reg [WIDTH-1:0]in1,in2;
wire [WIDTH-1:0]result;
wire zero;
initial 
begin
	clk = 0;
end
always #(CYCLE/2.0) clk = ~clk;

ALU alu1(.clk(clk),.rst_n(rst_n),.aluctrl(aluctrl),.in1(in1),.in2(in2),.reset(reset),.zero(zero));
initial begin
    force clk = 0;
    reset;
    for(i=0;i<4096;i=i+1)begin
        {ALUop,func7,func3}=i;
        #(1);
        $display("%b",Op);
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