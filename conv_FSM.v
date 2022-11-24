`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2022 09:05:02 PM
// Design Name: 
// Module Name: conv_FSM
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


module conv_FSM(clk,start,done_in,pass_in,done_out,pass_out);
    
    input clk;
    input start;
    input done_in;
    input pass_in;
    
    output reg done_out;
    output reg pass_out;
    
    reg [1:0] state, nstate;
    parameter idle=0, pass=1, done=2;
    
    initial begin
        state <= idle;
        end
        
    always @ (posedge clk) begin
        state <= nstate;
        end
        
    always @ (*) begin
        case (state)
        
            idle : begin
                pass_out <= 1'b0;
                done_out <= 1'b0;
                if (start)
                    nstate <= pass;
                else
                    nstate <= idle;
                end
            
            pass : begin
                pass_out <= 1'b1;
                done_out <= 1'b0;
                nstate <= state;
                end
                
            done : begin
                pass_out <= 1'b0;
                if (done_in) begin
                    nstate <= pass;
                    done_out <= 1'b1;
                    end
                else begin
                    nstate <= done;
                    done_out <= 1'b0;
                    end
                end
                
            endcase
        end
    
endmodule
