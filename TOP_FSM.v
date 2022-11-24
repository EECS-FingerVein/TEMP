`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2022 09:11:11 PM
// Design Name: 
// Module Name: TOP_FSM
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


module TOP_FSM(clk, trigger, finA, finB, 
                addr_add, start, push);
    input clk;
    input trigger;
    input finA;
    input finB;
    
    output reg addr_add;
    output reg start;
    output reg push; //?
    
    reg [1:0] state, nstate;
    parameter idle=0, save=1, conv=2, send=3;
    
    initial begin 
        state <= idle;
        end
        
    always @ (posedge clk) begin
        state <= nstate;
        end
        
    always @ (*) begin
        case(state)
            idle : begin
                addr_add <= 1'b0;
                start <= 1'b0;
                if (trigger)
                    nstate <= save;
                else 
                    nstate <= idle;
                end
            
            save : begin
                addr_add <= 1'b1;
                start <= 1'b0;
                if (finA) 
                    nstate <= conv;
                else 
                    nstate <= save;
                end
                
            conv : begin
                addr_add <= 1'b0;
                start <= 1'b1;
                if (finB)
                    nstate <= send;
                else 
                    nstate <= conv;
                end
            
            send : begin
                addr_add <= 1'b0;
                start <= 1'b0;
                nstate <= idle;
                end
            endcase
        end
    
endmodule
