module Adder (
    in1,
    in2,
    out
);
input signed[63:0]in1,in2;
output [63:0]out;
assign out=in1+in2;
endmodule