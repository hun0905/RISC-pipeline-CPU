module comparator (
    in1,
    in2,
    out
);
input [63:0]in1,in2;
output out;
assign out=(in1==in2)?1'b1:1'b0;    
endmodule