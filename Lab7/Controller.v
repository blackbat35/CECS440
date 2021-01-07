`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2020 09:21:18 AM
// Design Name: 
// Module Name: Controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Controller(Opcode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, ALUOp);

    input [6:0] Opcode;
    
    output reg [1:0] ALUOp;
    output reg       ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite;
    
    always @(*)
    begin 
        case(Opcode) 
        7'b0110011: // ADD, SUB, SLT, NOR, OR, AND 
            begin 
             MemtoReg = 1'b0;
             MemWrite = 1'b0;
             MemRead  = 1'b0;
             ALUSrc   = 1'b0;
             RegWrite = 1'b1;
             ALUOp    = 2'b10;
            end
        7'b0010011: // ANDI, ORI, ADDI, SLTI, NORI 
            begin
             MemtoReg = 1'b0;
             MemWrite = 1'b0;
             MemRead  = 1'b0;
             ALUSrc   = 1'b1;
             RegWrite = 1'b1;
             ALUOp    = 2'b00;
            end 
        7'b0000011: // LW
            begin 
             MemtoReg = 1'b1;
             MemWrite = 1'b0;
             MemRead  = 1'b1;
             ALUSrc   = 1'b1;
             RegWrite = 1'b1;
             ALUOp    = 2'b01;
            end
        7'b0100011: // SW
            begin 
             MemtoReg = 1'b0;
             MemWrite = 1'b1;
             MemRead  = 1'b0;
             ALUSrc   = 1'b1;
             RegWrite = 1'b0;
             ALUOp    = 2'b01;
            end
        endcase    
     end 
endmodule
