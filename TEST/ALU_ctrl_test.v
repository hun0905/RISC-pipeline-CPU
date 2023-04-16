`include "../RTL/ALUControl.v"


module test();
integer i;

reg clk,rst_n;
real CYCLE = 20;
reg [1:0]ALUop;
reg [6:0]func7;
reg [2:0]func3;
wire [3:0]Op;
initial 
begin
	clk = 0;
end
always #(CYCLE/2.0) clk = ~clk;


ALUControl aluctr1(.ALUop(ALUop),.func7(func7),.func3(func3),.Op(Op));
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