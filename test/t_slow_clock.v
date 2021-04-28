//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     slow_clock.v
//  Version:    1.0.0
//  Date        04/27/2021
//
//--------------------------------------------------------------------

`timescale 1ns/100ps

module t_slow_clock;
    wire t_clkOut;
    reg  t_clkIn;
    reg  t_rst;

    slow_clock      uut(t_clkOut, t_clkIn, t_rst);

    initial #1000 $finish;

    initial begin
        t_clkIn = 0;
        forever #5 t_clkIn = ~t_clkIn;
    end

    initial begin
        $dumpfile("wavedata.vcd");
        $dumpvars(0, t_slow_clock);
    end

    initial begin
             t_rst = 0;
        #2   t_rst = 1; 
        #10  t_rst = 0;

    end
endmodule