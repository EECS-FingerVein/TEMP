`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2022 08:49:43 PM
// Design Name: 
// Module Name: addr_counter
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


module addr_counter(clk,reset,pushpixel,addr);
    
    input clk;
    input reset;
    input pushpixel;
    
    output reg [10:0] addr;
    
    always @ (posedge clk) begin
        if (reset)
            addr <= 11'b000_0000_0000;
        else if (pushpixel)
            addr <= addr + 11'b000_0000_0001;
        else 
            addr <= addr;
        end
    
    
endmodule
