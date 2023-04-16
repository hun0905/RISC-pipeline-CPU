module Control (
    instruc,
    alusrc,
    memtoreg,
    regwrite,
    memread,
    memwrite,
    hazard,
    branch,
    aluop1,
    aluop2,
    aluop3
);
input [6:0]instruc;
input hazard;
parameter R=7'b0110011;
parameter ld=7'b0000011;
parameter sd=7'b0100011;
parameter beq=7'b1100011;
parameter i = 7'b0010011;


//jal
output reg alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop1,aluop2,aluop3;
always@(*)begin
    if(!hazard)
        case(instruc)
            R:alusrc=1'b0;
            ld:alusrc=1'b1;
            sd:alusrc=1'b1;
            beq:alusrc=1'b0;
            i:alusrc=1'b1;
            default:alusrc=1'b0;
        endcase
    else alusrc=1'b0;
end
always@(*)begin
    if(!hazard)
        case(instruc)
            R:memtoreg=1'b0;
            ld:memtoreg=1'b1;
            sd:memtoreg=1'b0;
            beq:memtoreg=1'b0;
            i:memtoreg=1'b0;
            default:memtoreg=1'b0;
        endcase
    else memtoreg=1'b0;
end
always@(*)begin
    if(!hazard)
        case(instruc)
            R:regwrite=1'b1;
            ld:regwrite=1'b1;
            sd:regwrite=1'b0;
            beq:regwrite=1'b0;
            i:regwrite=1'b1;
            default:regwrite=1'b0;
        endcase
    else regwrite=1'b0;
end
always@(*)begin
    if(!hazard)
        case(instruc)
            R:memread=1'b0;
            ld:memread=1'b1;
            sd:memread=1'b0;
            beq:memread=1'b0;
            i:memread=1'b0;
            default:memread=1'b0;
        endcase
    else memread=1'b0;
end
always@(*)begin
    if(!hazard)
        case(instruc)
            R:memwrite=1'b0;
            ld:memwrite=1'b0;
            sd:memwrite=1'b1;
            beq:memwrite=1'b0;
            i:memwrite=1'b0;
            default:memwrite=1'b0;
        endcase
    else memwrite =1'b0;
end
always@(*)begin
    if(!hazard)
        case(instruc)
            R:branch=1'b0;
            ld:branch=1'b0;
            sd:branch=1'b0;
            beq:branch=1'b1;
            default:branch=1'b0;
        endcase
    else branch=1'b0;
end
always@(*)begin
    if(!hazard)
        case(instruc)
            R:aluop1=1'b1;
            ld:aluop1=1'b0;
            sd:aluop1=1'b0;
            beq:aluop1=1'b0;
            i:aluop1=1'b1;
            default:aluop1=1'b0;
        endcase
    else aluop1=1'b0;
end
always@(*)begin
    if(!hazard)
        case(instruc)
            R:aluop2=1'b0;
            ld:aluop2=1'b0;
            sd:aluop2=1'b0;
            beq:aluop2=1'b1;
            i:aluop2=1'b1;
            default:aluop2=1'b0;
        endcase
    else aluop2=1'b0;
end
always@(*)begin
    if(!hazard)
        case(instruc)
            R:aluop3=1'b0;
            ld:aluop3=1'b0;
            sd:aluop3=1'b0;
            beq:aluop3=1'b0;
            i:aluop3=1'b1;
            default:aluop3=1'b0;
        endcase
    else aluop3=1'b0;
end
endmodule