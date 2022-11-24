`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2022 10:12:19 PM
// Design Name: 
// Module Name: regfile
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


module regfile(clk,reset,addr,data);
    
    input clk;
    input reset;
    input [10:0] addr;
    
    output [8:0] data;
    
    reg [31:0] regfile [0:539];
    
    assign #1 data = addr< 540 ?regfile[addr]:0;
    
    initial begin
        $readmemh("input.dat", regfile);
        end
    
endmodule
