module top(
  in_enable,
  clk,
  rst_n,
  Addr,
  in_instruc,
  PC,stall,
  equal,
  RD1ID,
  RD2ID,
  IMMID,
  ADDOUTID,
  ALUOUTEX,
  DMout,
  MEMTOREGWB,
  REGWRITEWB
);

input in_enable;
input clk,rst_n;
input [31:0]in_instruc;
input [63:0]Addr;
integer i,b,input_instruc;
//IF
wire stop;
output [63:0]PC;
wire [63:0]ADDOUTIF;
wire [63:0]PCIF;
wire [31:0]INSTRUCIF;
//ID
output stall,equal;
wire PCSRCID;
wire [63:0]comparatorin1,comparatorin2;
wire [31:0]INSTRUCID;
wire ALUOP1ID,ALUOP2ID,ALUOP3ID,ALUSRCID,BRANCHID,MEMREADID,MEMWRITEID,MEMTOREGID,REGWRITEID;
output [63:0]RD1ID,RD2ID,IMMID,ADDOUTID;
wire [63:0]PCID;
//EX
wire ALUOP1EX,ALUOP2EX,ALUOP3EX,ALUSRCEX,MEMREADEX,MEMWRITEEX,MEMTOREGEX,REGWRITEEX;
wire [63:0]aluin1,muxin1;
wire [4:0]WREX,REGRS1_EX,REGRS2_EX;
wire [6:0]FUNC7EX;
wire [2:0]FUNC3EX;
output [63:0]ALUOUTEX;
wire [63:0]PCEX,aluin2,RD1EX,RD2EX,IMMEX;
wire [3:0]Op;
wire [1:0]forwardA,forwardB;
//MEM
wire MEMREADMEM,MEMWRITEMEM,MEMTOREGMEM,REGWRITEMEM;
wire [63:0]RD2MEM,ALUOUTMEM;
wire [4:0]WRMEM;
output [63:0]DMout;
//WB
output MEMTOREGWB,REGWRITEWB;
wire [4:0]WRWB;
wire [63:0]ALUOUTWB,WRITEDATAWB,DMOUTWB;

//IF
assign stop = stall||in_enable;
MUX  mux3(.in1(ADDOUTIF),.in2(ADDOUTID),.sel(PCSRCID),.out(PCIF));
PC pc1(.clk(clk),.rst_n(rst_n),.next_pc(PCIF),.hazard(stop),.PC(PC));
IM im1(.clk(clk),.rst_n(rst_n),.in_enable(in_enable),.in(in_instruc),.in_addr(Addr),.PCAddr(PC),.instruc(INSTRUCIF));///
Adder adder1 (.in1(PC),.in2(64'd4),.out(ADDOUTIF));
IF_ID ifid1(.clk(clk),.rst_n(rst_n),.pc(PC),.instruc(INSTRUCIF),.hazard(stall),.flush(PCSRCID),.out_pc(PCID),.out_instruc(INSTRUCID));
//ID
assign PCSRCID = BRANCHID&equal;
Hazard hazard1(.memread_ex(MEMREADEX),.memread_mem(MEMREADMEM),.wr_ex(WREX),.wr_mem(WRMEM),
               .regrs1_id(INSTRUCID[19:15]),.regrs2_id(INSTRUCID[24:20]),.Opcode(INSTRUCID[6:0]),.stall(stall));

Control control1(.instruc(INSTRUCID[6:0]),.alusrc(ALUSRCID),.memtoreg(MEMTOREGID),
                .regwrite(REGWRITEID),.memread(MEMREADID),.memwrite(MEMWRITEID),.hazard(stall),
                .branch(BRANCHID),.aluop1(ALUOP1ID),.aluop2(ALUOP2ID),.aluop3(ALUOP3ID));
Registers registers1(.clk(clk),.rst_n(rst_n),.ReadReg1(INSTRUCID[19:15]),.ReadReg2(INSTRUCID[24:20]),.WriteReg(WRWB),
                     .WriteData(WRITEDATAWB),.RegWriteEnable(REGWRITEWB),.ReadData1(RD1ID),.ReadData2(RD2ID));
Adder adder2 (.in1(PCID),.in2(IMMID<<1),.out(ADDOUTID));

ImmGen immgen1(.in(INSTRUCID),.out(IMMID));
MUX3_1 mux3_1_1(.in1(RD1ID),.in2(ALUOUTMEM),.in3(DMOUTWB),.sel(forwardA),.out(comparatorin1));//ALUOUTMEM
MUX3_1 mux3_1_2(.in1(RD2ID),.in2(ALUOUTMEM),.in3(DMOUTWB),.sel(forwardB),.out(comparatorin2));
comparator cp1(.in1(comparatorin1),.in2(comparatorin2),.out(equal));
ID_EX idex1
(
    .clk(clk),.rst_n(rst_n),
    .readdata1(RD1ID),.readdata2(RD2ID),.imm(IMMID),.pc(PCID),.writeregister(INSTRUCID[11:7]),.aluop1(ALUOP1ID),
    .aluop2(ALUOP2ID),.aluop3(ALUOP3ID),.alusrc(ALUSRCID),.memread(MEMREADID), .memwrite(MEMWRITEID),
    .memtoreg(MEMTOREGID),.regwrite(REGWRITEID),.func7(INSTRUCID[31:25]),.func3(INSTRUCID[14:12]),.regrs1(INSTRUCID[19:15]),
    .regrs2(INSTRUCID[24:20]),.readdata1_out(RD1EX),.readdata2_out(RD2EX),.imm_out(IMMEX),.pc_out(PCEX),.writeregister_out(WREX),
    .aluop1_out(ALUOP1EX),.aluop2_out(ALUOP2EX),.aluop3_out(ALUOP3EX),.alusrc_out(ALUSRCEX),.memread_out(MEMREADEX),
    .memwrite_out(MEMWRITEEX),.memtoreg_out(MEMTOREGEX),.regwrite_out(REGWRITEEX),.func7_out(FUNC7EX),.func3_out(FUNC3EX),
    .regrs1_out(REGRS1_EX),.regrs2_out(REGRS2_EX)
);
//EX
MUX3_1 mux3_1_3(.in1(RD1EX),.in2(ALUOUTMEM),.in3(WRITEDATAWB),.sel(forwardA),.out(aluin1));
MUX3_1 mux3_1_4(.in1(RD2EX),.in2(ALUOUTMEM),.in3(WRITEDATAWB),.sel(forwardB),.out(muxin1));
MUX  mux1(.in1(muxin1),.in2(IMMEX),.sel(ALUSRCEX),.out(aluin2));
ALUControl alucontrol (.ALUop({ALUOP1EX,ALUOP2EX,ALUOP3EX}),.func7(FUNC7EX),.func3(FUNC3EX),.Op(Op));
ALU #(.WIDTH(64)) alu1(.clk(clk),.rst_n(rst_n),.aluctrl(Op),.in1(aluin1),.in2(aluin2),.result(ALUOUTEX));
Forwarding forward1(.regwrite_wb(REGWRITEWB),.wr_wb(WRWB),.regwrite_mem(REGWRITEMEM),.wr_mem(WRMEM),.regrs1_ex(REGRS1_EX),
                    .regrs2_ex(REGRS2_EX),.forwardA(forwardA),.forwardB(forwardB));
EX_MEM exmem1
(
  .clk(clk),.rst_n(rst_n),
  .aluout(ALUOUTEX),.writeregister(WREX),.memread(MEMREADEX),.memwrite(MEMWRITEEX),
  .memtoreg(MEMTOREGEX),.regwrite(REGWRITEEX),.readdata2(muxin1),.aluout_out(ALUOUTMEM),
  .writeregister_out(WRMEM),.memread_out(MEMREADMEM),.memwrite_out(MEMWRITEMEM),
  .memtoreg_out(MEMTOREGMEM),.regwrite_out(REGWRITEMEM),.readdata2_out(RD2MEM)
);
//MEM
DM dm1(.clk(clk),.rst_n(rst_n),.Addr(ALUOUTMEM),.WriteData(RD2MEM),.ReadData(DMout),.MemWrite(MEMWRITEMEM),.MemRead(MEMREADMEM));
MEM_WB memwb1(.clk(clk),.rst_n(rst_n),.dmout(DMout),.aluout(ALUOUTMEM),
              .writeregister(WRMEM),.memtoreg(MEMTOREGMEM),.regwrite(REGWRITEMEM),
               .dmout_out(DMOUTWB), .aluout_out(ALUOUTWB), .writeregister_out(WRWB),
               .memtoreg_out(MEMTOREGWB),.regwrite_out(REGWRITEWB));
//WB
MUX mux2(.in1(ALUOUTWB),.in2(DMOUTWB),.sel(MEMTOREGWB),.out(WRITEDATAWB));


endmodule