//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     t_seven_seg_decoder.v
//  Version:    1.0.0
//  Date        04/27/2021
//
//--------------------------------------------------------------------

`timescale 1ns/100ps

module t_seven_seg_decoder;
    wire [6:0] t_seg;
    reg  [3:0] t_digit;

    seven_seg_decoder   uut(t_seg, t_digit);

    initial #1000 $finish;

    initial begin
        $dumpfile("wavedata.vcd");
        $dumpvars(0, t_seven_seg_decoder);
    end

    initial begin
             t_digit = 4'h0;
        #10  t_digit = 4'h1;
        #10  t_digit = 4'h2;
        #10  t_digit = 4'h3;
        #10  t_digit = 4'h4;
        #10  t_digit = 4'h5;
        #10  t_digit = 4'h6;
        #10  t_digit = 4'h7;
        #10  t_digit = 4'h8;
        #10  t_digit = 4'h9;
        #10  t_digit = 4'hA;
        #10  t_digit = 4'hB;
        #10  t_digit = 4'hC;
        #10  t_digit = 4'hD;
        #10  t_digit = 4'hE;
        #10  t_digit = 4'hF;
    end
endmodule