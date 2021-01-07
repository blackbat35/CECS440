`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2020 12:18:48 PM
// Design Name: 
// Module Name: DataMem
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

module DataMem(MemRead, MemWrite, addr, write_data, read_data);
    
    input        MemRead, MemWrite;
    input [31:0] write_data;
    input [8:0]  addr;
    
    output reg [31:0] read_data;
    reg [31:0] memory[0:127];
       
    integer i;
    
    initial begin 
        read_data <= 32'b0;
        for (i=0; i<128; i=i+1) begin 
            memory[i] = i;
        end
    end 
    
    always @(addr) begin 
       if (MemWrite) 
            memory[addr] <= write_data;

       if (MemRead)  
            read_data <= memory[addr];      
    end


endmodule
