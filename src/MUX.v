module MUX 
(
    in1,
    in2,
    sel,
    out
);
input [63:0]in1;
input [63:0]in2;
input sel;
output [63:0]out;
assign out=(sel==0)?in1:in2;    
endmodule