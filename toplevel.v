module toplevel (clk1,clk2,clk3,reset,readData1,x2,x3,x4,x5,count,C,I);
    input clk1,clk2,clk3,reset;
    output [31:0] readData1,x2,x3,x4,x5,C,I;
    output [7:0] count;

    wire RW,ALUsrc,sub,MRW,MTR,Cout,N,M,PCsrc,Z;
    wire [2:0] ALUop;
    wire [1:0] IMMs;

    controlunit inst1 (I,Z,IMMs,RW,ALUsrc,ALUop,sub,PCsrc,MRW,MTR);
    Fdatapath inst0 (clock, reset_, memtoreg, regwrite, aluControl, instr, readDataDMem, zero, pc, aluOut, readData2, selBranch, alusrcA, alusrcB, jump, LSb_aluresult);
	 endmodule
	 