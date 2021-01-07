module processor(clk, reset, Result);

    input clk, reset; 
    
    output [31:0] Result;
    
    wire  ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite;
    wire [6:0] Opcode, Funct7;
    wire [1:0] ALUOp;
    wire [2:0] Funct3;
    wire [3:0] Operation;
    
                    // Opcode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, ALUOp
    Controller      C1(Opcode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, ALUOp);
    
                    // ALUOp, Funct7, Funct3, Operation
    ALUController   C2(ALUOp, Funct7, Funct3, Operation);
    
                    // clk, reset, reg_write, mem2reg, alu_src, mem_write, 
    data_path       C3(clk, reset, RegWrite,  MemtoReg, ALUSrc, MemWrite, 
    
                    // mem_read, alu_cc,    opcode, funct7, funct3, alu_result
                       MemRead,  Operation, Opcode, Funct7, Funct3, Result);
endmodule
