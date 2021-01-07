module alu_32_tb();

    reg [31:0] A_in, B_in;
    reg [31:0] ALU_Sel;
  
    wire [31:0] ALU_Out; 
    wire Carry_Out, Zero, Overflow;
    
    alu_32 V(.A_in(A_in),.B_in(B_in),.ALU_Sel(ALU_Sel),.ALU_Out(ALU_Out),.Carry_Out(Carry_Out),.Zero(Zero),.Overflow(Overflow));
    initial begin 

    #20 A_in = 32'h086a0c31; B_in = 32'hd785f148; ALU_Sel = 4'b0000;   // 1
    #20 A_in = 32'h086a0c31; B_in = 32'h10073fd4; ALU_Sel = 4'b0001;   // 2
    #20 A_in = 32'h086a0c31; B_in = 32'h90073fd4; ALU_Sel = 4'b0010;   // 3
    #20 A_in = 32'h086a0c31; B_in = 32'h90073fd4; ALU_Sel = 4'b0110;   // 4
    #20 A_in = 32'h086a0c31; B_in = 32'h90073fd4; ALU_Sel = 4'b0111;   // 5
    #20 A_in = 32'h086a0c31; B_in = 32'h90073fd4; ALU_Sel = 4'b1100;   // 6
    #20 A_in = 32'h086a0c31; B_in = 32'h086a0c31; ALU_Sel = 4'b1111;   // 7
    #20 A_in = 32'h086a0c31; B_in = 32'h10073fd4; ALU_Sel = 4'b1111;   // 8
    //#20 A_in = 4'b1001; B_in = 4'b1010; ALU_Sel = 4'b0010;
    $finish;
    end     
endmodule
