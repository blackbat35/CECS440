module RegFile(clk, reset, rg_wrt_en, rg_wrt_addr,
               rg_rd_addr1, rg_rd_addr2, rg_wrt_data,
               rg_rd_data1, rg_rd_data2);
               
    input clk, reset, rg_wrt_en;
    input [4:0]  rg_rd_addr1, rg_rd_addr2, rg_wrt_addr; 
    input [31:0] rg_wrt_data;
    
    output [31:0] rg_rd_data1, rg_rd_data2;
    
    reg [31:0] rg_array [31:0];
    integer i;

    always @(posedge clk) begin 
        if (reset) begin 
            for (i=0; i<32; i=i+1)
                rg_array[i] <= 32'b0;
        end
        if (rg_wrt_en) begin 
            rg_array[rg_wrt_addr] <= rg_wrt_data;
        end 
    end 
    
    assign rg_rd_data1 = rg_array[rg_rd_addr1];
    assign rg_rd_data2 = rg_array[rg_rd_addr2];
        
endmodule
