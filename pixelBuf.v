`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2022 03:14:06 PM
// Design Name: 
// Module Name: pixelBuf
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


module pixelBuf(pushpixel,reset,din,dout,w1,w2,w3);
    input pushpixel;
    input reset;
    input [8:0] din;
    
    output [8:0] w1;
    output [8:0] w2;
    output [8:0] w3;
    output [8:0] dout;
    
    //declare pixel buffer. a counter is required for the array address.
    reg [10:0] count;
    reg [8:0] buffer [0:179];
    
    integer i;
    
    initial begin 
        count <= 0;
        i <= 0;
        end
    
    assign dout = count<180?0:buffer[0];
    
    //assign register data to window regs.
    assign w1 = buffer[0];
    assign w2 = buffer[1];
    assign w3 = buffer[2];
    
    /*reg size == image width (+2?) ??? */
    /*padding zero at the boundary of the image. -yet*/

    always @ (posedge pushpixel) begin // fill the buffer before pushing any pixel out,
        count <= count+1;              // so the upper limit of 'count' depends on image width.
        if (count<180) begin
            buffer[count] <= din;
            end
        else begin
            $display("out = %d",buffer[0]);
            
            for (i=0;i<179;i=i+1) begin   //push width-1 time.
                buffer[i] <= buffer[i+1];
                
                end
                
            buffer[179] <= din;//buffer[width-1] is simultaneously an input receiver and a pixel buffer.
            end
            // shift register data, reg[3]->reg[2], 2->1, 1->out.
        end
    
    
endmodule
