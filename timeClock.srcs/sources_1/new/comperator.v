`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 16:24:26
// Design Name: 
// Module Name: comperator
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


module comperator(
        input[6:0] i_msec,
        output[3:0] o_fnd_dp
    );

    assign o_fnd_dp = (i_msec < 50) ? 11 : 10;
endmodule
