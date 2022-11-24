`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2022 04:01:47 PM
// Design Name: 
// Module Name: regA
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


module regA(clk,datain,addr,finA,
            a1,a2,a3,a4,a5,
            M1d1,M1d2,M1d3,d2,d3,d4,d5);
    input clk;
    input [8:0] datain;
    input [15:0] addr;
    input [15:0] a1;
    input [15:0] a2;
    input [15:0] a3;
    input [15:0] a4;
    input [15:0] a5;
    
    output finA;
    output [8:0] M1d1;
    output [8:0] M1d2;
    output [8:0] M1d3;
    output [8:0] d2;
    output [8:0] d3;
    output [8:0] d4;
    output [8:0] d5;
    
    reg [31:0] regfile [0:57599];
    
    assign finA = addr<57600?0:1;
    
    assign M1d1 = regfile[a1];
    assign M1d2 = regfile[a1+180];
    assign M1d3 = regfile[a1+360];
    
    assign d2 = regfile[a2];
    assign d3 = regfile[a3];
    assign d4 = regfile[a4];
    assign d5 = regfile[a5];
    
    always @ (posedge clk) begin
        regfile[addr] <= datain;
        end
    
endmodule
