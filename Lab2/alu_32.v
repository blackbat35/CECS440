
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2020 09:49:07 AM
// Design Name: 
// Module Name: alu_32
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

`timescale 1ns / 1ps
module alu_32(A_in ,B_in ,ALU_Sel ,ALU_Out ,Carry_Out ,Zero ,Overflow);
    
    input [31:0] A_in, B_in;
    input [31:0] ALU_Sel; 
    
    output [31:0] ALU_Out;
    output  Carry_Out, Zero, Overflow;
    
    reg [32:0] ALU_Result; 
    wire [32:0] signed_A_in;
    wire [32:0] signed_B_in;
    assign signed_A_in = {1'b0, A_in};
    assign signed_B_in = {1'b0, B_in};
    always @(*)
      begin 
        case(ALU_Sel)
            4'b0000: ALU_Result = A_in & B_in;                                // And
            4'b0001: ALU_Result = A_in | B_in;                                // Or
            4'b0010: ALU_Result = signed_A_in + signed_B_in;                  // Add  
            4'b0110: ALU_Result = signed_A_in - signed_B_in;                  // Sub
            4'b0111: ALU_Result = (signed_A_in < signed_B_in) ? 1'b1:1'b0;    // Set less than
            4'b1100: ALU_Result = ~( A_in | B_in);                            // Nor
            4'b1111: ALU_Result = (A_in == B_in) ? 1'b1:1'b0;                 // Equal Comparison
            default: ALU_Result = A_in & B_in;
         endcase
       end
    assign Carry_Out = ((ALU_Result[32] == 1'b1) && (ALU_Sel == 4'b0010)) ? 1'b1:1'b0;  
    // Overflow = (NOT(sign1 XOR sign2)) AND (sign of sum XOR sign1)
    assign Overflow  = (~(A_in[31]^B_in[31])&(ALU_Result[31]^A_in[31]));        
    assign ALU_Out   = ALU_Result[31:0]; 
    assign Zero      = ((ALU_Out == 32'b0)) ? 1'b1:1'b0;
endmodule
