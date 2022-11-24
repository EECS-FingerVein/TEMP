`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 10:17:38 PM
// Design Name: 
// Module Name: PixelBuffer
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


module PixelBuffer(clk,din,D1,D2,D3,sum,done);
    input clk;
    input [8:0] din;
    input [8:0] D1; //7:0
    input [8:0] D2;
    input [8:0] D3;
    
    output [8:0] sum;
    output reg done;
    
    reg [7:0] count;
    reg [2:0] delay;
    
    reg [8:0] buffer1 [0:2];
    reg [8:0] buffer2 [0:2];
    reg [8:0] buffer3 [0:2];
    
    parameter K1=1, // sobel Gx
                K2=0, 
                K3=-1, 
                K4=2, 
                K5=0, 
                K6=-2, 
                K7=1, 
                K8=0,
                K9=-1;
    
    initial begin 
        count <= 0;
        buffer1[0] <= 8'b0000_0000;
        buffer1[1] <= 8'b0000_0000;
        buffer1[2] <= 8'b0000_0000;
        end
        
    always @ (posedge clk) begin
        if (delay > 3) begin
            delay <= 3'b000;
            
            // done(output to FSM)
            end
        else 
            delay <= delay+1;
        end
    
    always @ (posedge clk)begin
        count <= count+1;// to 180
        buffer1[2] <= din;
        buffer1[1] <= buffer1[2];
        buffer1[0] <= buffer1[1];
        end
    
    //assign sum = ((M1D1-M1D3)+(M3D1-M3D3))+((M2D1-M2D3)+(M2D1-M2D3));
    
    endmodule
