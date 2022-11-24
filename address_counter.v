`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2022 07:46:36 PM
// Design Name: 
// Module Name: address_counter
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


module address_counter(clk, reset, addr_add, addr);
    input clk;
    input reset;
    input addr_add;
    
    output reg [15:0] addr;
    
    
    
    always @ (posedge clk) begin
        if (reset)
            addr <= 16'b0000_0000_0000_0000;
        else if (addr_add)
            addr <= addr + 16'b0000_0000_0000_0001;
        else 
            addr <= addr;
        end
endmodule
