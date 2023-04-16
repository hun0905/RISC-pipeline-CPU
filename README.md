# RISC-pipeline-CPU
## Overview
In this project, i implement a pipeline CPU with RISC-V instruction set architecture and then I perform verification on HAPS100.All of my RTL(.v file) codes are in src folder. This CPU supports Rtype, some of I dype(addi, andi, ori) , ld, sd and beq instruction and. I adopt the classic five stage design (Instruction fetch, Instruction decode, Execute, Memory access, Writeback) in the CPU and there are also hazard and forwarding unit to prevent data hazard and control hazard resulting from pipeline execution. 
## Description
Below are the introduction of some important components (not all components are included). Because these CPU support pipeline execution, there are many wires with same function but in different stage. Therefore, I name each wire as "Function"+"Stage", ex: INSTRUCID means instruct in ID stage(There is also instruc in IF stage)
![image](https://github.com/hun0905/RISC-pipeline-CPU/blob/main/diagram/CPU_Diagram.png)
### IF:
- **PC**(programming counter) : PC can control which instruction to be exectued next time.That is, we need PC to decide the addres of the instrcution to be executed. Generally, we may save a lot of instrcution in IM and output of PC incease 4 each time. However, when we perform instructions such as beq, we need as mux to decide whether PC increases 4 as usual or increases number assigned by instruction.
-  **IM** (instruction memory) : the instruction to be executed is saved in IM. Before we start to execute instruction, we need to input instructions first. I use a wire(in_enable) to control the mode of IM. When in_enable is 1, we can write instruction into IM and the PC is stopped. As we set in_enable to 0, the instruction will be executed  according to the address received from PC.
### IM: 
- **Registers** : In most of the instruction, we need to use data saved in registers. The main purpose of Registers component is to manage these registers. As it receives address(ReadReg1, ReagReg2), it can provide the corresponding data according to the address. Besides, when it receive address from WriteReg, it can write data from WriteData to the corresponging register. However, in some hazard cases, when the WriteReg and ReadReg1 or ReadReg2 are the same, it needs to read data directly from WriteData instead register. 
- **Control** :  In many of our components, we need some control signals to decide their states. The control unit needs to extract infromation from instruction and assign value of each control signals. The table of control signal corresponding to each instruction is listed below.(not all instructions are supported)

| instruc[6:0] 	| alusrc 	| memtoreg 	| regwrite 	| memread 	| memwrite 	| branch 	| aluop1 	| aluop2 	| aluop3 	|
|--------------	|--------	|----------	|----------	|---------	|----------	|--------	|--------	|--------	|--------	|
| 0110011(R)   	| 0      	| 0        	| 1        	| 0       	| 0        	| 0      	| 1      	| 0      	| 0      	|
| 0000011(ld)  	| 1      	| 1        	| 1        	| 1       	| 0        	| 0      	| 0      	| 0      	| 0      	|
| 0100011(sd)  	| 1      	| 0        	| 0        	| 0       	| 1        	| 0      	| 0      	| 0      	| 0      	|
| 1100011(beq) 	| 0      	| 0        	| 0        	| 0       	| 0        	| 1      	| 0      	| 1      	| 0      	|
| 0010011(I)   	| 1      	| 0        	| 1        	| 0       	| 0        	| 0      	| 1      	| 1      	| 1      	|


- **Hazard** : Hazard unit need to chech whether hazard happens or not. if hazard really happen, it need to set stall to 1 to stop instruction in IF & IM.
- **comparator** : Comparator is used for beq instruction. When ReadData1 and ReadData2 are the same, The comparator can output signal to remove instruction in IF stage and change the PC to assigned value. The input of comparator need some control by some mux because we need to prevent data hazard from happening.
- **ImmGen** : This unit is to extend our imm to  64bits. Because the imm from instruction is not 64bits, when we need to perform same computing and we need to make sure two variables have same bits.

### EX
- **ALU** (Arithmetic logic unit): ALU is used when we need to perform some computation. The ALU I desgined supports four kinds of operations : add, or, and, sub. Perform which kinds of operation is decided by aluctrl (from ALUControl unit).
- **ALUControl** : This component can output signal to decide the operation of ALU. It use aluop1, aluop2, aluop3 , func7&func3 of instruction to decide the type of operation. Below is a table to show the corresponging control signal for each inputs.

| ALUop 	| func7   	| func3 	| Op(alucontrol signal) 	|
|-------	|---------	|-------	|-----------------------	|
| 000   	| xxxxxx  	| xxx   	| 0010(add)             	|
| x10   	| xxxxxxx 	| xxx   	| 0110(subtract)        	|
| 001   	| xxxxxxx 	| 110   	| 0001(and)             	|
| 001   	| xxxxxxx 	| 111   	| 0000(or)              	|
| 001   	| xxxxxxx 	| 000   	| 0010(add)             	|
| xxx   	| 0000000 	| 000   	| 0010(add)             	|
| xxx   	| 0100000 	| 000   	| 0110(subtract)        	|
| xxx   	| 0000000 	| 111   	| 0000(and)             	|
| xxx   	| 0000000 	| 110   	| 0001(or)              	|
- **Forwarding** : This unit is used for preventing data hazard. When it detect. When instrcution in ID stage needs data changed by the previous instruction but the data still not written to register, the forwarding unit needs to control muxs before **comparator** and **ALU** to make sure that they can receive right signal.
### DM 
- DM(data memory) : This component is used to manage the read and write of memory. In some cases we do not want to save data to registers, we need save data to memory and read them as needed. Addr us the address of the data we want to read or write, WriteData is the data we want to write to memory and ReadData is the momory readed from DM. 
### WB
- In WB stage, the behaviors only involoves the mux and registers. According to our control signal. The mux can decide the data we want to write back is from the result of ALU or the DataMemory. If control signal regwrite is high, we need write the data to our registers.

## Verificatoin Setting
- board.tss : this is target system specification file, it includes same hardward configuratoin of HAPS, ex:
  1. Which FPGA we used in this project
  2. Connectoin fo daughter cards
  3. Board voltage cnofiguration
  4. clock connection
  5. interconnection between FPGA
- partition.pcf : it is the partition cnostraint file, it includes:
  1. TDM control setting
  2. bin_utilizatoin constraint
  3. floorplan by assign_cell(which instance in which FPGA)
  4. clk and reset setting
  5. port assignment
 - design.fdc : this file includes seeting of time constraints
 ## Demo Example
 - In TEST/test_pattern.txt are somae instructions to demo
 In the example, I demoe how my CPU deal with data hazard and control hazard, I transform the instructions into bits and save in TEST/ControlHazardPattern.txt and TEST/DataHazardPattern.txt. I save the demo result in TEST/ControlHazardPattern.txt and TEST/DataHazardPattern.txt. There are many output, so I just show the values of regsiter and data memory after execution these isntruction.
```assembly
#For Data Hazard
addi x3, x3, 10    ;x3=10
sd x3, 20(x1)      ;memory[20]=10
ld x2, 20(x1)      ;x2=10
and x4, x2, x5     ;x4=0
or x8, x2, x6      ;x8=10
add x9, x4, x2     ;x9=10
sub x1, x6, x7     ;x1=0
000000001010_00011_000_00011_0010011
0000000_00011_00001_011_10100_0100011
000000010100_00001_011_00010_0000011
0000000_00101_00010_111_00100_0110011
0000000_00110_00010_110_01000_0110011
0000000_00010_00100_000_01001_0110011
0100000_00111_00110_000_00001_0110011

#For Control Hazard
addi x4, x4, 10    ;x4=10
sd x4, 20(x2)      ;memory[20]=10
ld x3, 20(x2)      ;x3=10
ld x9, 20(x2)      ;x9=10
beq x9, x3, 8      ;jump 16
addi x9, x9, 20    ;no
addi x3, x3, 15    ;no
addi x8, x8, 15    ;no
ld x1, 20(x2)      ;x1=10
add x5, x3, x8     ;x5=10
beq x5, x1, 4      ;jump 8
sub x5, x5 x1      ;no
beq x5 ,x10 4      ;jump
addi x11, x11, 15  ;x11=15
addi x15, x15, 15  ;x15=15

000000001010_00100_000_00100_0010011
0000000_00100_00010_011_10100_0100011
000000010100_00010_011_00011_0000011
000000010100_00010_011_01001_0000011
0000000_00001_00101_000_10000_1100011
000000010100_01001_000_01001_0010011
000000001111_00011_000_00011_0010011
000000010100_00001_011_00010_0000011
000000010100_00010_011_00001_0000011
0000000_00011_01000_000_00101_0110011
0000000_00001_00101_000_01000_1100011
0100000_00001_00101_000_00101_0110011
0000000_01010_00101_000_01000_1100011
000000001111_01011_000_01011_0010011
000000001111_01111_000_01111_0010011
```
```assembly
#result Data Hazard:
Program Counter :
Program Counter                   0 : Instruction 00000000000000000000000000000000
Program Counter                   4 : Instruction 00000000101000011000000110010011
Program Counter                   8 : Instruction 00000000001100001011101000100011
Program Counter                  12 : Instruction 00000001010000001011000100000011
Program Counter                  16 : Instruction 00000000010100010111001000110011
Program Counter                  16 : Instruction 00000000010100010111001000110011
Program Counter                  20 : Instruction 00000000011000010110010000110011
Program Counter                  24 : Instruction 00000000001000100000010010110011
Program Counter                  28 : Instruction 01000000011100110000000010110011
Program Counter                  32 : Instruction 01000000011100110000000010110011
Program Counter                  36 : Instruction 01000000011100110000000010110011
Program Counter                  40 : Instruction 01000000011100110000000010110011

Register :
Register Address          0 : Value                    0
Register Address          1 : Value                    0
Register Address          2 : Value                   10
Register Address          3 : Value                   10
Register Address          4 : Value                    0
Register Address          5 : Value                    0
Register Address          6 : Value                    0
Register Address          7 : Value                    0
Register Address          8 : Value                   10
Register Address          9 : Value                   10
Register Address         10 : Value                    0
Register Address         11 : Value                    0
Register Address         12 : Value                    0
Register Address         13 : Value                    0
Register Address         14 : Value                    0
Register Address         15 : Value                    0
Register Address         16 : Value                    0
Register Address         17 : Value                    0
Register Address         18 : Value                    0
Register Address         19 : Value                    0
Register Address         20 : Value                    0
Register Address         21 : Value                    0
Register Address         22 : Value                    0
Register Address         23 : Value                    0
Register Address         24 : Value                    0
Register Address         25 : Value                    0
Register Address         26 : Value                    0
Register Address         27 : Value                    0
Register Address         28 : Value                    0
Register Address         29 : Value                    0
Register Address         30 : Value                    0
Register Address         31 : Value                    0

Data Memory :
Memory Address          0 : Value                    0
Memory Address          1 : Value                    0
Memory Address          2 : Value                    0
Memory Address          3 : Value                    0
Memory Address          4 : Value                    0
Memory Address          5 : Value                    0
Memory Address          6 : Value                    0
Memory Address          7 : Value                    0
Memory Address          8 : Value                    0
Memory Address          9 : Value                    0
Memory Address         10 : Value                    0
Memory Address         11 : Value                    0
Memory Address         12 : Value                    0
Memory Address         13 : Value                    0
Memory Address         14 : Value                    0
Memory Address         15 : Value                    0
Memory Address         16 : Value                    0
Memory Address         17 : Value                    0
Memory Address         18 : Value                    0
Memory Address         19 : Value                    0
Memory Address         20 : Value                   10
Memory Address         21 : Value                    0
Memory Address         22 : Value                    0
Memory Address         23 : Value                    0
Memory Address         24 : Value                    0
Memory Address         25 : Value                    0
Memory Address         26 : Value                    0
Memory Address         27 : Value                    0
Memory Address         28 : Value                    0
Memory Address         29 : Value                    0
Memory Address         30 : Value                    0
Memory Address         31 : Value                    0

# result Control Hazard
Program Counter :
Program Counter                   0 : Instruction 00000000000000000000000000000000
Program Counter                   4 : Instruction 00000000101000100000001000010011
Program Counter                   8 : Instruction 00000000010000010011101000100011
Program Counter                  12 : Instruction 00000001010000010011000110000011
Program Counter                  16 : Instruction 00000001010000010011010010000011
Program Counter                  20 : Instruction 00000000000100101000100001100011
Program Counter                  32 : Instruction 00000000000000000000000000000000
Program Counter                  36 : Instruction 00000001010000010011000010000011
Program Counter                  40 : Instruction 00000000001101000000001010110011
Program Counter                  44 : Instruction 00000000000100101000010001100011
Program Counter                  44 : Instruction 00000000000100101000010001100011
Program Counter                  48 : Instruction 00000000000000000000000000000000
Program Counter                  52 : Instruction 00000000101000101000010001100011
Program Counter                  56 : Instruction 00000000111101011000010110010011
Program Counter                  60 : Instruction 00000000111101111000011110010011
Program Counter                  64 : Instruction 00000000000000000000000000000000
Program Counter                  68 : Instruction 00000000000000000000000000000000
Program Counter                  72 : Instruction 00000000000000000000000000000000
Program Counter                  76 : Instruction 00000000000000000000000000000000
Program Counter                  80 : Instruction 00000000000000000000000000000000

Register :
Register Address          0 : Value                    0
Register Address          1 : Value                   10
Register Address          2 : Value                    0
Register Address          3 : Value                   10
Register Address          4 : Value                   10
Register Address          5 : Value                   10
Register Address          6 : Value                    0
Register Address          7 : Value                    0
Register Address          8 : Value                    0
Register Address          9 : Value                   10
Register Address         10 : Value                    0
Register Address         11 : Value                   15
Register Address         12 : Value                    0
Register Address         13 : Value                    0
Register Address         14 : Value                    0
Register Address         15 : Value                   15
Register Address         16 : Value                    0
Register Address         17 : Value                    0
Register Address         18 : Value                    0
Register Address         19 : Value                    0
Register Address         20 : Value                    0
Register Address         21 : Value                    0
Register Address         22 : Value                    0
Register Address         23 : Value                    0
Register Address         24 : Value                    0
Register Address         25 : Value                    0
Register Address         26 : Value                    0
Register Address         27 : Value                    0
Register Address         28 : Value                    0
Register Address         29 : Value                    0
Register Address         30 : Value                    0
Register Address         31 : Value                    0

Data Memory :
Memory Address          0 : Value                    0
Memory Address          1 : Value                    0
Memory Address          2 : Value                    0
Memory Address          3 : Value                    0
Memory Address          4 : Value                    0
Memory Address          5 : Value                    0
Memory Address          6 : Value                    0
Memory Address          7 : Value                    0
Memory Address          8 : Value                    0
Memory Address          9 : Value                    0
Memory Address         10 : Value                    0
Memory Address         11 : Value                    0
Memory Address         12 : Value                    0
Memory Address         13 : Value                    0
Memory Address         14 : Value                    0
Memory Address         15 : Value                    0
Memory Address         16 : Value                    0
Memory Address         17 : Value                    0
Memory Address         18 : Value                    0
Memory Address         19 : Value                    0
Memory Address         20 : Value                   10
Memory Address         21 : Value                    0
Memory Address         22 : Value                    0
Memory Address         23 : Value                    0
Memory Address         24 : Value                    0
Memory Address         25 : Value                    0
Memory Address         26 : Value                    0
Memory Address         27 : Value                    0
Memory Address         28 : Value                    0
Memory Address         29 : Value                    0
Memory Address         30 : Value                    0
Memory Address         31 : Value                    0
```
## How to run verificatoin
- To run with protocompiler100, just use`protocompiler100 -shell run.tcl` or run below commands line by line in protocompiler100.
```sh
exec chmod +x vcs_dut.csh
database load RISC_V_CPU -autocreate -technology HAPS-100
report rtl_diagnostics -srclist vlog_inputs.txt -top_module top 

source option.tcl

launch uc -utf uc_compile.utf -ucdb top_ucdb -v 2.0

run compile -ucdb top_ucdb -out c0
#run compile -ucdb top_ucdb -idc debug.idc -out c0

run pre_partition -tss board.tss -fdc design.fdc -area_est 1 -out pp0
export file top.est -path pp0_area

run partition -pcf partition.pcf -out pa0

run system_route -pcf partition.pcf -fdc design.fdc -optimization_priority multi_hop_path -estimate_timing 1 -out sr0

run system_generate -fdc design.fdc -path synthesis_files -out sg0

launch protocompiler -script ./synthesis_files/FB1_uA/FB1_uA_srs.tcl -script ./synthesis_files/FB1_uB/FB1_uB_srs.tcl -script ./synthesis_files/FB1_uC/FB1_uC_srs.tcl -script ./synthesis_files/FB1_uD/FB1_uD_srs.tcl

launch vivado -script ./synthesis_files/FB1_uA/vivado_srs/run_vivado_haps.tcl -script ./synthesis_files/FB1_uB/vivado_srs/run_vivado_haps.tcl ./synthesis_files/FB1_uC/vivado_srs/run_vivado_haps.tcl -script ./synthesis_files/FB1_uD/vivado_srs/run_vivado_haps.tcl

export runtime -path RISC_V_pipeline_CPU_runtime

```
