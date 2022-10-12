`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/12 14:10:27
// Design Name: 
// Module Name: top_time_clock
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


module top_time_clock(
        input i_clk, i_mode_sw, i_reset, i_on_off,
        output [3:0] o_digitPosition,
        output[7:0] o_font
    );
    wire w_clk_1khz;
    wire[2:0] w_counter;
    wire[5:0] w_hour, w_min, w_sec;
    wire[6:0] w_msec;

    wire[3:0] w_hour_10, w_hour_1, w_min_10, w_min_1, w_sec_10, w_sec_1, w_msec_10, w_msec_1;
    wire[3:0] w_hour_min, w_sec_msec;
    wire[3:0] w_result;

    clock_divider clk_divider(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk_1khz)
    );
    counter_fnd cnt_fnd(
        .i_clk(w_clk_1khz),
        .i_reset(i_reset),
        .o_counter(w_counter)
    );

    decoder_fnd_digit decode_fnd(
        .i_select(w_counter),
        .o_digitPosition(o_digitPosition)
    );






    time_clock_counter time_clk_cnt(
        .i_clk(w_clk_1khz),
        .i_reset(i_reset),
        .o_hour(w_hour), 
        .o_min(w_min), 
        .o_sec(w_sec),
        .o_msec(w_msec)
    );

    digit_divider_hour_min digit_divider_h_m(
        .i_hour(w_hour), 
        .i_min(w_min),
        .o_hour_10(w_hour_10), 
        .o_hour_1(w_hour_1), 
        .o_min_10(w_min_10), 
        .o_min_1(w_min_1) 
    );

    digit_divider_sec_msec digit_divier_s_ms(
        .i_sec(w_sec), 
        .i_msec(w_msec),
        .o_sec_10(w_sec_10), 
        .o_sec_1(w_sec_1), 
        .o_msec_10(w_msec_10), 
        .o_msec_1(w_msec_1) 
    );

    wire[3:0] w_fnd_dp;

    comperator compare(
        .i_msec(w_msec),
        .o_fnd_dp(w_fnd_dp)
    );

    mux_8x1 mux_81_h_m(
        .i_a(w_min_1), 
        .i_b(w_min_10), 
        .i_c(w_hour_1), 
        .i_d(w_hour_10),

        .i_a1(11), 
        .i_b1(11), 
        .i_c1(w_fnd_dp), 
        .i_d1(11),

        .i_sel(w_counter),
        .o_y(w_hour_min)
    );

    mux_8x1 mux_81_s_ms(
        .i_a(w_msec_1), 
        .i_b(w_msec_10), 
        .i_c(w_sec_1), 
        .i_d(w_sec_10),

        .i_a1(11), 
        .i_b1(11), 
        .i_c1(w_fnd_dp), 
        .i_d1(11),

        .i_sel(w_counter),
        .o_y(w_sec_msec)
    );

    mux_2x1 mux_21(
        .i_a(w_hour_min), 
        .i_b(w_sec_msec),
        .i_sel(i_mode_sw),
        .o_y(w_result)
    );

    bcd2fnd_decoder bcd2fnd(
        .i_value(w_result),
        .i_on_off(i_on_off),
        .o_font(o_font)
    );

endmodule
