`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2020 01:06:50 PM
// Design Name: 
// Module Name: MUX21
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


module MUX21(D1, D2, S, Y);
    
    input         S;
    input  [31:0] D1, D2;
    
    output reg [31:0] Y;
   
    always @(D1, D2, S) 
    begin 
        if(S == 0)
            Y = D1; 
        else 
            Y = D2; 
    end
    
endmodule
