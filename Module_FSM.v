`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2022 04:31:29 PM
// Design Name: 
// Module Name: FSM
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


module Module_FSM(clk,start,filled,multi_act,pushpixel,writepixel);
    input clk;
    input start;
    input filled;
                
    output reg pushpixel;
    output reg multi_act;
    output reg writepixel;
                
    reg [1:0] state, nstate;
    parameter idle=0, push=1, cal=2, write=3;
                
    initial begin
        state <= idle;
        end
    
    always @ (posedge clk) begin
        state <= nstate;
        end
    
    always @ (*) begin
        case (state)
                
            idle : begin
                pushpixel <= 1'b0;
                multi_act <= 1'b0;
                writepixel <= 1'b0;
                if (start)
                    nstate <= push;
                else 
                    nstate <= idle;
                end
                
            push : begin
                pushpixel <= 1'b1;
                multi_act <= 1'b0;
                writepixel <= 1'b0;
                if (filled)
                    nstate <= cal;
                else
                    nstate <= push;
                end
                
            cal : begin
                pushpixel <= 1'b0;
                multi_act <= 1'b1;
                writepixel <= 1'b0;
                nstate <= write;
                end
                
            write : begin
                pushpixel <= 1'b0;
                multi_act <= 1'b0;
                writepixel <= 1'b1;
                nstate <= push;
                end
                
            endcase
        end
        
endmodule
