//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     debounce.v
//  Version:    1.0.0
//  Date        04/28/2021
//
//--------------------------------------------------------------------

module debounce(sigOut, sigIn, clk, rst);
    output sigOut;
    input  sigIn;
    input  clk;
    input  rst;

    reg sigOut;
    reg sync0, sync1;
    reg [22:0] count, nCount;

    //parameter WAIT = 23'd4999999;
    parameter WAIT = 23'd10;

    always @(posedge clk) begin
        if (rst == 1)
            sync0 <= 0;
        else
            sync0 <= sigIn;
    end  

    always @(posedge clk) begin
        if (rst == 1)
            sync1 <= 0;
        else
            sync1 <= sync0;
    end

    always @(posedge clk) begin
        if (rst == 1)
            count <= 23'd0;
        else if (sync0 ^ sync1)
            count <= 23'd0;
        else 
            count <= nCount;
    end

    always @(count) begin
        nCount = (count == WAIT) ? 23'd0 : count + 23'd1;
    end

    always @(posedge clk) begin
        if (rst == 1)
            sigOut <= 0;
        else
            sigOut <= (count == WAIT) ? sync1 : sigOut;
    end
endmodule