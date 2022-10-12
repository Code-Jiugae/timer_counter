`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 13:33:09
// Design Name: 
// Module Name: digit_divider_sec_msec
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


module digit_divider_sec_msec(
        input [5:0] i_sec, 
        input [6:0] i_msec,
        output [3:0] o_sec_10, o_sec_1, o_msec_10, o_msec_1 
    );

    assign o_sec_10 = i_sec / 10 % 10;
    assign o_sec_1 = i_sec % 10;
    
    assign o_msec_10 = i_msec / 10 % 10;
    assign o_msec_1 = i_msec % 10;
endmodule
