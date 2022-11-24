`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2022 11:30:37 PM
// Design Name: 
// Module Name: calculate
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


module calculate(multi_act,w1,w2,w3,w4,w5,w6,w7,w8,w9,
                    k1,k2,k3,k4,k5,k6,k7,k8,k9,sum);
    input multi_act;
    input [7:0] w1;
    input [7:0] w2;
    input [7:0] w3;
    
    input [7:0] w4;
    input [7:0] w5;
    input [7:0] w6;
    
    input [7:0] w7;
    input [7:0] w8;
    input [7:0] w9;
    
    input [7:0] k1;
    input [7:0] k2;
    input [7:0] k3;
    
    input [7:0] k4;
    input [7:0] k5;
    input [7:0] k6;
    
    input [7:0] k7;
    input [7:0] k8;
    input [7:0] k9;
    
    output [8:0] sum;

    assign sum = w1*k1+w2*k2+w3*k3+w4*k4+w5*k5+w6*k6+w7*k7+w8*k8+w9*k9;
    
endmodule
