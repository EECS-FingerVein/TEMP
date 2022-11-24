`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2022 04:03:12 PM
// Design Name: 
// Module Name: Top
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


module Con_Module_1R(clk,reset,start,fin,out,sum);
    input clk;
    input reset;
    input start;
    input fin;
    
    output [8:0] out;
    output [8:0] sum;
    
    wire [8:0] data;
    wire pushpixel;
    wire multi_act;
    wire writepixel;
    wire [10:0] addr;
    wire [8:0] firstO;
    wire [8:0] secondO;
    
    wire [8:0] w1;
    wire [8:0] w2;
    wire [8:0] w3;
    wire [8:0] w4;
    wire [8:0] w5;
    wire [8:0] w6;
    wire [8:0] w7;
    wire [8:0] w8;
    wire [8:0] w9;
    
    Module_FSM A (
        .clk(clk),
        .start(start),
        .filled(fin),
        .multi_act(multi_act),
        .pushpixel(pushpixel),
        .writepixel(writepixel)
        );
        
    addr_counter B (
        .clk(clk),
        .reset(reset),
        .pushpixel(pushpixel),
        .addr(addr)
        );
        
    regfile C (
        .clk(clk),
        .reset(reset),
        .addr(addr),
        .data(data)
        );
        
    pixelBuf D (
        .reset(reset),
        .pushpixel(pushpixel),
        .din(data),
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .dout(firstO)
        );
        
    pixelBuf E (
        .reset(reset),
        .pushpixel(pushpixel),
        .din(firstO),
        .w1(w4),
        .w2(w5),
        .w3(w6),
        .dout(secondO)
        );
        
    pixelBuf F (
        .reset(reset),
        .pushpixel(pushpixel),
        .din(secondO),
        .w1(w7),
        .w2(w8),
        .w3(w9),
        .dout(out)
        );
        
    calculate G (
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .w4(w4),
        .w5(w5),
        .w6(w6),
        .w7(w7),
        .w8(w8),
        .w9(w9),
        .k1(0),
        .k2(0),
        .k3(0),
        .k4(0),
        .k5(2),
        .k6(0),
        .k7(0),
        .k8(0),
        .k9(0),
        .sum(sum)
        );

endmodule
