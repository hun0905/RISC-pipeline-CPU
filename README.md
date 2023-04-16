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

## Verificatoin setting and how to use
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
