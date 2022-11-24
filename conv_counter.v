`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2022 10:50:20 PM
// Design Name: 
// Module Name: conv_counter
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


module conv_counter(clk,done,pass,start,
                    a1,a2,a3,a4,a5);

    input clk;
    input done;
    input start;
    
    output reg pass;
    output [15:0] a1;
    output [15:0] a2;
    output [15:0] a3;
    output [15:0] a4;
    output [15:0] a5;
    
    reg [13:0] address;
    reg [2:0] count;
    
    assign a1 = address;
    assign a2 = address+11520;
    assign a3 = address+23040;
    assign a4 = address+34560;
    assign a5 = address+46080;
    
    initial begin 
        address <= 14'b00_0000_0000_0000;
        end

    
    always @ (start) begin
        if (done) 
            address <= address + 14'b00_0000_0000_0001;
        else
            address <= address;
        end
    /*
    always @ (posedge clk) begin
        if (reset)
            address <= 14'b00_0000_0000_0000;
        else if (address > 11519)
            address <= 14'b00_0000_0000_0000;
        else if (start)
            address <= address + 14'b00_0000_0000_0001;
        else 
            address <= address;
        end*/
    
endmodule
