`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2022 09:10:08 PM
// Design Name: 
// Module Name: TOP
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


module TOP(clk,reset,trigger,din);
    input clk;
    input reset;
    input trigger; // external signal, trigger the whole system.
    input [8:0] din;
    
    wire finA;
    wire finB;
    wire addr_add;
    wire start;
    
    wire cal_done;
    
    wire [15:0] addr;
    wire [15:0] a1;
    wire [15:0] a2;
    wire [15:0] a3;
    wire [15:0] a4;
    wire [15:0] a5;
    wire [8:0] M1D1;
    wire [8:0] M1D2;
    wire [8:0] M1D3;
    wire [8:0] M2D1;
    wire [8:0] M2D2;
    wire [8:0] M2D3;
    wire [8:0] M3D1;
    wire [8:0] M3D2;
    wire [8:0] M3D3;
    wire [8:0] sum;
    wire [8:0] d2;
    wire [8:0] d3;
    wire [8:0] d4;
    wire [8:0] d5;
    

    TOP_FSM A (
        .clk(clk),
        .trigger(trigger),
        .finA(finA),
        .finB(finB),
        .addr_add(addr_add),
        .start(start),
        .push() //?
        );
        
    address_counter B (
        .clk(clk),
        .reset(reset),
        .addr_add(addr_add),
        .addr(addr)
        );
        
    regA C (
        .clk(clk),
        .datain(din),
        .addr(addr),
        .finA(finA),
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .a4(a4),
        .a5(a5),
        .M1d1(M1D1),
        .M1d2(M1D2),
        .M1d3(M1D3),
        .d2(d2),
        .d3(d3),
        .d4(d4),
        .d5(d5)
        );
        
    conv_counter D (
        .clk(clk),
        .done(cal_done),
        .start(start),
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .a4(a4),
        .a5(a5)
        );

endmodule
