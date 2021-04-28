//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     slow_clock.v
//  Version:    1.0.0
//  Date        04/27/2021
//
//--------------------------------------------------------------------

module slow_clock(clkOut, clkIn, rst);
    output clkOut; 
    input  clkIn;
    input  rst;

    reg clkOut = 0;
    reg [22:0] delay, nDelay;

    //parameter CYCLES = 23'd4999999;
    parameter CYCLES = 23'd10;

    always @(posedge clkIn) begin
        if (rst == 1)
            delay <= 23'd0;
        else
            delay <= nDelay;
    end

    always @(delay) begin
        nDelay = (delay == CYCLES) ? 23'd0 : delay + 23'd1;
    end

    always @(delay) begin
        clkOut = (delay == CYCLES) ? ~clkOut : clkOut;
    end

endmodule