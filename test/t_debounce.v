//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     t_debounce.v
//  Version:    1.0.0
//  Date        04/28/2021
//
//--------------------------------------------------------------------

`timescale 1ns/100ps

module t_debounce;
    wire t_sigOut;
    reg  t_sigIn;
    reg  t_clk;
    reg  t_rst;

    debounce    uut(t_sigOut, t_sigIn, t_clk, t_rst);

    initial #1000 $finish;

    initial begin
        t_clk = 0;
        forever #5 t_clk = ~t_clk;
    end

    initial begin
        $dumpfile("wavedata.vcd");
        $dumpvars(0, t_debounce);
    end

    initial begin
             t_rst = 0;
             t_sigIn = 0;
        #2   t_rst = 1;
        #10  t_rst = 0;
        #20  t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #1   t_sigIn = 0;
        #1   t_sigIn = 1;
        #200 t_sigIn = 0;
    end
endmodule