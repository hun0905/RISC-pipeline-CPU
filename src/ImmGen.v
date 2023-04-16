module ImmGen(
    in,
    out
);
input [31:0]in;
output reg[63:0]out;
always@(*) begin
    case (in[6:0])
        //I type
        'h03:out=(in[31]==0)?{52'b0,in[31:20]}:{52'b1,in[31:20]};
        'h0F:out=(in[31]==0)?{52'b0,in[31:20]}:{52'b1,in[31:20]};
        'h13:out=(in[31]==0)?{52'b0,in[31:20]}:{52'b1,in[31:20]};
        'h1B:out=(in[31]==0)?{52'b0,in[31:20]}:{52'b1,in[31:20]};
        'h67:out=(in[31]==0)?{52'b0,in[31:20]}:{52'b1,in[31:20]};
        'h73:out=(in[31]==0)?{52'b0,in[31:20]}:{52'b1,in[31:20]};
        //S type
        'h23:out=(in[31]==0)?{52'b0,in[31:25],in[11:7]}:{52'b1,in[31:25],in[11:7]};
        //SB type
        'h63:out=(in[31]==0)?{52'b0,in[31],in[7],in[30:25],in[11:8]}:{52'b1,in[31],in[7],in[30:25],in[11:8]};
        default:out='b0;
    endcase    
end

endmodule