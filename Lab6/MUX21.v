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
