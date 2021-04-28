//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     t_counter_0_to_9.v
//  Version:    1.0.0
//  Date        04/27/2021
//
//--------------------------------------------------------------------

`timescale 1ns/100ps

module t_counter_0_to_9();
    wire [3:0] t_digit;
    reg  t_en;
    reg  t_clk;
    reg  t_rst;

    counter_0_to_9      uut(t_digit, t_en, t_clk, t_rst);

    initial #1000 $finish;

    initial begin
        t_clk = 0;
        forever #5 t_clk = ~t_clk;
    end

    initial begin
        $dumpfile("wavedata.vcd");
        $dumpvars(0, t_counter_0_to_9);
    end

    initial begin
             t_rst = 0;
             t_en = 0;
        #2   t_rst = 1;
        #10  t_rst = 0;
        #30  t_en = 1;
        #200 t_rst = 1;
    end
endmodule