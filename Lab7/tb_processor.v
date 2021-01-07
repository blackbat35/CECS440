`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2020 10:04:30 AM
// Design Name: 
// Module Name: tb_processor
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


module tb_processor();

    reg clk, rst; 
    wire [31:0] tb_Result; 
    
    processor processor_inst(
            .clk    (clk),
            .reset  (rst),
            .Result (tb_Result));
            
    always begin 
        #10; 
        clk = ~clk; 
    end 
    
    initial begin 
        clk = 0; 
        @(posedge clk); rst = 1; 
        @(posedge clk); rst = 0;
    end 
    
    integer point = 0;
    integer count = 0;
    
    always @(*)
    begin 
        #20; //0
        count = count + 1;
        if(tb_Result == 32'h00000000) // and 
            point = point + 1;
        
        #20; //1
        count = count + 1;
        if(tb_Result == 32'h00000001) // addi 
            point = point + 1;
            
        #20; //2
        count = count + 1;
        if(tb_Result == 32'h00000002) // addi 
            point = point + 1;
            
        #20; //3
        count = count + 1;
        if(tb_Result == 32'h00000004) // and 
            point = point + 1;
    
        #20; //4
        count = count + 1;
        if(tb_Result == 32'h00000005) // addi 
            point = point + 1;
            
        #20; //5
        count = count + 1;
        if(tb_Result == 32'h00000007) // addi 
            point = point + 1;
            
        #20; //6
        count = count + 1;
        if(tb_Result == 32'h00000008) // addi 
            point = point + 1;
            
        #20; //7
        count = count + 1;
        if(tb_Result == 32'h0000000b) // addi 
            point = point + 1;
           
        #20; //8
        count = count + 1;
        if(tb_Result == 32'h00000003) // add 
            point = point + 1;
            
        #20; //9
        count = count + 1;
        if(tb_Result == 32'hfffffffe) // sub 
            point = point + 1;
            
        #20; //10
        count = count + 1;
        if(tb_Result == 32'h00000000) // add 
            point = point + 1;
            
        #20; //11
        count = count + 1;
        if(tb_Result == 32'h00000005) // or 
            point = point + 1;
            
        #20; //12
        count = count + 1;
        if(tb_Result == 32'h00000001) // slt 
            point = point + 1;
          
        #20; //13
        count = count + 1;
        if(tb_Result == 32'hfffffff4) // nor 
            point = point + 1;
            
        #20; //14
        count = count + 1;
        if(tb_Result == 32'h000004d2) // addi 
            point = point + 1;
            
        #20; //15
        count = count + 1; 
        if(tb_Result == 32'hfffff8d7) // ori 
            point = point + 1;
            
        #20; //16
        count = count + 1;
        if(tb_Result == 32'h00000001) // slt 
            point = point + 1;
            
        #20; //17
        count = count + 1; 
        if(tb_Result == 32'hfffffb2c) // nori 
            point = point + 1;
            
        #20; //18
        count = count + 1;
        if(tb_Result == 32'h00000030) // sw 
            point = point + 1;
            
        #20; //19
        count = count + 1; 
        if(tb_Result == 32'h00000030) // lw 
            point = point + 1;    
          
        $display("%s%d","The number of correct test case is:" , point);
    end 
    
    initial begin 
    #430;
    $finish;
    end 
endmodule
