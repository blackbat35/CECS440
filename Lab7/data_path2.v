`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2020 01:29:46 PM
// Design Name: 
// Module Name: data_path2
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

module data_path#(  parameter PC_W  = 8,
                    parameter INS_W = 32,
                    parameter RF_ADDRESS = 5, 
                    parameter DATA_W = 32,
                    parameter DM_ADDRESS = 9,
                    parameter ALU_CC_W = 4
                    )(
    input clk,
    input reset,
    input reg_write,
    input mem2reg,
    input alu_src,
    input mem_write,
    input mem_read,
    input [ALU_CC_W-1:0] alu_cc,
    output         [6:0] opcode,
    output         [6:0] funct7,
    output         [2:0] funct3,
    output  [DATA_W-1:0] alu_result
    );

    wire        Carry_Out ,Zero ,Overflow;
    wire [7:0]  PC_Next, PC;
    wire [31:0] instruction, wrt_data, Reg1, Reg2, ImmOut, Y, ALU_Out, read_data;
    
    assign PC_Next    = PC + 4;
    assign opcode     = instruction[6:0];
    assign funct3     = instruction[14:12];
    assign funct7     = instruction[31:25];
    assign alu_result = ALU_Out;
    
             // clk  reset  d        q
    FlipFlop D1(clk, reset, PC_Next, PC);
     
             // addr instruction
    InstMem  D2(PC,  instruction); 
    
             // clk  reset  rg_wrt_en, rg_wrt_addr  
    RegFile  D3(clk, reset, reg_write, instruction[11:7],
             // rg_rd_addr1,        rg_rd_addr2,        rg_wrt_data
                instruction[19:15], instruction[24:20], wrt_data,
             // rg_rd_data1, rg_rd_data2  
                Reg1,        Reg2);
                
             // InstCode,    ImmOut 
    ImmGen   D4(instruction, ImmOut);
    
    //assign Y = (alu_src == 1'b0)? Reg2:ImmOut;
             // D1,   D2,     S,       Y
    MUX21    D5(Reg2, ImmOut, alu_src, Y);
    
             // A_in, B_in, ALU_Sel ,ALU_Out ,Carry_Out ,Zero ,Overflow   
    alu_32   D6(Reg1, Y,    alu_cc  ,ALU_Out ,Carry_Out ,Zero ,Overflow);
    
             // MemRead,  MemWrite,  addr,         write_data, read_data
    DataMem  D7(mem_read, mem_write, ALU_Out[8:0], Reg2,       read_data);
   
    //assign wrt_data = (mem2reg == 1'b0)? ALU_Out:read_data;
              // D1,       D2,      S,       Y
    MUX21    D8(ALU_Out, read_data, mem2reg, wrt_data);      
endmodule
