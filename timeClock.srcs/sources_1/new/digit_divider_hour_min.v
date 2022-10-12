`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 13:32:51
// Design Name: 
// Module Name: digit_divider_hour_min
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


module digit_divider_hour_min(
        input [5:0] i_hour, i_min,
        output [3:0] o_hour_10, o_hour_1, o_min_10, o_min_1 
    );

    
    assign o_hour_10 = i_hour / 10 % 10;
    assign o_hour_1 = i_hour % 10;
    
    assign o_min_10 = i_min / 10 % 10;
    assign o_min_1 = i_min % 10;
    
endmodule
