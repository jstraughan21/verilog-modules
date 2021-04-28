//--------------------------------------------------------------------
//
//  Company:    University of Wyoming
//  Engineer:   Jake Straughan
//  Module:     counter_0_to_9.v
//  Version:    1.0.0
//  Date        04/27/2021
//
//--------------------------------------------------------------------

module counter_0_to_9(digit, en, clk, rst);
    output [3:0] digit;
    input  en;
    input  clk;
    input  rst;

    reg [3:0] count, nCount;

    always @(posedge clk) begin
        if (rst == 1) 
            count <= 4'b0000;
        else if (en == 1)
            count <= nCount;
        else
            count <= count;
    end

    always @(count) begin
        case (count)
            4'h0:   nCount = 4'h1;
            4'h1:   nCount = 4'h2;
            4'h2:   nCount = 4'h3;
            4'h3:   nCount = 4'h4;
            4'h4:   nCount = 4'h5;
            4'h5:   nCount = 4'h6;
            4'h6:   nCount = 4'h7;
            4'h7:   nCount = 4'h8;
            4'h8:   nCount = 4'h9;
            4'h9:   nCount = 4'h0;
            default: nCount = 4'h0; 
        endcase
    end

    assign digit = count;
    
endmodule