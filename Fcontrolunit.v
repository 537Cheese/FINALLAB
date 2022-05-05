module controlunit (I,Z,IMMs,regW,ALUsrc,ALUop,sub,PCsrc,memRW,MemtoReg);
    input [31:0] I;
    input Z;
    output reg regW,ALUsrc,PCsrc,memRW,MemtoReg,sub;
    output reg [2:0] ALUop;
    output reg [1:0] IMMs;

    wire [6:0] opcode, func7;
    wire [2:0] func3;

    assign opcode = I[6:0];
    assign func3 = I[14:12];
    assign func7 = I[31:25];

    always @(I,Z) begin
    if (opcode == 7'b0110011) begin //R type
        IMMs = 2'b00;
        regW = 1'b1;
        ALUsrc = 1'b0;
        ALUop = func3;
        memRW = 1'b0;
        MemtoReg = 1'b1;
        PCsrc = 1'b0;
        sub = 0;
        if (func7 != 7'b0)
            sub = 1;
    end

    else if (opcode == 7'b0010011) begin //I type immediate
        IMMs = 2'b00;
        regW = 1'b1;
        ALUsrc = 1'b1;
        ALUop = func3;
        memRW = 1'b0;
        MemtoReg = 1'b1;
        PCsrc = 1'b0;
        sub = 0;
    end

    else if (opcode == 7'b0000011) begin //I type load
        IMMs = 2'b00;
        regW = 1'b1;
        ALUsrc = 1'b1;
        ALUop = 3'b000;
        memRW = 1'b0;
        MemtoReg = 1'b0;
        PCsrc = 1'b0;
        sub = 0;
    end

    else if (opcode == 7'b0100011) begin //S type 
        IMMs = 2'b01;
        regW = 1'b0;
        ALUsrc = 1'b1;
        ALUop = 3'b000;
        memRW = 1'b1;
        MemtoReg = 1'b0;
        PCsrc = 1'b0;
        sub = 0;
    end

    else if (opcode == 7'b1100011) begin //B type
        IMMs = 2'b10;
        regW = 1'b0;
        ALUsrc = 1'b0;
        ALUop = 3'b000;
        memRW = 1'b0;
        MemtoReg = 1'b1;
        sub = 1;
        PCsrc <= Z;
    end

    else
        PCsrc = 1'b0;

    end

endmodule
